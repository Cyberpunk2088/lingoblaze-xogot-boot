extends Control

const SAVE_PATH := "user://lingoblaze_boot_progress.json"

var feedback_label: Label
var progress_label: Label
var restart_button: Button
var answer_buttons: Array[Button] = []

var launch_count := 0
var boot_completed := false


func _ready() -> void:
	_build_interface()
	_load_progress()
	launch_count += 1
	_save_progress()
	_refresh_progress()

	if boot_completed:
		_set_feedback(
			"Willkommen zurück – dein lokaler Fortschritt wurde geladen.",
			Color("#76F7C5")
		)


func _build_interface() -> void:
	var background := ColorRect.new()
	background.color = Color("#05091A")
	background.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(background)
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	var glow := ColorRect.new()
	glow.color = Color("#102A56")
	glow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(glow)
	glow.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	glow.modulate = Color(1.0, 1.0, 1.0, 0.34)

	var outer_margin := MarginContainer.new()
	outer_margin.add_theme_constant_override("margin_left", 24)
	outer_margin.add_theme_constant_override("margin_top", 32)
	outer_margin.add_theme_constant_override("margin_right", 24)
	outer_margin.add_theme_constant_override("margin_bottom", 32)
	add_child(outer_margin)
	outer_margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	var page := VBoxContainer.new()
	page.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	page.size_flags_vertical = Control.SIZE_EXPAND_FILL
	page.add_theme_constant_override("separation", 18)
	outer_margin.add_child(page)

	page.add_child(_make_spacer())

	var title := Label.new()
	title.text = "LINGOBLAZE"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 42)
	title.add_theme_color_override("font_color", Color("#FFB21C"))
	page.add_child(title)

	var subtitle := Label.new()
	subtitle.text = "Speak. Play. Conquer."
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.add_theme_font_size_override("font_size", 18)
	subtitle.add_theme_color_override("font_color", Color("#B9C9E8"))
	page.add_child(subtitle)

	var status := Label.new()
	status.text = "XOGOT BOOT 001  •  OFFLINE  •  GDSCRIPT"
	status.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	status.add_theme_font_size_override("font_size", 12)
	status.add_theme_color_override("font_color", Color("#7EDBFF"))
	page.add_child(status)

	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _make_panel_style())
	page.add_child(panel)

	var content := VBoxContainer.new()
	content.add_theme_constant_override("separation", 14)
	panel.add_child(content)

	var chapter := Label.new()
	chapter.text = "THE SILENT STATION — SYSTEMTEST"
	chapter.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	chapter.add_theme_font_size_override("font_size", 13)
	chapter.add_theme_color_override("font_color", Color("#8DA8D4"))
	content.add_child(chapter)

	var question := Label.new()
	question.text = "Was bedeutet das englische Wort:\n\nHELLO"
	question.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	question.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	question.add_theme_font_size_override("font_size", 24)
	question.add_theme_color_override("font_color", Color("#F5F8FF"))
	content.add_child(question)

	_add_answer_button(content, "Hallo", true)
	_add_answer_button(content, "Tschüss", false)
	_add_answer_button(content, "Danke", false)

	feedback_label = Label.new()
	feedback_label.text = "Tippe auf die richtige Übersetzung."
	feedback_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	feedback_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	feedback_label.custom_minimum_size = Vector2(0, 54)
	feedback_label.add_theme_font_size_override("font_size", 16)
	feedback_label.add_theme_color_override("font_color", Color("#C8D5EC"))
	content.add_child(feedback_label)

	restart_button = _make_button("Test erneut ausführen", true)
	restart_button.visible = false
	restart_button.pressed.connect(_on_restart_pressed)
	content.add_child(restart_button)

	progress_label = Label.new()
	progress_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	progress_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	progress_label.add_theme_font_size_override("font_size", 13)
	progress_label.add_theme_color_override("font_color", Color("#9FB1D0"))
	page.add_child(progress_label)

	var footer := Label.new()
	footer.text = "Keine Cloud • keine Werbung • Fortschritt nur lokal"
	footer.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	footer.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	footer.add_theme_font_size_override("font_size", 12)
	footer.add_theme_color_override("font_color", Color("#7185A8"))
	page.add_child(footer)

	page.add_child(_make_spacer())


func _add_answer_button(parent: VBoxContainer, text: String, is_correct: bool) -> void:
	var button := _make_button(text)
	button.pressed.connect(_on_answer_selected.bind(text, is_correct))
	answer_buttons.append(button)
	parent.add_child(button)


func _make_button(text: String, accent: bool = false) -> Button:
	var button := Button.new()
	button.text = text
	button.custom_minimum_size = Vector2(0, 60)
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_color", Color("#F6F9FF"))
	button.add_theme_color_override("font_hover_color", Color("#FFFFFF"))
	button.add_theme_color_override("font_pressed_color", Color("#FFFFFF"))
	button.add_theme_color_override("font_disabled_color", Color("#71809A"))

	var normal := StyleBoxFlat.new()
	normal.bg_color = Color("#243B68") if not accent else Color("#A85D00")
	normal.border_color = Color("#3E5F96") if not accent else Color("#E49725")
	normal.set_border_width_all(1)
	normal.set_corner_radius_all(16)
	button.add_theme_stylebox_override("normal", normal)

	var hover := normal.duplicate() as StyleBoxFlat
	hover.bg_color = Color("#315184") if not accent else Color("#C87300")
	button.add_theme_stylebox_override("hover", hover)

	var pressed := normal.duplicate() as StyleBoxFlat
	pressed.bg_color = Color("#172A4E") if not accent else Color("#7F4600")
	button.add_theme_stylebox_override("pressed", pressed)

	var disabled := normal.duplicate() as StyleBoxFlat
	disabled.bg_color = Color("#14213A")
	disabled.border_color = Color("#243653")
	button.add_theme_stylebox_override("disabled", disabled)

	return button


func _make_panel_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#101D38")
	style.border_color = Color("#294A7E")
	style.set_border_width_all(1)
	style.set_corner_radius_all(24)
	style.content_margin_left = 22.0
	style.content_margin_top = 24.0
	style.content_margin_right = 22.0
	style.content_margin_bottom = 24.0
	return style


func _make_spacer() -> Control:
	var spacer := Control.new()
	spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	return spacer


func _on_answer_selected(answer: String, is_correct: bool) -> void:
	if is_correct:
		boot_completed = true
		_save_progress()
		_set_feedback(
			"Richtig. HELLO bedeutet HALLO. Touch und lokales Speichern funktionieren.",
			Color("#76F7C5")
		)
		for button in answer_buttons:
			button.disabled = true
		restart_button.visible = true
	else:
		_set_feedback(
			"%s ist noch nicht richtig. Höre innerlich: HELLO = HALLO." % answer,
			Color("#FF9A9A")
		)

	_refresh_progress()


func _on_restart_pressed() -> void:
	for button in answer_buttons:
		button.disabled = false
	restart_button.visible = false
	_set_feedback("Tippe erneut auf die richtige Übersetzung.", Color("#C8D5EC"))


func _set_feedback(message: String, color: Color) -> void:
	feedback_label.text = message
	feedback_label.add_theme_color_override("font_color", color)


func _refresh_progress() -> void:
	var test_status := "bestanden" if boot_completed else "offen"
	progress_label.text = "Lokaler Startzähler: %d  •  Lern-Test: %s" % [launch_count, test_status]


func _load_progress() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var raw_data := FileAccess.get_file_as_string(SAVE_PATH)
	var parsed: Variant = JSON.parse_string(raw_data)
	if parsed is Dictionary:
		var data := parsed as Dictionary
		launch_count = maxi(0, int(data.get("launch_count", 0)))
		boot_completed = bool(data.get("boot_completed", false))


func _save_progress() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		return

	var payload := {
		"launch_count": launch_count,
		"boot_completed": boot_completed,
		"schema_version": 1
	}
	file.store_string(JSON.stringify(payload))
	file.close()
