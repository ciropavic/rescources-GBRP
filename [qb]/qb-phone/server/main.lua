local QBPhone = {}
local Tweets = {}
local AppAlerts = {}
local MentionedTweets = {}
local Hashtags = {}
local Calls = {}
local Adverts = {}
local GeneratedPlates = {}
local WebHook = "https://discord.com/api/webhooks/944265989174984725/zHTOkQQMZU7RwLqNej4_Ux42Sglm-8ztRXnMux_eNk3fi_QV7N4XxTqB-cYTzOnZDxde" -- PUT THE WEBHOOK HERE!
local TWData = {}
local Photos = {}
Photos.url= {}
TWData.NewTweets = {}
TWData.TweetData = {}
Citizen.CreateThread(function()
    Wait(500)
    local LoadResource = json.decode(LoadResourceFile(GetCurrentResourceName(), 'tw.json'))
    local LoadPictures = json.decode(LoadResourceFile(GetCurrentResourceName(), 'photos.json'))
    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), "ad.json"))
    Adverts = LoadJson
   
    TWData.NewTweets = LoadResource.NewTweets
    TWData.TweetData = LoadResource.TweetData
    Photos =  LoadPictures
    TriggerClientEvent('qb-phone:client:Adverts', -1, Adverts)
end)
RegisterServerEvent('qb-phone:server:SavePhoto1')
AddEventHandler('qb-phone:server:SavePhoto1', function(player,Data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyCitizenid = Player.PlayerData.citizenid
        table.insert(Photos,{citizenid = Data.citizenid,url = Data.url})
  TriggerClientEvent("qb-phone:client:loadPhoto",src,Photos)
  SaveResourceFile(GetCurrentResourceName(), "photos.json", json.encode(Photos), -1)
end)

RegisterServerEvent('qb-phone:server:DeleteAdvert')
AddEventHandler('qb-phone:server:DeleteAdvert', function(citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local MyCitizenid = Player.PlayerData.citizenid
    local Citizenid = citizenid
    if Citizenid == MyCitizenid then
        Adverts[Citizenid] = nil
        UpdateJsonAdv(Adverts)
    end

end)



function UpdateJsonAdv(data)
    TriggerClientEvent("qb-phone:client:Adverts",-1,data)
    SaveResourceFile(GetCurrentResourceName(), "ad.json", json.encode(data), -1)
end
---Delete Picture
RegisterServerEvent("qb-phone:server:DeletePicture")
AddEventHandler("qb-phone:server:DeletePicture",function(citizenid,url) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid

    if citizenid == CitizenId then
    
        for k,v in ipairs(Photos) do
           
             if Photos[k].url == '"'..url..'"' and Photos[k].citizenid == citizenid then
              
                 Photos[k] = {}
             end
                 SaveResourceFile(GetCurrentResourceName(), "photos.json", json.encode(Photos), -1)
        end
        TriggerClientEvent("qb-phone:client:UpdatePictures",src,Photos)
    end

end)

QBCore.Functions.CreateCallback("qb-phone:server:GetWebhook",function(source,cb)
	if WebHook ~= "" then
		cb(WebHook)			
	else
		cb(nil)		
	end
	
end)

RegisterServerEvent('qb-phone:server:AddAdvert')
AddEventHandler('qb-phone:server:AddAdvert', function(msg)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid

    if Adverts[CitizenId] ~= nil then
        Adverts[CitizenId].message = msg.message
        Adverts[CitizenId].name = "@"..Player.PlayerData.charinfo.firstname..""..Player.PlayerData.charinfo.lastname
        Adverts[CitizenId].number = Player.PlayerData.charinfo.phone
        Adverts[CitizenId].url = msg.url
        Adverts[CitizenId].citizenid = msg.citizenid

    else
        Adverts[CitizenId] = {
            message = msg.message,
            name = "@"..Player.PlayerData.charinfo.firstname..""..Player.PlayerData.charinfo.lastname,
            number = Player.PlayerData.charinfo.phone,
            url = msg.url,
            citizenid = msg.citizenid
        }
    end
    SaveResourceFile(GetCurrentResourceName(), "ad.json", json.encode(Adverts), -1)
    TriggerClientEvent('qb-phone:client:UpdateAdverts', -1, Adverts, "@"..Player.PlayerData.charinfo.firstname..""..Player.PlayerData.charinfo.lastname)
end)

function GetOnlineStatus(number)
    local Target = QBCore.Functions.GetPlayerByPhone(number)
    local retval = false
    if Target ~= nil then retval = true end
    return retval
end

RegisterServerEvent('qb-phone:server:DeleteTwt')
AddEventHandler('qb-phone:server:DeleteTwt',function(id)

    for k,v in pairs(TWData.NewTweets) do
        if TWData.NewTweets[k].tweetId == id then
             TWData.NewTweets[k] = nil
        end
    end
 
 TriggerClientEvent("qb-phone:client:UpdateTweets1",-1,TWData.NewTweets)
        SaveResourceFile(GetCurrentResourceName(), "tw.json", json.encode(TWData.NewTweets), -1)
end)



QBCore.Functions.CreateCallback('qb-phone:server:GetPhoneData', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        local PhoneData = {
            Applications = {},
            PlayerContacts = {},
            MentionedTweets = {},
            Chats = {},
            Hashtags = {},
            Invoices = {},
            Garage = {},
            Mails = {},
            Adverts = {},
            CryptoTransactions = {},
            Tweets = {},
            Photos = {},
            InstalledApps = Player.PlayerData.metadata["phonedata"].InstalledApps,
        }
        PhoneData.Adverts = Adverts

        local result = exports.oxmysql:executeSync('SELECT * FROM player_contacts WHERE citizenid=@citizenid ORDER BY name ASC', {['@citizenid'] = Player.PlayerData.citizenid})
        local Contacts = {}
        if result[1] ~= nil then
            for k, v in pairs(result) do
                v.status = GetOnlineStatus(v.number)
            end
            
            PhoneData.PlayerContacts = result
        end

        local invoices = exports.oxmysql:executeSync('SELECT * FROM phone_invoices WHERE citizenid=@citizenid', {['@citizenid'] = Player.PlayerData.citizenid})
        if invoices[1] ~= nil then
            for k, v in pairs(invoices) do
                local Ply = QBCore.Functions.GetPlayerByCitizenId(v.sender)
                if Ply ~= nil then
                    v.number = Ply.PlayerData.charinfo.phone
                else
                    local res = exports.oxmysql:executeSync('SELECT * FROM players WHERE citizenid=@citizenid', {['@citizenid'] = v.sender})
                    if res[1] ~= nil then
                        res[1].charinfo = json.decode(res[1].charinfo)
                        v.number = res[1].charinfo.phone
                    else
                        v.number = nil
                    end
                end
            end
            PhoneData.Invoices = invoices
        end

        local garageresult = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE citizenid=@citizenid', {['@citizenid'] = Player.PlayerData.citizenid})
        if garageresult[1] ~= nil then
            for k, v in pairs(garageresult) do
			
		local vehicleModel = v.vehicle	
                if (QBCore.Shared.Vehicles[vehicleModel] ~= nil) and (Garages[v.garage] ~= nil) then
                    v.garage = Garages[v.garage].label
                    v.vehicle = QBCore.Shared.Vehicles[vehicleModel].name
                    v.brand = QBCore.Shared.Vehicles[vehicleModel].brand
                end
				
            end
            PhoneData.Garage = garageresult
        end

        local messages = exports.oxmysql:executeSync('SELECT * FROM phone_messages WHERE citizenid=@citizenid', {['@citizenid'] = Player.PlayerData.citizenid})
        if messages ~= nil and next(messages) ~= nil then 
            PhoneData.Chats = messages
        end

        if AppAlerts[Player.PlayerData.citizenid] ~= nil then 
            PhoneData.Applications = AppAlerts[Player.PlayerData.citizenid]
        end

        if MentionedTweets[Player.PlayerData.citizenid] ~= nil then 
            PhoneData.MentionedTweets = MentionedTweets[Player.PlayerData.citizenid]
        end
        if TWData.NewTweets ~= nil and next(TWData.NewTweets) ~= nil then
            PhoneData.Tweets = TWData.NewTweets
        end
        if Hashtags ~= nil and next(Hashtags) ~= nil then
            PhoneData.Hashtags = Hashtags
        end
        if Photos ~= nil and next(Photos) ~= nil then
            PhoneData.Photos = Photos
        end
        
        local mails = exports.oxmysql:executeSync('SELECT * FROM player_mails WHERE citizenid=@citizenid ORDER BY `date` ASC', {['@citizenid'] = Player.PlayerData.citizenid})
        if mails[1] ~= nil then
            for k, v in pairs(mails) do
                if mails[k].button ~= nil then
                    mails[k].button = json.decode(mails[k].button)
                end
            end
            PhoneData.Mails = mails
        end

        local transactions = exports.oxmysql:executeSync('SELECT * FROM crypto_transactions WHERE citizenid=@citizenid ORDER BY `date` ASC', {['@citizenid'] = Player.PlayerData.citizenid})
        if transactions[1] ~= nil then
            for _, v in pairs(transactions) do
                table.insert(PhoneData.CryptoTransactions, {
                    TransactionTitle = v.title,
                    TransactionMessage = v.message,
                })
            end
        end

        cb(PhoneData)
    end
end)

QBCore.Functions.CreateCallback('qb-phone:server:GetCallState', function(source, cb, ContactData)
    local Target = QBCore.Functions.GetPlayerByPhone(ContactData.number)

    if Target ~= nil then
        if Calls[Target.PlayerData.citizenid] ~= nil then
            if Calls[Target.PlayerData.citizenid].inCall then
                cb(false, true)
            else
                cb(true, true)
            end
        else
            cb(true, true)
        end
    else
        cb(false, false)
    end
end)

RegisterServerEvent('qb-phone:server:SetCallState')
AddEventHandler('qb-phone:server:SetCallState', function(bool)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)

    if Calls[Ply.PlayerData.citizenid] ~= nil then
        Calls[Ply.PlayerData.citizenid].inCall = bool
    else
        Calls[Ply.PlayerData.citizenid] = {}
        Calls[Ply.PlayerData.citizenid].inCall = bool
    end
end)

RegisterServerEvent('qb-phone:server:RemoveMail')
AddEventHandler('qb-phone:server:RemoveMail', function(MailId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('DELETE FROM player_mails WHERE mailid=@mailid AND citizenid=@citizenid', {['@mailid'] = MailId, ['@citizenid'] = Player.PlayerData.citizenid})
    SetTimeout(100, function()
        local mails = exports.oxmysql:executeSync('SELECT * FROM player_mails WHERE citizenid=@citizenid ORDER BY `date` ASC', {['@citizenid'] = Player.PlayerData.citizenid})
        if mails[1] ~= nil then
            for k, v in pairs(mails) do
                if mails[k].button ~= nil then
                    mails[k].button = json.decode(mails[k].button)
                end
            end
        end

        TriggerClientEvent('qb-phone:client:UpdateMails', src, mails)
    end)
end)

function GenerateMailId()
    return math.random(111111, 999999)
end

RegisterServerEvent('qb-phone:server:sendNewMail')
AddEventHandler('qb-phone:server:sendNewMail', function(mailData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if mailData.button == nil then
        exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read)', {
            ['@citizenid'] = Player.PlayerData.citizenid,
            ['@sender'] = mailData.sender,
            ['@subject'] = mailData.subject,
            ['@message'] = mailData.message,
            ['@mailid'] = GenerateMailId(),
            ['@read'] = 0
        })
    else
        exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`, `button`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read, @button)', {
            ['@citizenid'] = Player.PlayerData.citizenid,
            ['@sender'] = mailData.sender,
            ['@subject'] = mailData.subject,
            ['@message'] = mailData.message,
            ['@mailid'] = GenerateMailId(),
            ['@read'] = 0,
            ['@button'] = json.encode(mailData.button)
        })
    end
    TriggerClientEvent('qb-phone:client:NewMailNotify', src, mailData)
    SetTimeout(200, function()
        local mails = exports.oxmysql:executeSync('SELECT * FROM player_mails WHERE citizenid=@citizenid ORDER BY `date` DESC', {['@citizenid'] = Player.PlayerData.citizenid})
        if mails[1] ~= nil then
            for k, v in pairs(mails) do
                if mails[k].button ~= nil then
                    mails[k].button = json.decode(mails[k].button)
                end
            end
        end

        TriggerClientEvent('qb-phone:client:UpdateMails', src, mails)
    end)
end)



RegisterServerEvent('qb-phone:server:sendNewMailToOffline')
AddEventHandler('qb-phone:server:sendNewMailToOffline', function(citizenid, mailData)
    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)

    if Player ~= nil then
        local src = Player.PlayerData.source

        if mailData.button == nil then
            exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read)', {
                ['@citizenid'] = Player.PlayerData.citizenid,
                ['@sender'] = mailData.sender,
                ['@subject'] = mailData.subject,
                ['@message'] = mailData.message,
                ['@mailid'] = GenerateMailId(),
                ['@read'] = 0
            })
            TriggerClientEvent('qb-phone:client:NewMailNotify', src, mailData)
        else
            exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`, `button`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read, @button)', {
                ['@citizenid'] = Player.PlayerData.citizenid,
                ['@sender'] = mailData.sender,
                ['@subject'] = mailData.subject,
                ['@message'] = mailData.message,
                ['@mailid'] = GenerateMailId(),
                ['@read'] = 0,
                ['@button'] = json.encode(mailData.button)
            })
            TriggerClientEvent('qb-phone:client:NewMailNotify', src, mailData)
        end

        SetTimeout(200, function()
            local mails = exports.oxmysql:executeSync('SELECT * FROM player_mails WHERE citizenid=@citizenid ORDER BY `date` ASC', {['@citizenid'] = Player.PlayerData.citizenid})
            if mails[1] ~= nil then
                for k, v in pairs(mails) do
                    if mails[k].button ~= nil then
                        mails[k].button = json.decode(mails[k].button)
                    end
                end
            end
    
            TriggerClientEvent('qb-phone:client:UpdateMails', src, mails)
        end)
    else
        if mailData.button == nil then
            exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read)', {
                ['@citizenid'] = Player.PlayerData.citizenid,
                ['@sender'] = mailData.sender,
                ['@subject'] = mailData.subject,
                ['@message'] = mailData.message,
                ['@mailid'] = GenerateMailId(),
                ['@read'] = 0
            })
        else
            exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`, `button`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read, @button)', {
                ['@citizenid'] = Player.PlayerData.citizenid,
                ['@sender'] = mailData.sender,
                ['@subject'] = mailData.subject,
                ['@message'] = mailData.message,
                ['@mailid'] = GenerateMailId(),
                ['@read'] = 0,
                ['@button'] = json.encode(mailData.button)
            })
        end
    end
end)

RegisterServerEvent('qb-phone:server:sendNewEventMail')
AddEventHandler('qb-phone:server:sendNewEventMail', function(citizenid, mailData)
		local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    if mailData.button == nil then
        exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read)', {
            ['@citizenid'] = citizenid,
            ['@sender'] = mailData.sender,
            ['@subject'] = mailData.subject,
            ['@message'] = mailData.message,
            ['@mailid'] = GenerateMailId(),
            ['@read'] = 0
        })
    else
        exports.oxmysql:execute('INSERT INTO player_mails (`citizenid`, `sender`, `subject`, `message`, `mailid`, `read`, `button`) VALUES (@citizenid, @sender, @subject, @message, @mailid, @read, @button)', {
            ['@citizenid'] = citizenid,
            ['@sender'] = mailData.sender,
            ['@subject'] = mailData.subject,
            ['@message'] = mailData.message,
            ['@mailid'] = GenerateMailId(),
            ['@read'] = 0,
            ['@button'] = json.encode(mailData.button)
        })
    end
    SetTimeout(200, function()
        local mails = exports.oxmysql:executeSync('SELECT * FROM player_mails WHERE citizenid=@citizenid ORDER BY `date` ASC', {['@citizenid'] = citizenid})
        if mails[1] ~= nil then
            for k, v in pairs(mails) do
                if mails[k].button ~= nil then
                    mails[k].button = json.decode(mails[k].button)
                end
            end
        end

        TriggerClientEvent('qb-phone:client:UpdateMails', Player.PlayerData.source, mails)
    end)
end)

RegisterServerEvent('qb-phone:server:ClearButtonData')
AddEventHandler('qb-phone:server:ClearButtonData', function(mailId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('UPDATE player_mails SET button=@button WHERE mailid=@mailid AND citizenid=@citizenid', {['@button'] = '', ['@mailid'] = mailId, ['@citizenid'] = Player.PlayerData.citizenid})
    SetTimeout(200, function()
        local mails = exports.oxmysql:executeSync('SELECT * FROM player_mails WHERE citizenid=@citizenid ORDER BY `date` ASC', {['@citizenid'] = Player.PlayerData.citizenid})
        if mails[1] ~= nil then
            for k, v in pairs(mails) do
                if mails[k].button ~= nil then
                    mails[k].button = json.decode(mails[k].button)
                end
            end
        end

        TriggerClientEvent('qb-phone:client:UpdateMails', src, mails)
    end)
end)

RegisterServerEvent('qb-phone:server:MentionedPlayer')
AddEventHandler('qb-phone:server:MentionedPlayer', function(firstName, lastName, TweetMessage)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.charinfo.firstname == firstName and Player.PlayerData.charinfo.lastname == lastName) then
                QBPhone.SetPhoneAlerts(Player.PlayerData.citizenid, "twitter")
                QBPhone.AddMentionedTweet(Player.PlayerData.citizenid, TweetMessage)
                TriggerClientEvent('qb-phone:client:GetMentioned', Player.PlayerData.source, TweetMessage, AppAlerts[Player.PlayerData.citizenid]["twitter"])
            else
                local query1 = '%'..firstName..'%'
                local query2 = '%'..lastName..'%'
                local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query1 AND charinfo LIKE @query2', {['@query1'] = query1, ['@query2'] = query2})
                if result[1] ~= nil then
                    local MentionedTarget = result[1].citizenid
                    QBPhone.SetPhoneAlerts(MentionedTarget, "twitter")
                    QBPhone.AddMentionedTweet(MentionedTarget, TweetMessage)
                end
            end
        end
	end
end)

RegisterServerEvent('qb-phone:server:CallContact')
AddEventHandler('qb-phone:server:CallContact', function(TargetData, CallId, AnonymousCall)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayerByPhone(TargetData.number)

    if Target ~= nil then
        TriggerClientEvent('qb-phone:client:GetCalled', Target.PlayerData.source, Ply.PlayerData.charinfo.phone, CallId, AnonymousCall)
    end
end)

RegisterServerEvent('qb-phone:server:BillingEmail')
AddEventHandler('qb-phone:server:BillingEmail', function(data, paid)
    for k,v in pairs(QBCore.Functions.GetPlayers()) do
        local target = QBCore.Functions.GetPlayer(v)
        if target.PlayerData.job.name == data.society then
            if paid then
                local name = ''..QBCore.Functions.GetPlayer(source).PlayerData.charinfo.firstname..' '..QBCore.Functions.GetPlayer(source).PlayerData.charinfo.lastname..''
                TriggerClientEvent('qb-phone:client:BillingEmail', target.PlayerData.source, data, true, name)
                TriggerEvent("qb-banking:server:AddToMoneyLog", target.PlayerData.source, "business", data.amount, "deposit", target.PlayerData.job.label, ("Invoice Paid Totalling $"..tonumber(data.amount).." paid into "..target.PlayerData.job.label.." account."))
            else
                local name = ''..QBCore.Functions.GetPlayer(source).PlayerData.charinfo.firstname..' '..QBCore.Functions.GetPlayer(source).PlayerData.charinfo.lastname..''
                TriggerClientEvent('qb-phone:client:BillingEmail', target.PlayerData.source, data, false, name)
            end
        end
    end
end)

--[[ QBCore.Functions.CreateCallback('qb-phone:server:PayInvoice', function(source, cb, society, amount, invoiceId)
    local Invoices = {}
    local Ply = QBCore.Functions.GetPlayer(source)
    Ply.Functions.RemoveMoney('bank', amount, "paid-invoice")
    --TriggerEvent("qb-bossmenu:server:addAccountMoney", society, amount)
	
	TriggerEvent("qb-banking:server:AddToMoneyLog", source, "personal", -amount, "withdraw", society, ("Invoice Paid Totalling $"..tonumber(amount).." paid into "..society.." account."))
    TriggerEvent('qb-banking:society:server:DepositMoney', source, amount, society)
	
    exports.oxmysql:execute('DELETE FROM phone_invoices WHERE id=@id', {['@id'] = invoiceId})
    local invoices = exports.oxmysql:executeSync('SELECT * FROM phone_invoices WHERE citizenid=@citizenid', {['@citizenid'] = Ply.PlayerData.citizenid})
    if invoices[1] ~= nil then
        Invoices = invoices
    end
    cb(true, Invoices)
end) ]]

QBCore.Functions.CreateCallback('qb-phone:server:PayInvoice', function(source, cb, society, amount, invoiceId, sendercitizenid)
    local Invoices = {}
    local Ply = QBCore.Functions.GetPlayer(source)
    local SenderPly = QBCore.Functions.GetPlayerByCitizenId(sendercitizenid)
    local billAmount = amount
    local commission, billAmount

    if Config.BillingCommissions[society] then
        commission = round(amount * Config.BillingCommissions[society])
        billAmount = round(amount - (amount * Config.BillingCommissions[society]))
        SenderPly.Functions.AddMoney('bank', commission)
        TriggerEvent("qb-banking:server:AddToMoneyLog", source, "personal", commission, "deposit", society, ("Comission total $"..tonumber(commission).." paid into personal account from "..society.." account."))
        local mailData = {
            sender = 'Billing Department',
            subject = 'Commission Received',
            message = string.format('You received a commission check of $%s when %s %s paid a bill of $%s.', commission, Ply.PlayerData.charinfo.firstname, Ply.PlayerData.charinfo.lastname, amount)
        }
        TriggerEvent('qb-phone:server:sendNewMailToOffline', sendercitizenid, mailData)
    end

    Ply.Functions.RemoveMoney('bank', amount, "paid-invoice")
    TriggerEvent("qb-banking:server:AddToMoneyLog", source, "personal", -billAmount, "withdraw", society, ("Invoice Paid Totalling $"..tonumber(billAmount).." paid into "..society.." account."))
    TriggerEvent('qb-banking:society:server:DepositMoney', source, billAmount, society)

    exports.oxmysql:execute('DELETE FROM phone_invoices WHERE id=@id', {['@id'] = invoiceId})
    local invoices = exports.oxmysql:executeSync('SELECT * FROM phone_invoices WHERE citizenid=@citizenid', {['@citizenid'] = Ply.PlayerData.citizenid})
    if invoices[1] ~= nil then
        Invoices = invoices
    end
    cb(true, Invoices)
end)

QBCore.Functions.CreateCallback('qb-phone:server:DeclineInvoice', function(source, cb, sender, amount, invoiceId)
    local Invoices = {}
    local Ply = QBCore.Functions.GetPlayer(source)
    exports.oxmysql:execute('DELETE FROM phone_invoices WHERE id=@id', {['@id'] = invoiceId})
    local invoices = exports.oxmysql:executeSync('SELECT * FROM phone_invoices WHERE citizenid=@citizenid', {['@citizenid'] = Ply.PlayerData.citizenid})
    if invoices[1] ~= nil then
        Invoices = invoices
    end
    cb(true, Invoices)
end)

--[[ QBCore.Commands.Add('bill', 'Bill A Player', {{name='id', help='Player ID'}, {name='amount', help='Fine Amount'}}, false, function(source, args)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local amount = tonumber(args[2]) 

    if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'driftkings' or biller.PlayerData.job.name == 'burgershot' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    exports.oxmysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end) ]]

QBCore.Commands.Add('bill', 'Bill A Player', {{name='id', help='Player ID'}, {name='amount', help='Fine Amount'}}, false, function(source, args)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local amount = tonumber(args[2]) 

    if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == "bcso" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'driftkings' or biller.PlayerData.job.name == 'burgershot' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    exports.oxmysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname,
                        ['@sendercitizenid'] = biller.PlayerData.citizenid
                    })
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end)

RegisterServerEvent('qb-phone:server:UpdateHashtags')
AddEventHandler('qb-phone:server:UpdateHashtags', function(Handle, messageData)
    if Hashtags[Handle] ~= nil and next(Hashtags[Handle]) ~= nil then
        table.insert(Hashtags[Handle].messages, messageData)
    else
        Hashtags[Handle] = {
            hashtag = Handle,
            messages = {}
        }
        table.insert(Hashtags[Handle].messages, messageData)
    end
    TriggerClientEvent('qb-phone:client:UpdateHashtags', -1, Handle, messageData)
end)

QBPhone.AddMentionedTweet = function(citizenid, TweetData)
    if MentionedTweets[citizenid] == nil then MentionedTweets[citizenid] = {} end
    table.insert(MentionedTweets[citizenid], TweetData)
end

QBPhone.SetPhoneAlerts = function(citizenid, app, alerts)
    if citizenid ~= nil and app ~= nil then
        if AppAlerts[citizenid] == nil then
            AppAlerts[citizenid] = {}
            if AppAlerts[citizenid][app] == nil then
                if alerts == nil then
                    AppAlerts[citizenid][app] = 1
                else
                    AppAlerts[citizenid][app] = alerts
                end
            end
        else
            if AppAlerts[citizenid][app] == nil then
                if alerts == nil then
                    AppAlerts[citizenid][app] = 1
                else
                    AppAlerts[citizenid][app] = 0
                end
            else
                if alerts == nil then
                    AppAlerts[citizenid][app] = AppAlerts[citizenid][app] + 1
                else
                    AppAlerts[citizenid][app] = AppAlerts[citizenid][app] + 0
                end
            end
        end
    end
end

QBCore.Functions.CreateCallback('qb-phone:server:GetContactPictures', function(source, cb, Chats)
    for k, v in pairs(Chats) do
        local Player = QBCore.Functions.GetPlayerByPhone(v.number)
        
        local query = '%'..v.number..'%'
        local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
        if result[1] ~= nil then
            local MetaData = json.decode(result[1].metadata)

            if MetaData.phone.profilepicture ~= nil then
                v.picture = MetaData.phone.profilepicture
            else
                v.picture = "default"
            end
        end
    end
    SetTimeout(100, function()
        cb(Chats)
    end)
end)

QBCore.Functions.CreateCallback('qb-phone:server:GetContactPicture', function(source, cb, Chat)
    local Player = QBCore.Functions.GetPlayerByPhone(Chat.number)

    local query = '%'..Chat.number..'%'
    local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
    local MetaData = json.decode(result[1].metadata)

    if MetaData.phone.profilepicture ~= nil then
        Chat.picture = MetaData.phone.profilepicture
    else
        Chat.picture = "default"
    end
    SetTimeout(100, function()
        cb(Chat)
    end)
end)
QBCore.Functions.CreateCallback("qb-phone:server:GetInfo",function(source,cb,number)
    local Player = QBCore.Functions.GetPlayerByPhone(number)
    if Player ~= nil then
    cb({name = Player.PlayerData.charinfo.firstname,number = number})
    else
        local query = '%'..number..'%'
        local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
        local MetaData = json.decode(result[1].metadata)
        cb({name = number,number = number})
    end
end)


QBCore.Functions.CreateCallback('qb-phone:server:GetPicture', function(source, cb, number)
    local Player = QBCore.Functions.GetPlayerByPhone(number)
    local Picture = nil

    local query = '%'..number..'%'
    local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
    if result[1] ~= nil then
        local MetaData = json.decode(result[1].metadata)

        if MetaData.phone.profilepicture ~= nil then
            Picture = MetaData.phone.profilepicture
        else
            Picture = "default"
        end
        cb(Picture)
    else
        cb(nil)
    end
end)

RegisterServerEvent('qb-phone:server:SetPhoneAlerts')
AddEventHandler('qb-phone:server:SetPhoneAlerts', function(app, alerts)
    local src = source
    local CitizenId = QBCore.Functions.GetPlayer(src).citizenid
    QBPhone.SetPhoneAlerts(CitizenId, app, alerts)
end)

RegisterServerEvent('qb-phone:server:UpdateTweets')
AddEventHandler('qb-phone:server:UpdateTweets', function(NewTweets, TweetData)
    TWData.NewTweets = NewTweets
    TWData.TweetData = TweetData
    local src = source
    SaveResourceFile(GetCurrentResourceName(), 'tw.json', json.encode(TWData), -1)
    TriggerClientEvent('qb-phone:client:UpdateTweets', -1, src, TWData.NewTweets, TWData.TweetData)
end)

RegisterServerEvent('qb-phone:server:TransferMoney')
AddEventHandler('qb-phone:server:TransferMoney', function(iban, amount)
    local src = source
    local sender = QBCore.Functions.GetPlayer(src)

    local query = '%'..iban..'%'
    local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
    if result[1] ~= nil then
        local reciever = QBCore.Functions.GetPlayerByCitizenId(result[1].citizenid)

        if reciever ~= nil then
            local PhoneItem = reciever.Functions.GetItemByName("phone")
            reciever.Functions.AddMoney('bank', amount, "phone-transfered-from-"..sender.PlayerData.citizenid)
            sender.Functions.RemoveMoney('bank', amount, "phone-transfered-to-"..reciever.PlayerData.citizenid)

            if PhoneItem ~= nil then
                TriggerClientEvent('qb-phone:client:TransferMoney', reciever.PlayerData.source, amount, reciever.PlayerData.money.bank)
            end
        else
            local moneyInfo = json.decode(result[1].money)
            moneyInfo.bank = round((moneyInfo.bank + amount))
            exports.oxmysql:execute('UPDATE players SET money=@money WHERE citizenid=@citizenid', {['@money'] = json.encode(moneyInfo), ['@citizenid'] = result[1].citizenid})
            sender.Functions.RemoveMoney('bank', amount, "phone-transfered")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "This account number doesn't exist!", "error")
    end
end)

RegisterServerEvent('qb-phone:server:EditContact')
AddEventHandler('qb-phone:server:EditContact', function(newName, newNumber, newIban, oldName, oldNumber, oldIban)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('UPDATE player_contacts SET name=@newname, number=@newnumber, iban=@newiban WHERE citizenid=@citizenid AND name=@oldname AND number=@oldnumber', {
        ['@newname'] = newName,
        ['@newnumber'] = newNumber,
        ['@newiban'] = newIban,
        ['@citizenid'] = Player.PlayerData.citizenid,
        ['@oldname'] = oldName,
        ['@oldnumber'] = oldNumber
    })
end)

RegisterServerEvent('qb-phone:server:RemoveContact')
AddEventHandler('qb-phone:server:RemoveContact', function(Name, Number)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('DELETE FROM player_contacts WHERE name=@name AND number=@number AND citizenid=@citizenid', {
        ['@name'] = Name,
        ['@number'] = Number,
        ['@citizenid'] = Player.PlayerData.citizenid
    })
end)

RegisterServerEvent('qb-phone:server:AddNewContact')
AddEventHandler('qb-phone:server:AddNewContact', function(name, number, iban)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('INSERT INTO player_contacts (citizenid, name, number, iban) VALUES (@citizenid, @name, @number, @iban)', {
        ['@citizenid'] = Player.PlayerData.citizenid,
        ['@name'] = tostring(name),
        ['@number'] = tostring(number),
        ['@iban'] = tostring(iban)
    })
end)

RegisterServerEvent('qb-phone:server:UpdateMessages')
AddEventHandler('qb-phone:server:UpdateMessages', function(ChatMessages, ChatNumber, New)
    local src = source
    local SenderData = QBCore.Functions.GetPlayer(src)

    local query = '%'..ChatNumber..'%'
    local Player = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
    if Player[1] ~= nil then
        local TargetData = QBCore.Functions.GetPlayerByCitizenId(Player[1].citizenid)

        if TargetData ~= nil then
            local Chat = exports.oxmysql:executeSync('SELECT * FROM phone_messages WHERE citizenid=@citizenid AND number=@number', {['@citizenid'] = SenderData.PlayerData.citizenid, ['@number'] = ChatNumber})
            if Chat[1] ~= nil then
                -- Update for target
                exports.oxmysql:execute('UPDATE phone_messages SET messages=@messages WHERE citizenid=@citizenid AND number=@number', {
                    ['@messages'] = json.encode(ChatMessages), 
                    ['@citizenid'] = TargetData.PlayerData.citizenid,
                    ['@number'] = SenderData.PlayerData.charinfo.phone
                })
                        
                -- Update for sender
                exports.oxmysql:execute('UPDATE phone_messages SET messages=@messages WHERE citizenid=@citizenid AND number=@number', {
                    ['@messages'] = json.encode(ChatMessages), 
                    ['@citizenid'] = SenderData.PlayerData.citizenid,
                    ['@number'] = TargetData.PlayerData.charinfo.phone
                })
            
                -- Send notification & Update messages for target
                TriggerClientEvent('qb-phone:client:UpdateMessages', TargetData.PlayerData.source, ChatMessages, SenderData.PlayerData.charinfo.phone, false)
            else
                -- Insert for target
                exports.oxmysql:execute('INSERT INTO phone_messages (citizenid, number, messages) VALUES (@citizenid, @number, @messages)', {
                    ['@citizenid'] = TargetData.PlayerData.citizenid, 
                    ['@number'] = SenderData.PlayerData.charinfo.phone,
                    ['@messages'] = json.encode(ChatMessages)
                })
                                    
                -- Insert for sender
                exports.oxmysql:execute('INSERT INTO phone_messages (citizenid, number, messages) VALUES (@citizenid, @number, @messages)', {
                    ['@citizenid'] = SenderData.PlayerData.citizenid, 
                    ['@number'] = TargetData.PlayerData.charinfo.phone,
                    ['@messages'] = json.encode(ChatMessages)
                })

                -- Send notification & Update messages for target
                TriggerClientEvent('qb-phone:client:UpdateMessages', TargetData.PlayerData.source, ChatMessages, SenderData.PlayerData.charinfo.phone, true)
            end
        else
            local Chat = exports.oxmysql:executeSync('SELECT * FROM phone_messages WHERE citizenid=@citizenid AND number=@number', {['@citizenid'] = SenderData.PlayerData.citizenid, ['@number'] = ChatNumber})
            if Chat[1] ~= nil then
                -- Update for target
                exports.oxmysql:execute('UPDATE phone_messages SET messages=@messages WHERE citizenid=@citizenid AND number=@number', {
                    ['@messages'] = json.encode(ChatMessages), 
                    ['@citizenid'] = Player[1].citizenid,
                    ['@number'] = SenderData.PlayerData.charinfo.phone
                })
                -- Update for sender
                Player[1].charinfo = json.decode(Player[1].charinfo)
                exports.oxmysql:execute('UPDATE phone_messages SET messages=@messages WHERE citizenid=@citizenid AND number=@number', {
                    ['@messages'] = json.encode(ChatMessages), 
                    ['@citizenid'] = SenderData.PlayerData.citizenid,
                    ['@number'] = Player[1].charinfo.phone
                })
            else
                -- Insert for target
                exports.oxmysql:execute('INSERT INTO phone_messages (citizenid, number, messages) VALUES (@citizenid, @number, @messages)', {
                    ['@citizenid'] = Player[1].citizenid, 
                    ['@number'] = SenderData.PlayerData.charinfo.phone,
                    ['@messages'] = json.encode(ChatMessages)
                })
                
                -- Insert for sender
                Player[1].charinfo = json.decode(Player[1].charinfo)
                exports.oxmysql:execute('INSERT INTO phone_messages (citizenid, number, messages) VALUES (@citizenid, @number, @messages)', {
                    ['@citizenid'] = SenderData.PlayerData.citizenid, 
                    ['@number'] = Player[1].charinfo.phone,
                    ['@messages'] = json.encode(ChatMessages)
                })
            end
        end
    end
end)

RegisterServerEvent('qb-phone:server:AddRecentCall')
AddEventHandler('qb-phone:server:AddRecentCall', function(type, data)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)

    local Hour = os.date("%H")
    local Minute = os.date("%M")
    local label = Hour..":"..Minute

    TriggerClientEvent('qb-phone:client:AddRecentCall', src, data, label, type)

    local Trgt = QBCore.Functions.GetPlayerByPhone(data.number)
    if Trgt ~= nil then
        TriggerClientEvent('qb-phone:client:AddRecentCall', Trgt.PlayerData.source, {
            name = Ply.PlayerData.charinfo.firstname .. " " ..Ply.PlayerData.charinfo.lastname,
            number = Ply.PlayerData.charinfo.phone,
            anonymous = anonymous
        }, label, "outgoing")
    end
end)

RegisterServerEvent('qb-phone:server:CancelCall')
AddEventHandler('qb-phone:server:CancelCall', function(ContactData)
    local Ply = QBCore.Functions.GetPlayerByPhone(ContactData.TargetData.number)

    if Ply ~= nil then
        TriggerClientEvent('qb-phone:client:CancelCall', Ply.PlayerData.source)
    end
end)

RegisterServerEvent('qb-phone:server:AnswerCall')
AddEventHandler('qb-phone:server:AnswerCall', function(CallData)
    local Ply = QBCore.Functions.GetPlayerByPhone(CallData.TargetData.number)

    if Ply ~= nil then
        TriggerClientEvent('qb-phone:client:AnswerCall', Ply.PlayerData.source)
    end
end)

RegisterServerEvent('qb-phone:server:SaveMetaData')
AddEventHandler('qb-phone:server:SaveMetaData', function(MData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE citizenid=@citizenid', {['@citizenid'] = Player.PlayerData.citizenid})
    local MetaData = json.decode(result[1].metadata)
    MetaData.phone = MData
    exports.oxmysql:execute('UPDATE players SET metadata=@metadata WHERE citizenid=@citizenid', {['@metadata'] = json.encode(MetaData), ['@citizenid'] = Player.PlayerData.citizenid})
    Player.Functions.SetMetaData("phone", MData)
end)

function escape_sqli(source)
    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
    return source:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )
end

QBCore.Functions.CreateCallback('qb-phone:server:FetchResult', function(source, cb, search)
    local src = source
    local search = escape_sqli(search)
    local searchData = {}
    local ApaData = {}

    local query = 'SELECT * FROM `players` WHERE `citizenid` = "'..search..'"'
    -- Split on " " and check each var individual
    local searchParameters = SplitStringToArray(search)
    
    -- Construct query dynamicly for individual parm check
    if #searchParameters > 1 then
        query = query .. ' OR `charinfo` LIKE "%'..searchParameters[1]..'%"'
        for i = 2, #searchParameters do
            query = query .. ' AND `charinfo` LIKE  "%' .. searchParameters[i] ..'%"'
        end
    else
        query = query .. ' OR `charinfo` LIKE "%'..search..'%"'
    end
    
    local ApartmentData = exports.oxmysql:executeSync('SELECT * FROM apartments')
    for k, v in pairs(ApartmentData) do
        ApaData[v.citizenid] = ApartmentData[k]
    end

    local result = exports.oxmysql:executeSync(query)
    if result[1] ~= nil then
        for k, v in pairs(result) do
            local charinfo = json.decode(v.charinfo)
            local metadata = json.decode(v.metadata)
            local appiepappie = {}
            if ApaData[v.citizenid] ~= nil and next(ApaData[v.citizenid]) ~= nil then
                appiepappie = ApaData[v.citizenid]
            end
            table.insert(searchData, {
                citizenid = v.citizenid,
                firstname = charinfo.firstname,
                lastname = charinfo.lastname,
                birthdate = charinfo.birthdate,
                phone = charinfo.phone,
                nationality = charinfo.nationality,
                gender = charinfo.gender,
                warrant = false,
                driverlicense = metadata["licences"]["driver"],
                appartmentdata = appiepappie,
            })
        end
        cb(searchData)
    else
        cb(nil)
    end
end)

function SplitStringToArray(string)
    local retval = {}
    for i in string.gmatch(string, "%S+") do
        table.insert(retval, i)
    end
    return retval
end

QBCore.Functions.CreateCallback('qb-phone:server:GetVehicleSearchResults', function(source, cb, search)
    local src = source
    local search = escape_sqli(search)
    local searchData = {}
    local query = '%'..search..'%'
    local result = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE plate LIKE @query OR citizenid=@citizenid', {['@query'] = query, ['@citizenid'] = search})
    if result[1] ~= nil then
        for k, v in pairs(result) do
            local player = exports.oxmysql:executeSync('SELECT * FROM players WHERE citizenid=@citizenid', {['@citizenid'] = result[k].citizenid})
            if player[1] ~= nil then 
                local charinfo = json.decode(player[1].charinfo)
                local vehicleInfo = QBCore.Shared.Vehicles[result[k].vehicle]
                if vehicleInfo ~= nil then 
                    table.insert(searchData, {
                        plate = result[k].plate,
                        status = true,
                        owner = charinfo.firstname .. " " .. charinfo.lastname,
                        citizenid = result[k].citizenid,
                        label = vehicleInfo["name"]
                    })
                else
                    table.insert(searchData, {
                        plate = result[k].plate,
                        status = true,
                        owner = charinfo.firstname .. " " .. charinfo.lastname,
                        citizenid = result[k].citizenid,
                        label = "Name not found.."
                    })
                end
            end
        end
    else
        if GeneratedPlates[search] ~= nil then
            table.insert(searchData, {
                plate = GeneratedPlates[search].plate,
                status = GeneratedPlates[search].status,
                owner = GeneratedPlates[search].owner,
                citizenid = GeneratedPlates[search].citizenid,
                label = "Brand unknown.."
            })
        else
            local ownerInfo = GenerateOwnerName()
            GeneratedPlates[search] = {
                plate = search,
                status = true,
                owner = ownerInfo.name,
                citizenid = ownerInfo.citizenid,
            }
            table.insert(searchData, {
                plate = search,
                status = true,
                owner = ownerInfo.name,
                citizenid = ownerInfo.citizenid,
                label = "Brand unknown.."
            })
        end
    end
    cb(searchData)
end)

QBCore.Functions.CreateCallback('qb-phone:server:ScanPlate', function(source, cb, plate)
    local src = source
    local vehicleData = {}
    if plate ~= nil then
        local result = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
        if result[1] ~= nil then
            local player = exports.oxmysql:executeSync('SELECT * FROM players WHERE citizenid=@citizenid', {['@citizenid'] = result[1].citizenid})
            local charinfo = json.decode(player[1].charinfo)
            vehicleData = {
                plate = plate,
                status = true,
                owner = charinfo.firstname .. " " .. charinfo.lastname,
                citizenid = result[1].citizenid,
            }
        elseif GeneratedPlates ~= nil and GeneratedPlates[plate] ~= nil then 
            vehicleData = GeneratedPlates[plate]
        else
            local ownerInfo = GenerateOwnerName()
            GeneratedPlates[plate] = {
                plate = plate,
                status = true,
                owner = ownerInfo.name,
                citizenid = ownerInfo.citizenid,
            }
            vehicleData = {
                plate = plate,
                status = true,
                owner = ownerInfo.name,
                citizenid = ownerInfo.citizenid,
            }
        end
        cb(vehicleData)
    else
        TriggerClientEvent('QBCore:Notify', src, 'No Vehicle Nearby', 'error')
        cb(nil)
    end
end)

function GenerateOwnerName()
    local names = {
        [1] = { name = "Jan Bloksteen", citizenid = "DSH091G93" },
        [2] = { name = "Jay Dendam", citizenid = "AVH09M193" },
        [3] = { name = "Ben Klaariskees", citizenid = "DVH091T93" },
        [4] = { name = "Karel Bakker", citizenid = "GZP091G93" },
        [5] = { name = "Klaas Adriaan", citizenid = "DRH09Z193" },
        [6] = { name = "Nico Wolters", citizenid = "KGV091J93" },
        [7] = { name = "Mark Hendrickx", citizenid = "ODF09S193" },
        [8] = { name = "Bert Johannes", citizenid = "KSD0919H3" },
        [9] = { name = "Karel de Grote", citizenid = "NDX091D93" },
        [10] = { name = "Jan Pieter", citizenid = "ZAL0919X3" },
        [11] = { name = "Huig Roelink", citizenid = "ZAK09D193" },
        [12] = { name = "Corneel Boerselman", citizenid = "POL09F193" },
        [13] = { name = "Hermen Klein Overmeen", citizenid = "TEW0J9193" },
        [14] = { name = "Bart Rielink", citizenid = "YOO09H193" },
        [15] = { name = "Antoon Henselijn", citizenid = "QBC091H93" },
        [16] = { name = "Aad Keizer", citizenid = "YDN091H93" },
        [17] = { name = "Thijn Kiel", citizenid = "PJD09D193" },
        [18] = { name = "Henkie Krikhaar", citizenid = "RND091D93" },
        [19] = { name = "Teun Blaauwkamp", citizenid = "QWE091A93" },
        [20] = { name = "Dries Stielstra", citizenid = "KJH0919M3" },
        [21] = { name = "Karlijn Hensbergen", citizenid = "ZXC09D193" },
        [22] = { name = "Aafke van Daalen", citizenid = "XYZ0919C3" },
        [23] = { name = "Door Leeferds", citizenid = "ZYX0919F3" },
        [24] = { name = "Nelleke Broedersen", citizenid = "IOP091O93" },
        [25] = { name = "Renske de Raaf", citizenid = "PIO091R93" },
        [26] = { name = "Krisje Moltman", citizenid = "LEK091X93" },
        [27] = { name = "Mirre Steevens", citizenid = "ALG091Y93" },
        [28] = { name = "Joosje Kalvenhaar", citizenid = "YUR09E193" },
        [29] = { name = "Mirte Ellenbroek", citizenid = "SOM091W93" },
        [30] = { name = "Marlieke Meilink", citizenid = "KAS09193" },
    }
    return names[math.random(1, #names)]
end

QBCore.Functions.CreateCallback('qb-phone:server:GetGarageVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}
    
    local result = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE citizenid=@citizenid', {['@citizenid'] = Player.PlayerData.citizenid})
    if result[1] ~= nil then
        for k, v in pairs(result) do
            local VehicleData = QBCore.Shared.Vehicles[v.vehicle]

            local VehicleGarage = "None"
            if v.garage ~= nil then
                if Garages[v.garage] ~= nil then
                    VehicleGarage = Garages[v.garage]["label"]
                end
            end

            local VehicleState = "In"
            if v.state == 0 then
                VehicleState = "Out"
            elseif v.state == 2 then
                VehicleState = "Impounded"
            end

            local vehdata = {}

            if VehicleData["brand"] ~= nil then
                vehdata = {
                    fullname = VehicleData["brand"] .. " " .. VehicleData["name"],
                    brand = VehicleData["brand"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = VehicleState,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body,
                }
            else
                vehdata = {
                    fullname = VehicleData["name"],
                    brand = VehicleData["name"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = VehicleState,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body,
                }
            end

            table.insert(Vehicles, vehdata)
        end
        cb(Vehicles)
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback('qb-phone:server:HasPhone', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player ~= nil then
        local HasPhone = Player.Functions.GetItemByName("phone")
        local retval = false

        if HasPhone ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-phone:server:CanTransferMoney', function(source, cb, amount, iban)
    local Player = QBCore.Functions.GetPlayer(source)

    if (Player.PlayerData.money.bank - amount) >= 0 then
        local query = '%'..iban..'%'
        local result = exports.oxmysql:executeSync('SELECT * FROM players WHERE charinfo LIKE @query', {['@query'] = query})
        if result[1] ~= nil then
            local Reciever = QBCore.Functions.GetPlayerByCitizenId(result[1].citizenid)
            Player.Functions.RemoveMoney('bank', amount)

            if Reciever ~= nil then
                Reciever.Functions.AddMoney('bank', amount)
				TriggerEvent("qb-banking:server:AddToMoneyLog", source, "personal", -amount, "transfer", Reciever.PlayerData.charinfo.firstname.." "..Reciever.PlayerData.charinfo.lastname, "Transfered $" .. format_int(amount) .. " to " ..Reciever.PlayerData.charinfo.firstname.." "..Reciever.PlayerData.charinfo.lastname)
				TriggerEvent("qb-banking:server:AddToMoneyLog", Reciever.PlayerData.source, "personal", amount, "transfer", Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname, "Received $" .. format_int(amount) .. " from " ..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname)
            else
                local RecieverMoney = json.decode(result[1].money)
				TriggerEvent("qb-banking:server:AddToMoneyLog", source, "personal", -amount, "transfer", "Offline Account", "Transfered $" .. format_int(amount) .. " to Offline Account.")
                RecieverMoney.bank = (RecieverMoney.bank + amount)
                exports.oxmysql:execute('UPDATE players SET money=@money WHERE citizenid=@citizenid', {['@money'] = json.encode(RecieverMoney), ['@citizenid'] = result[1].citizenid})
            end
            cb(true)
        else
            TriggerClientEvent('QBCore:Notify', source, "This account number does not exist!", "error")
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-phone:server:GiveContactDetails')
AddEventHandler('qb-phone:server:GiveContactDetails', function(PlayerId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local SuggestionData = {
        name = {
            [1] = Player.PlayerData.charinfo.firstname,
            [2] = Player.PlayerData.charinfo.lastname
        },
        number = Player.PlayerData.charinfo.phone,
        bank = Player.PlayerData.charinfo.account
    }

    TriggerClientEvent('qb-phone:client:AddNewSuggestion', PlayerId, SuggestionData)
end)

RegisterServerEvent('qb-phone:server:AddTransaction')
AddEventHandler('qb-phone:server:AddTransaction', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('INSERT INTO crypto_transactions (citizenid, title, message) VALUES (@citizenid, @title, @message)', {
        ['@citizenid'] = Player.PlayerData.citizenid, 
        ['@title'] = escape_sqli(data.TransactionTitle),
        ['@message'] = escape_sqli(data.TransactionMessage)
    })
end)

QBCore.Functions.CreateCallback('qb-phone:server:GetCurrentLawyers', function(source, cb)
    local Lawyers = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.job.name == "lawyer" or Player.PlayerData.job.name == "realestate" or Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "taxi" or Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "bcso" or Player.PlayerData.job.name == "ambulance") and Player.PlayerData.job.onduty then
                table.insert(Lawyers, {
                    name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
                    phone = Player.PlayerData.charinfo.phone,
                    typejob = Player.PlayerData.job.name,
                })
            end
        end
    end
    cb(Lawyers)
end)

RegisterServerEvent('qb-phone:server:InstallApplication')
AddEventHandler('qb-phone:server:InstallApplication', function(ApplicationData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.PlayerData.metadata["phonedata"].InstalledApps[ApplicationData.app] = ApplicationData
    Player.Functions.SetMetaData("phonedata", Player.PlayerData.metadata["phonedata"])

    -- TriggerClientEvent('qb-phone:RefreshPhone', src)
end)

RegisterServerEvent('qb-phone:server:RemoveInstallation')
AddEventHandler('qb-phone:server:RemoveInstallation', function(App)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.PlayerData.metadata["phonedata"].InstalledApps[App] = nil
    Player.Functions.SetMetaData("phonedata", Player.PlayerData.metadata["phonedata"])

    -- TriggerClientEvent('qb-phone:RefreshPhone', src)
end)

QBCore.Commands.Add("setmetadata", "Set Player Metadata (God Only)", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	
	if args[1] ~= nil then
		if args[1] == "trucker" then
			if args[2] ~= nil then
				local newrep = Player.PlayerData.metadata["jobrep"]
				newrep.trucker = tonumber(args[2])
				Player.Functions.SetMetaData("jobrep", newrep)
			end
		end
	end
end, "god")

function format_int(n)
    if not n then return 0 end
    n = tonumber(n)
    if n >= 1e14 then return tostring(n) end
    if n <= -1e14 then return "-" .. tostring(math.abs(n)) end
    local negative = n < 0
    n = tostring(math.abs(n))
    local dp = string.find(n, "%.") or #n + 1

    for i = dp - 4, 1, -3 do
        n = n:sub(1, i) .. "," .. n:sub(i + 1)
    end

    -- Make sure the amount is padded with zeroes
    if n[#n - 1] == "." then
        n = n .. "0"
    end

    return (negative and "-" or "") .. n
end

function round(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

