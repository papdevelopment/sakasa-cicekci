local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent("pirates:depo", function(data)
    local job = data.job
    TriggerServerEvent("inventory:server:OpenInventory", "stash", job .. "_depo")
    TriggerEvent("inventory:client:SetCurrentStash", job .. "_depo")
end)

--[cicek-dönüştür]

for k, v in pairs(Config.bsedepo) do
    exports['qb-target']:AddCircleZone("ravz-"..k, vector3(v.konum.x, v.konum.y, v.konum.z), 1.5, {
        name = "ravz-"..k,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "pirates:depo",
                icon = "fas fa-circle",
                label = v.isim,
                job = v.job,
            },
        },
        distance = 2.0
    })
end



--[cicek-dönüştür]

for k, v in pairs(Config.piratesisle) do
    exports['qb-target']:AddCircleZone("ravz-"..k, vector3(v.konum.x, v.konum.y, v.konum.z), 1.5, {
        name = "ravz-"..k,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "ravz:cicek-paketle:main",
                icon = "fas fa-circle",
                label = v.isim,
                args = v.icerik,
                job = v.job,
            },
        },
        distance = 2.0
    })
end




RegisterNetEvent("ravz:cicek-paketle:main", function(data)
    icerik = data.args
    contextdata = {
        {header = data.label, isMenuHeader = true, icon = "fas fa-person"}
    }
    for k, v in pairs(icerik) do
        
        table.insert(contextdata, {header = v.label, txt = v.isle .. " $(Adet)", icon = "fas fa-right-to-bracket", params = { 
            event = "ravz-cicek-paketle:client:openDialog",
            args =  {
                item = v.item,
                isle = v.isle,
            },
        }})

    end

    exports["qb-menu"]:openMenu(contextdata)
end)

RegisterNetEvent("ravz-cicek-paketle:client:openDialog", function(data)
    isle = data.isle
    item = data.item

    
    
    local keyboard, miktar1 = exports["nh-keyboard"]:Keyboard({
		header = "Ne kadar dönüştürcen?",
		rows = {"Miktar"}
	})
	if keyboard then
        miktar1 = tonumber(miktar1)
        if miktar1 == nil or miktar1 <= 0  then
            QBCore.Functions.Notify("Hatalı değer.", "error")
        else
            TriggerEvent("qb-pirates:cicekambala-prog", item, miktar1, isle)
        end
    end
    
end)

RegisterNetEvent("qb-pirates:cicekambala-prog", function(item, miktar1, isle)
    exports['progressbar']:Progress({
        name = "cicek",
        duration = 1000,
        label = "Madde dönüştürülüyor...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
            anim = "idle_c",
            flags = 49,
        },
    }, function(status)
        if not status then
            TriggerServerEvent("pirates:cicek", item, miktar1, isle)
        end
    end)
end)






Citizen.CreateThread(function()

    for _, info in pairs(Config.Blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7) -- BURASI HARİTADAKİ BLİP BÜYÜKLÜĞÜ
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

CreateThread(function()
	for _,v in pairs(Config.Peds) do
		RequestModel(v.model)
		while not HasModelLoaded(v.model) do Wait(1) end
		v.handle = CreatePed(4, v.model, v.coords.x, v.coords.y, v.coords.z-1.0, v.heading, false, false)
		SetPedFleeAttributes(v.handle, 0, 0)
		SetPedDropsWeaponsWhenDead(v.handle, false)
		SetPedDiesWhenInjured(v.handle, false)
		SetEntityInvincible(v.handle , true)
		FreezeEntityPosition(v.handle, true)
		SetBlockingOfNonTemporaryEvents(v.handle, true)
		if v.anim.type == 1 then
			TaskStartScenarioInPlace(v.handle, v.anim.name, 0, true)
		elseif v.anim.type == 2 then
			RequestAnimDict(v.anim.dict)
			TaskPlayAnim(v.handle, v.anim.dict, v.anim.name, 8.0, 1, -1, 49, 0, false, false, false)
		end
	end
end)

