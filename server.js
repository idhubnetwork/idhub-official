'use strict'
const express = require('express')
const path = require('path');

const app = express()
app.use(express.static('dist'))

app.use((req, res, next) => {
  if (!req.originalUrl.includes('/dist/', 0)) {
    res.sendFile(path.join(__dirname, 'dist', 'index.html'))
  } else {
    next()
  }
})

const server = app.listen(80, function () {
  const host = server.address().address
  const port = server.address().port
  console.log("Example app listening at http://%s:%s", host, port)
})