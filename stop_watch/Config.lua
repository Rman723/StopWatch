local timestop = 0
local on = 0

--starts counting up--
RegisterCommand('start', function(source, args)
    on = 1
    while on == 1 do
        up()
    end
end, false)

--Stops the counting up--
RegisterCommand('stop', function(source, args)
    on = 0
end, false)

--restarts the stopwatch--
RegisterCommand('reset', function(source, args)
    timestop = 0
end, false)

--timer--
RegisterCommand('stopwatch', function(source, args)
    time = args[1]
    if time == nil then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Please put a time in SECONDS"}
        })
    else
        started()
        Citizen.Wait(time*1000)
        TriggerEvent('chat:addMessage', {
            color = {0, 191, 255},
            multiline = true,
            args = {"Timer is up"}
        })
        loop()
        Citizen.Wait(600)
        loop()
        Citizen.Wait(600)
        loop()
    end
end)



----FUNCTIONS----
function loop()
    PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 1)
    Citizen.Wait(100)
    PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 1)
    Citizen.Wait(100)
    PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 1)
    Citizen.Wait(100)
    PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 1)
    Citizen.Wait(100)
    PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 1)
end

function up()
    Citizen.Wait(1000) 
    timestop = timestop + 1 
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {timestop}
    })
end
--Tells user timer has started
function started()
    TriggerEvent('chat:addMessage', {
    color = {0, 191, 255},
    multiline = true,
    args = {"Your timer has started for ".. time .. " seconds"}
    })
end
--little menu thing
Citizen.CreateThread(function()
    if on == 1 then
        Citizen.Wait(0)
        local timers = timestop
        onScreen("~r~time: ~w~"..timers.."", 100.0,100.0)
    else
        Citizen.Wait(0)
        local timers = timestop
        onScreen("~r~time: ~w~"..timers.."", 0.9,0.8)
    end
end)



function onScreen(content,x,y)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.5, 0.5)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(x+0.004, y-0.057)
    DrawRect(x+0.05, y-0.037, 0.100, 0.043,0,0,0,100)
    DrawRect(x, y-0.037, 0.0028, 0.043,255,30,30,255)
end
 
function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end