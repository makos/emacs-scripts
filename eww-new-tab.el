(defun eww-new-tab-url (&optional url)
  "Open new buffer with eww-mode enabled if no argument is given, or open URL or search for keywords if specified."
  (interactive "sURL or keywords: \n")
  (let ((has-url (if (not (string= "" url))
                     t
                   nil)))
    (let ((newbuf (get-buffer-create (if has-url
                                       (generate-new-buffer-name url)
                                     (generate-new-buffer-name "Empty eww tab")))))
    (if has-url (with-current-buffer newbuf (eww-mode) (eww url))
      (with-current-buffer newbuf (eww-mode)))
    (display-buffer newbuf)
    (if (not has-url) (other-window 1)))))
