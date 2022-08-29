extends Node2D

func _on_run_dialog_body_entered(body):
	if body.is_in_group("player"):
		body.display_run_dialog()

func _on_run_dialog_body_exited(body):
	if body.is_in_group("player"):
		body.clear_label()


