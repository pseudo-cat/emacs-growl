;;; growl.el --- Growl wrapper

;; Copyright (C) 2008  Takeru Naito

;; Author: Takeru Naito <takeru.naito@gmail.com>
;; Keywords: growl, mac

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; * Description
;;
;; growl.el simply Growl wrapper.
;;
;; NOTE: This code require growlnotify(1).
;; See http://growl.info/extraps.php
;;
;; * Usage
;;
;; Just put the code like below into your .emacs:
;;
;; (require 'growl)
;;
;; (growl message)

;;; Change Log:

;; 2008-12-23:
;;  * Initial import.

;;; Code:

(when (executable-find "growlnotify")

  (defun growlnotify (message &optional app-name)
    (start-process "growlnotify" "*Messages*"
                   "growlnotify"
                   "--message" message
                   "--appIcon" (or app-name "Emacs")))

  (defalias 'growl 'growlnotify)

  (growl "growl.el loaded.")

  (provide 'growl))

;;; growl.el ends here

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; indent-tabs-mode: nil
;; End: