;; -*-lisp-*-

(in-package :stumpwm)

(set-prefix-key (kbd "C-q"))

;; Visual stuff.
(setf *message-window-gravity* :center
      *input-window-gravity*   :center
      *startup-message*        nil
      *window-format*          "%n %s %c - %t"
      *window-border-style*    :tight
      *window-border-width*    1
      *maxsize-border-width*   1
      *transient-border-width* 1
      *normal-border-width*    1)

;; Gaps.
(load-module "swm-gaps")
(setf swm-gaps:*outer-gaps-size* 15)
; (swm-gaps:toggle-gaps-on)

;; Saves some time.
(setf *timeout-wait* 2)

;; Annoying to see.
(setf *ignore-wm-inc-hints* t)

;; Brightness control.
(defcommand brightness-up () ()
  "Raises brightness."
  (run-shell-command "light -A 5"))

(defcommand brightness-down () ()
  "Decreases brightness."
  (run-shell-command "light -U 5"))

(define-key *root-map* (kbd "Up") "brightness-up")
(define-key *root-map* (kbd "Down") "brightness-down")

;; Volume control
(defcommand volume-up () ()
  "Raises volume."
  (run-shell-command "pactl set-sink-volume @DEFAULT_SINK@ +5%"))

(defcommand volume-down () ()
  "Decreases volume."
  (run-shell-command "pactl set-sink-volume @DEFAULT_SINK@ -5%"))

(define-key *root-map* (kbd "Right") "volume-up")
(define-key *root-map* (kbd "Left")  "volume-down")

;; Float/unfloat windows.
(define-key *root-map* (kbd "f") "float-this")
(define-key *root-map* (kbd "F") "unfloat-this")

;; Groups i.e. workspaces.
(setf (group-name (car (screen-groups (current-screen))))
      "work")
(gnewbg "media")
(gnewbg "misc")
(gnewbg "social")

(define-key *root-map* (kbd "C-w") "vgroups")
(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")

(clear-window-placement-rules)
(define-frame-preference "media" (0 nil t :class "mpv"))
(define-frame-preference "media" (0 nil t :class "Gimp"))
(define-frame-preference "social" (0 nil t :class "TelegramDesktop"))

;; Randomize background.
(defcommand randomize-wallpaper () ()
  "randomize the wallpaper"
  (run-shell-command "~/dotfiles/scripts/setbg"))
(define-key *root-map* (kbd "B") "randomize-wallpaper")

;; Run programs.
(define-key *root-map* (kbd "c") "exec kitty")
(define-key *root-map* (kbd ".") "exec scrot -s ~/documents/pictures/screenshots/shot.png")

;; Autostart.
(run-shell-command "xsetroot -cursor_name left_ptr")
(run-shell-command "~/dotfiles/scripts/setkb")
(randomize-wallpaper)
(run-shell-command "nm-applet")
(run-shell-command "~/dotfiles/polybar/.config/polybar/launcher")

(run-shell-command "transmission-gtk")

