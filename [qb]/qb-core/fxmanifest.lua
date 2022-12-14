fx_version 'cerulean'
game 'gta5'

description 'qb-Core'
version '1.0.0'

shared_scripts { 
	'import.lua',
	'config.lua',
	'shared.lua'
}

client_scripts {
	'client/main.lua',
	'client/functions.lua',
	'client/loops.lua',
	'client/events.lua',
	'client/debug.lua'
}

server_scripts {
	'server/main.lua',
	'server/functions.lua',
	'server/loops.lua',
	'server/player.lua',
	'server/events.lua',
	'server/commands.lua',
	'server/debug.lua'
}

ui_page {
	'html/index.html'
}

lua54 'yes'

files {
	'html/index.html',
	'html/app.js'
}
dependencies {
	'progressbar',
	'connectqueue'
}