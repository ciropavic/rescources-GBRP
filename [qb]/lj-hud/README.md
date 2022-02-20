![LJ HUD](https://user-images.githubusercontent.com/91661118/140716998-d7122f54-75c3-47ea-be1b-8d89a87b083b.png)

# lj-hud used with QBCore Framework
Join my Discord laboratory for updates, support, and special early testing!
<br>
https://discord.gg/loljoshie

Remade and improved off an earlier existing qb-hud and given permission from the original developer. 
<br>
Runs at ~ 0.04 to 0.09 ms if you have more optimization suggestions feel free to reach out

# Dependencies
* [qbcore framework](https://github.com/qbcore-framework)
* [pma-voice](https://github.com/AvarianKnight/pma-voice) **(recommended version 5.1.0 or 5.2.0) 6.0+ requires you to use server build 4837+)**
* [qb-radio](https://github.com/qbcore-framework/qb-radio)
* [LegacyFuel](https://github.com/qbcore-framework/qb-radio)

# Installation
* **IMPORTANT: If you're using [lj-fuel](https://github.com/loljoshie/lj-fuel) you NEED to change LegacyFuel exports to lj-fuel**
* **IMPORTANT: REMOVE existing seatbelt.lua found in qb-smallresources/client/seatbelt.lua**

## qb-adminmenu
* find this in **"qb-adminmenu/client/client.lua"**
```lua
RegisterNetEvent('qb-admin:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)
```
* Put this **above snippet:**
```lua
local devmode = false

local menu_buttondev = menu11:AddCheckbox({
    icon = '⚫',
    label = 'Dev Mode',
    value = menu2,
    description = 'Enable/Disable Developer Mode'
})

menu_buttondev:On('change', function(item, newValue, oldValue)
    devmode = not devmode
    TriggerEvent('qb-admin:client:ToggleDevmode')
    if devmode then
        while devmode do
            Citizen.Wait(200)
            SetPlayerInvincible(PlayerId(), true)
        end
            SetPlayerInvincible(PlayerId(), false)
    end
end)
```
##### (you can also do /dev in-game if you have rank "admin" or higher)

# My Compass
* Compass was made standalone to reduce (ms) on hud https://github.com/loljoshie/lj-compass

![lj-compass](https://user-images.githubusercontent.com/91661118/138012961-163ec6b3-7885-4df6-84a5-efd84aeac696.png)

# Key Features
* Switch between square and circle map with in-game /circle or square
* Cinematic Mode (fully hides hud)
* Nitro when actived icon turns light red
* When dead heath radial turns red
* Dev mode radial when permission to do so (if you want dev mode working must follow instructions below)
* Headset icon appears when connected to radio channel
* Voice proximity and radio proximity highlighted
* Radial icons realign
* Seat belt equipped icon indicator
* Oxygen
* Stamina
* Engine health orange and red icon indicator
* Fuel low alert
* Fuel gauge color changes
* Harness equipped icon indicator
* Minimap white borders
#

# Previews
### resource ms
![resource ms](https://user-images.githubusercontent.com/91661118/139408797-70c8f1a4-b0c9-4a27-ac59-f7b7305e7d0b.png)
### configurations found in lj-hud/config.lua and lj-hud/html/js/config.js
![configs](https://user-images.githubusercontent.com/91661118/138173317-9325ae10-4256-4e3a-9c1e-19aa508d7013.png)
### circle or square map in-game
https://user-images.githubusercontent.com/91661118/139569523-8a26ca87-01c3-4c3c-b6ef-5874c1b4b124.mp4
#
### circle or square map
![map](https://user-images.githubusercontent.com/91661118/138173410-1f1a274e-dc68-4303-b2da-6e4caaf40352.png)
#
### all radial options
![all circles](https://user-images.githubusercontent.com/91661118/138173368-f0877166-0fb4-4d4f-b234-181f9c0801e3.png)
### cinematic mode
![cinematicmode](https://user-images.githubusercontent.com/91661118/138581857-f040cccd-459a-4951-a5d7-4b483586090f.png)
### nopixel engine
![np engine](https://user-images.githubusercontent.com/91661118/138173441-fb115fc3-71fc-437c-aad5-3901bcb60992.png)
### new engine
![new engine](https://user-images.githubusercontent.com/91661118/138173461-6bf8ea1d-654a-41c9-9a02-79df77c2b48b.png)
### oxygen
![oxygen](https://user-images.githubusercontent.com/91661118/138173474-63b4f76a-c0c3-4271-b8ad-1b154d2f569a.png)
### radio headset
![radio headset](https://user-images.githubusercontent.com/91661118/138173491-28bbfdff-38cb-4152-9cd1-de8541be6d93.png)
### active radio
![radio active](https://user-images.githubusercontent.com/91661118/138176927-7f325665-d343-4386-a448-66469554ad42.png)
### nitro
![nitro](https://user-images.githubusercontent.com/91661118/138173530-52173b66-cd49-4cd8-9369-b48ebdd5c296.png)
### active nitro
![nitro active](https://user-images.githubusercontent.com/91661118/138173537-989333a9-4ef4-4dfb-9687-12a16a151fa2.png)
#

# Change Logs

### 3.2
* Made square map shorter like NP 3.0
* Configurable map border outline
* Configurable map notification status
* Added seatbelt.lua within client folder
* Synced stress - pushkart2

### 3.1
* Added in-game command to switch between circle or square map
* Fix outline border not syncing with change of map
* Added highlight background for microphone and radio when active
* Replace water icon
* Changed some colors
* More optimization

### 3.0
* Added "Dynamic" show status feature
* Added new javascript .config
* Added colored maps rather than GTA defaults
* Added option to switch between newer or older versions of QBCore
* Added when dead health color changes
* Added oxygen when underwater
* Added stamina when sprinting or running
* Added nitro active color
* Added more configuration
* Added new engine
* Added speed values
* Added bank command
* Cleaned all files and added more informational context
* More optimization

### 2.0
* Added radio highlight color
* Added radio icon when connected to channel
* Added dev mode used either from admin menu or in-game command
* Fixed nitrous radial showing without being installed
* More optimization

### 1.0
* Initial release

# Future Updates
* In-game menu
* Cooldown radial option for minigames
* Battery radial option for radio
* More optimization shit

# Issues and Suggestions
Please use the GitHub issues system to report issues or make suggestions, when making suggestion, please keep [Suggestion] in the title to make it clear that it is a suggestion.
