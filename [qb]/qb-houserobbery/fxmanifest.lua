fx_version 'cerulean'
game 'gta5'

description 'qb-HouseRobbery'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'