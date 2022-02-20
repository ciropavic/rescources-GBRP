fx_version 'cerulean'
games { 'gta5' }

ui_page "ui/index.html"

files({
  "ui/index.html",
  "ui/js/*.js",
  "ui/css/*.css",
	"ui/img/*.png",
})

client_scripts {
  'client/cl_*.lua',
  "@PolyZone/client.lua",
}

shared_script {
  'shared/sh_*.*',
}

server_scripts {
  'server/sv_*.lua',
}
