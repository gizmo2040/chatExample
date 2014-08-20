
app        = require('express')()
http       = require('http').Server app
io         = require('socket.io') http
SerialPort = require("serialport").SerialPort



app.get '/', (req, res)->
  res.sendfile 'index.html'

app.get '/js/jquery-2.0.3.min.js', (req, res)->
  res.sendfile 'js/jquery-2.0.3.min.js'

io.on 'connection', (socket)->
  socket.on 'chat message', (msg)->
  	console.log(msg)
  	parseMsg(msg.msg)
  	io.emit 'chat message', msg

http.listen 3000, ()->
  console.log 'listening on *:3000'






parseMsg = (msg)->
	if(msg[0] == '/')
		cmd = msg.split(' ')[0]
		funcs[cmd]()

# 	serialPort.write "A!\n", (err, data)->
# 		console.log "err #{err}"
# 		console.log "results #{data}"