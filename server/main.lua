local QBCore = exports['qb-core']:GetCoreObject()





-- TAVUK AMBALAJLAMA

RegisterNetEvent("pirates:cicek")
AddEventHandler("pirates:cicek", function(item, miktar1, isle)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        toplamisle = miktar1 * isle
        if Player.Functions.RemoveItem(item, miktar1) then
            if Player.Functions.AddItem(Config.KaraPara, toplamisle) then 
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item], "remove", miktar1)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.KaraPara], "add", toplamisle)
                TriggerClientEvent('QBCore:Notify', src, "İşlem Tamamlandı!", "success")
            else
                Player.Functions.AddItem(Config.KaraPara, toplamisle)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Üzerinde Minumum " ..miktar1.. " Madde olması gerek!", "error")
        end
    end)


-- TAVUK KES





    AddEventHandler('onResourceStart', function(resource)
        if resource == GetCurrentResourceName() then
            Citizen.Wait(5000)
            print('[^2sakasa-cicek^0] - ^1Started Last Version-2^0')
        end
    end)

    if GetCurrentResourceName() ~= "sakasa-cicek" then
        print("Error: Change the resource name to \"sakasa-cicek\" or it won't work!")
    end