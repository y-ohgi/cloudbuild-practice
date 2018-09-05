const express = require('express')
const app = express()
const ENV = process.env

app.get('/', (req, res) => {
  res.send(`hello world. ${ENV.STAGE}`)
})

app.listen(3000, () => {
  console.log('listening: 0.0.0.0:3000')
})
