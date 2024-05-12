(defun dnd/run-dnd-command (dnd-command)
  "Run given dnd command as a shell command"
  (interactive)
  (shell-command (concat "export PATH=$PATH:~/bin && dnd " dnd-command) "*DnD Output*"))

(defun dnd/npc ()
  "Generate NPC"
  (interactive)
  (dnd/run-dnd-command "npc"))

(defun dnd/urban ()
  "Generate urban location"
  (interactive)
  (dnd/run-dnd-command "urban"))

(defun dnd/keywords ()
  "Generate urban location"
  (interactive)
  (let ((num (read-string "Number of Keywords (2): " nil nil "2")))
    (dnd/run-dnd-command (concat "kw " num))))

(defun dnd/roll ()
  "Roll dice <dice>+-<modifier>"
  (interactive)
  (let ((dice (read-string "Roll <dice>+-<modifier>: ")))
    (dnd/run-dnd-command (concat "roll " dice))))

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

(defun dnd/event ()
  "Generate event"
  (interactive)
  (dnd/run-dnd-command "event"))

(defun dnd/combat ()
  "Generate combat description"
  (interactive)
  (dnd/run-dnd-command "combat"))
