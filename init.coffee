
app        = require('express')()
http       = require('http').Server app
io         = require('socket.io') http



app.get '/', (req, res)->
  res.sendfile 'index.html'

app.get '/js/jquery-2.0.3.min.js', (req, res)->
  res.sendfile 'js/jquery-2.0.3.min.js'

io.on 'connection', (socket)->
  socket.on 'chat message', (msg)->
  	console.log(msg)
  	io.emit 'chat message', msg

http.listen 3000, ()->
  console.log 'listening on *:3000'







