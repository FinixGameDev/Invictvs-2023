local genisys = require("genisys")

local game = genisys.create_application("game")

game.name = "Favela Discos"
game.version = "0.0.1"
game.description = [[A simple platformer game made with Godot Engine.
This is a demo game for Genisys, showcasing its hardware capabilities.]]
game.thumbnail = genisys.get_path("thumbnail.png")
game.cover = genisys.get_path("cover.png")

local exe = game:create_process()
exe.command = { genisys.get_path("Team7.x86_64"), "--rendering-driver", "opengl3" }

return game
