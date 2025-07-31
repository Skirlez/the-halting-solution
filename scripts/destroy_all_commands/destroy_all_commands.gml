function destroy_all_commands() {
	with (obj_command) {
		if char != "e"
			instance_destroy(id)
		else
			x = global.program_x + 20;
	}
	update_program_instances()
}