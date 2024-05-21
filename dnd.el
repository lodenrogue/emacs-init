(defun dnd/run-dnd-command (dnd-command)
  "Run given dnd command as a shell command, put results in a buffer, and return results"
  (interactive)
  (let ((output (shell-command-to-string (concat "export PATH=$PATH:~/bin && dnd " dnd-command)))
	(dnd-buffer (get-buffer-create "*DnD Output*")))
    (with-current-buffer dnd-buffer
      (erase-buffer)
      (insert output))
    output))

(defun dnd/npc ()
  "Generate NPC"
  (interactive)
  (dnd/run-dnd-command "npc"))

(defun dnd/print-npc ()
  "Print results of running npc command as a message"
  (interactive)
  (message (dnd/npc)))

(defun dnd/insert-npc ()
  "Insert results of running npc command"
  (interactive)
  (insert (dnd/npc)))

(defun dnd/urban ()
  "Generate urban location"
  (interactive)
  (dnd/run-dnd-command "urban"))

(defun dnd/insert-urban ()
  "Insert results of running urban command"
  (interactive)
  (insert (dnd/urban)))

(defun dnd/keywords ()
  "Generate urban location"
  (interactive)
  (let ((num (read-string "Number of Keywords (2): " nil nil "2")))
    (dnd/run-dnd-command (concat "kw " num))))

(defun dnd/print-keywords ()
  "Print results of running keywords command as a message"
  (interactive)
  (message (dnd/keywords)))

(defun dnd/insert-keywords ()
  "Insert results of running keywords command"
  (interactive)
  (insert (dnd/keywords)))

(defun dnd/roll ()
  "Roll dice <dice>+-<modifier>"
  (interactive)
  (let ((dice (read-string "Roll <dice>+-<modifier>: ")))
    (dnd/run-dnd-command (concat "roll " dice))))

(defun dnd/print-roll ()
  "Print results of running roll command as a message"
  (interactive)
  (message (dnd/roll)))

(defun dnd/insert-roll ()
  "Insert results of running roll command"
  (interactive)
  (insert (dnd/roll)))

(defun dnd/oracle ()
  "Ask the oracle a yes/no question.
 - Chaos factor ranges from 1 to 9
 - Odds range from -4 to 6 with 0 being 50/50
      -4 Impossible
      -3 No way
      -2 Very unlikely
      -1 Unlikely
       0 50/50
       1 Somewhat likely
       2 Likely
       3 Very likely
       4 Near a sure thing
       5 A sure thing
       6 Has to be"
  (interactive)
  (let ((chaos-factor (read-string "Chaos Factor (1 to 9): "))
  (odds (read-string "Odds (-4 to 6): ")))
    (dnd/run-dnd-command (concat "oracle " chaos-factor " " odds))))

(defun dnd/print-oracle ()
  "Print results of running oracle command as a message"
  (interactive)
  (message (dnd/oracle)))

(defun dnd/insert-oracle ()
  "Insert results of running oracle command"
  (interactive)
  (insert (dnd/oracle)))

(defun dnd/event ()
  "Generate event"
  (interactive)
  (dnd/run-dnd-command "event"))

(defun dnd/print-event ()
  "Print results of running event command as a message"
  (interactive)
  (message (dnd/event)))

(defun dnd/insert-event ()
  "Insert results of running event command"
  (interactive)
  (insert (dnd/event)))

(defun dnd/combat ()
  "Generate combat description"
  (interactive)
  (dnd/run-dnd-command "combat"))

(defun dnd/print-combat ()
  "Print results of running combat command as a message"
  (interactive)
  (message (dnd/combat)))

(defun dnd/insert-combat ()
  "Insert results of running combat command"
  (interactive)
  (insert (dnd/combat)))
