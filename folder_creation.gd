@tool
extends EditorScript
class_name FolderGeneration
# This script is designed to be run in the Godot editor.
# This script generates a folder structure for a Godot project.
# It creates folders for scenes, scripts, assets, and other resources.
# It also creates a README file in the root directory of the project.

func _run():
	# Define the folder structure
	var folders = [
		"assets",
		"assets/sprites",
		"assets/sprites/characters",
		"assets/sprites/tilesets",
		"assets/sprites/items",
		"assets/sprites/ui",
		"assets/audio",
		"assets/audio/music",
		"assets/audio/sfx",
		"assets/fonts",
		"assets/shaders",
		"scenes",
		"scenes/world",
		"scenes/world/overworld",
		"scenes/world/dungeons",
		"scenes/world/towns",
		"scenes/characters",
		"scenes/characters/npcs",
		"scenes/characters/enemies",
		"scenes/characters/player",
		"scenes/ui",
		"scenes/ui/inventory",
		"scenes/ui/dialogue",
		"scenes/ui/menus",
		"scenes/interactions",
		"scripts",
		"scripts/core",
		"scripts/player",
		"scripts/player/combat",
		"scripts/dialogue",
		"scripts/npcs",
		"scripts/world",
		"scripts/ui",
		"scripts/items",
		"scripts/data",
		"scripts/systems",
		"resources",
		"resources/items",
		"resources/characters",
		"resources/dialogue",
		"resources/quests",
		"resources/maps",
		"tests"
		
		
	]
	# Create the folders
	for folder in folders:
		var dir = DirAccess.open("res://")
		if dir and not dir.dir_exists(folder):
			print("Creating folder: " + folder)
			DirAccess.make_dir_recursive_absolute("res://" + folder)
