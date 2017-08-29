api = 2
core = 7.x

;--------------------
; Specify defaults
;--------------------

defaults[projects][subdir] = contrib

;--------------------
; Bootstrap Theme
;--------------------

projects[bootstrap] = 3.14
projects[jquery_update] = 3.0-alpha5
projects[less] = 4.0

libraries[bootstrap][directory_name] = bootstrap
libraries[bootstrap][download][type] = get
libraries[bootstrap][download][url] = https://github.com/twbs/bootstrap/archive/v3.3.7.zip

libraries[lessphp][directory_name] = lessphp
libraries[lessphp][download][type] = get
libraries[lessphp][download][url] = https://github.com/oyejorge/less.php/archive/v1.7.0.10.tar.gz

;--------------------
; Custom
;--------------------

projects[qtrclient][type] = module
projects[qtrclient][download][type] = git
projects[qtrclient][download][url] = https://github.com/Q-Translate/qtrclient.git
projects[qtrclient][download][branch] = 7.x-2.x

;--------------------
; Contrib
;--------------------

;;; Development
projects[devel] = 1.5
;projects[coder] = 1.2
projects[diff] = 3.3

;;; Extensions
projects[ctools] = 1.12
projects[libraries] = 2.3
projects[entity] = 1.8
projects[xautoload] = 5.7
projects[token] = 1.7
projects[rules] = 2.10
projects[pathauto] = 1.3
projects[subpathauto] = 1.3

;;; User interface
projects[context] = 3.7
projects[views] = 3.17
projects[homebox] = 2.0-rc1
projects[boxes] = 1.2
projects[edit_profile] = 1.0-beta2
projects[wysiwyg] = 2.4

;;; Security
projects[captcha] = 1.4
projects[recaptcha] = 2.2
projects[honeypot] = 1.22
projects[user_restrictions] = 1.0

;;; Features
projects[features] = 2.10
projects[strongarm] = 2.0
projects[features_extra] = 1.0
projects[node_export] = 3.1
projects[uuid] = 1.0

;projects[defaultconfig][version] = 1.x-dev
;projects[defaultconfig][patch][1900574] = https://www.drupal.org/files/issues/1900574.defaultconfig.undefinedindex_13.patch

;;; Admin Utils
projects[module_filter] = 2.1
projects[drush_language] = 1.5
projects[delete_all] = 1.1
projects[l10n_update] = 2.1

;;; Performance
projects[boost] = 1.2

;;; Services and Social
projects[google_analytics] = 2.3
projects[drupalchat] = 1.7
projects[simplenews] = 1.1
projects[mass_contact] = 1.1

;--------------------
; Sending Emails
;--------------------

projects[mailsystem] = 2.34
projects[mimemail] = 1.0
projects[reroute_email] = 1.2

projects[phpmailer] = 3.0-beta3

libraries[phpmailer][directory_name] = phpmailer
libraries[phpmailer][download][type] = get
libraries[phpmailer][download][url] = https://github.com/PHPMailer/PHPMailer/archive/v5.2.24.zip

;--------------------
; Libraries
;--------------------

libraries[tinymce][directory_name] = tinymce
libraries[tinymce][download][type] = get
libraries[tinymce][download][url] = https://github.com/tinymce/tinymce/archive/4.1.6.zip

;--------------------
; Misc
;--------------------

projects[menu_target] = 1.6
projects[menu_import] = 1.7
rojects[advuser] = 3.x-dev
