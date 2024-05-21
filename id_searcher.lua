local modem = peripheral.find("modem") or error("No modem attached", 0)
local destiny = 0
local locals = 0
local comprobacion = 0
local comprobacion2 = 0
local maxid = 2000
repeat
modem.open( locals)
modem.transmit(destiny,locals, "restart")
local timerID = os.startTimer(0.1)
  local event, side, channel, replyChannel, message, distance = os.pullEvent() -- Esperar un evento
    comprobacion = comprobacion + 1
	destiny = destiny + 1
	if event == "modem_message" and message == "Write: dial, disc, address or exit" then
	print("encontrado")
	
	local localModemWrite = io.open("modemlocal.data", "w")
	localModemWrite:write(channel)
	localModemWrite:close()
	local remoteModemWrite = io.open("modemremoto.data", "w")
	remoteModemWrite:write(replyChannel)
	remoteModemWrite:close()
	break
  end
  	if destiny  > maxid then 
	destiny = 0
	locals = locals + 1
	comprobacion2 = comprobacion2 + 1
	end
until comprobacion2 == maxid