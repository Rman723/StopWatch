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
