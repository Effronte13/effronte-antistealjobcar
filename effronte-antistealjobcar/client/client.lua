local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local ppedid = PlayerPedId()
        local arac = GetVehiclePedIsIn(ppedid, false)

        if arac ~= 0 and GetPedInVehicleSeat(arac, -1) == ppedid then
            local aracmodeli = GetEntityModel(arac)
            local aracmodelismi = GetDisplayNameFromVehicleModel(aracmodeli):lower()
            
            TriggerServerEvent('effronte-antistealjobcar:meslekcheck', aracmodelismi)
        end
    end
end)

RegisterNetEvent('effronte-antistealjobcar:izinvarmi')
AddEventHandler('effronte-antistealjobcar:izinvarmi', function(izin)
    local ppedid = PlayerPedId()
    local arac = GetVehiclePedIsIn(ppedid, false)
    if not izin then
        if Config.Kickatsinmi then
            TriggerServerEvent("effronte-antistealjobcar:kickl")
        else
            if Config.Aracisilsinmi then
                SetEntityAsMissionEntity(arac, true, true)
                DeleteVehicle(arac)
                TriggerServerEvent("dclog-effronte:dclog")
                discordlog(string.format(Config.Webhook["ARAC_SILINDI"], GetPlayerName(src), src, aracmodeli), string.format(Config.Webhook["ARAC_SILINDI_MESAJ"], GetPlayerName(src), src, aracmodeli))
                QBCore.Functions.Notify(Config.Notify["aracsilindi"], Config.Notify["type"])
            else
                TaskLeaveVehicle(ppedid, arac, 0)
                QBCore.Functions.Notify(Config.Notify["izinyok"], Config.Notify["type"])
            end
        end
    end
end)
