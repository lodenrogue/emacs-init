(defun my/grab-selected-text ()
  "Grab the text selected in visual mode and return it as a string."
  (interactive)
  (when (region-active-p)
    (let ((start (region-beginning))
	  (end (region-end)))
      (buffer-substring-no-properties start end))))
