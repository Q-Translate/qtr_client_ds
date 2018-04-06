cmd_backup_help() {
    cat <<_EOF
    backup [full | data | <app>]
        'full' make a full backup of everything
        'data' make a backup of the important data only
        <app> can be 'bcl', 'bcl_dev', etc.

_EOF
}

cmd_backup() {
    set -x
    local arg=${1:-full}
    case $arg in
        full)
            _make_full_backup
            ;;
        data)
            ds inject backup.sh
            ;;
        *)
            _make_app_backup $arg
            ;;
    esac
}

_make_app_backup() {
    local app=${1:-qcl}

    # create the backup dir
    local backup="backup-$app-$(date +%Y%m%d)"
    rm -rf $backup
    rm -f $backup.tgz
    mkdir $backup

    # disable the site for maintenance
    ds exec drush @$app vset maintenance_mode 1

    # clear the cache
    ds exec drush @$app cache-clear all

    # dump the content of the databases
    ds exec drush @$app sql-dump --ordered-dump \
           --result-file=/host/$backup/$app.sql

    # copy app files to the backup dir
    cp -a var-www/$app $backup

    # make the backup archive
    tar --create --gzip --preserve-permissions --file=$backup.tgz $backup/
    rm -rf $backup/

    # enable the site
    ds exec drush @$app vset maintenance_mode 0
}

_make_full_backup() {
    # create the backup dir
    local backup="backup-full-$(date +%Y%m%d)"
    rm -rf $backup
    rm -f $backup.tgz
    mkdir $backup

    # disable the site for maintenance
    ds exec drush --yes @local_qcl vset maintenance_mode 1

    # clear the cache
    ds exec drush --yes @local_qcl cache-clear all

    # dump the content of the database
    ds exec drush @qcl sql-dump --ordered-dump \
       --result-file=/host/$backup/qcl.sql

    # copy app files to the backup dir
    cp -a var-www/{qcl,downloads} $backup/

    # backup also the qcl_dev
    if [[ -d var-www/qcl_dev ]]; then
        ds exec drush @qcl_dev sql-dump --ordered-dump \
           --result-file=/host/$backup/qcl_dev.sql
        cp -a var-www/qcl_dev $backup/
    fi

    # make the backup archive
    tar --create --gzip --preserve-permissions --file=$backup.tgz $backup/
    rm -rf $backup/

    # enable the site
    ds exec drush --yes @local_qcl vset maintenance_mode 0
}
