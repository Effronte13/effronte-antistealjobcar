local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('effronte-antistealjobcar:meslekcheck')
AddEventHandler('effronte-antistealjobcar:meslekcheck', function(aracmodeli)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local job = Player.PlayerData.job.name
    local onDuty = Player.PlayerData.job.onduty
    local isRestrictedVehicle = isRestricted(aracmodeli)

    if not isRestrictedVehicle then
        TriggerClientEvent('effronte-antistealjobcar:izinvarmi', src, true)
    else
        if isPlayerInJob(job, aracmodeli) and onDuty then
            TriggerClientEvent('effronte-antistealjobcar:izinvarmi', src, true)
        else
            TriggerClientEvent('effronte-antistealjobcar:izinvarmi', src, false)
            if Config.LogGondersinmi then
                discordlog(string.format(Config.Webhook["LOG_BASLİK_OYUNCU"], GetPlayerName(src), src, aracmodeli), string.format(Config.Webhook["LOG_MESAJ_OYUNCU"], GetPlayerName(src), src, aracmodeli))
            end
            if Config.PolisBildirim.Enabled then
                pdalert(src, aracmodeli)
                AlertPolice()
            end
        end
    end
end)

function isRestricted(aracmodeli)
    for job, vehicles in pairs(Config.JobVehicles) do
        for _, model in ipairs(vehicles) do
            if aracmodeli == model then
                return true
            end
        end
    end
    for _, model in ipairs(Config.OrtakAraclar) do
        if aracmodeli == model then
            return true
        end
    end
    return false
end

function isPlayerInJob(job, aracmodeli)
    local jobVehicles = Config.JobVehicles[job] or {}
    local sharedVehicles = Config.OrtakAraclar or {}
    return isVehicleAllowed(jobVehicles, aracmodeli) or isVehicleAllowed(sharedVehicles, aracmodeli)
end

function isVehicleAllowed(jobVehicles, aracmodeli)
    for _, model in ipairs(jobVehicles) do
        if aracmodeli == model then
            return true
        end
    end
    return false
end

RegisterNetEvent('effronte-antistealjobcar:kickl')
AddEventHandler('effronte-antistealjobcar:kickl', function()
    local src = source
    DropPlayer(src, Config.Notify["KickMessage"])
    if Config.LogGondersinmi then
        discordlog(string.format(Config.Webhook["KICK_PLAYER_BASLIK"], GetPlayerName(src), src), string.format(Config.Webhook["KICKPLAYER_MESSAGE"], GetPlayerName(src), src))
    else
    end

    Wait(3000)
end)

function discordlog(title, message)
    PerformHttpRequest(Config.Webhook["WEBHOOK_URL"], function(err, text, headers) end, 'POST', json.encode({
        username = "EFFRONTE LOG",
        embeds = {
            {
                ["title"] = title,
                ["description"] = message,
                ["color"] = 16711680
            }
        }
    }), { ['Content-Type'] = 'application/json' })
end

function AlertPolice()
    TriggerEvent("tgiann-policeAlert:alert", "TEST", false)
end

function pdalert(playerId, vehicleModel)
    local coords = GetEntityCoords(GetPlayerPed(playerId))
    local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(playerId), false))
    local alertMessage = Config.PolisBildirim.Message

    if Config.PolisBildirim.ALertType == "tgiann-policealert" then
        AlertPolice()
    elseif Config.PolisBildirim.ALertType == "ps-dispatch" then
        TriggerServerEvent("dispatch:server:notify",{
            coords = coords,
            title = "Yetkisiz Araç Kullanımı",
            message = alertMessage,
            blip = {
                sprite = 1,
                color = 1,
                scale = 0.8,
            },
            time = 5000,
        })
    elseif Config.PolisBildirim.ALertType == "custom" then
        TriggerClientEvent(Config.PolisBildirim.Customscriptname, -1, {
            title = "Yetkisiz Araç Kullanımı",
            message = alertMessage,
            coords = coords
        })
    end
end
