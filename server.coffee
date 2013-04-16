# Requires
#docpad = require 'docpad' #it dosen't work why?
docpad = require "#{__dirname}/node_modules/docpad/out/lib/docpad"
express = require 'express'
# =====================================
# Configuration


# Variables
oneDay = 86400000
expiresOffset = oneDay


# Configuration
docpadPort = process.env.VCAP_APP_PORT || process.env.PORT || 3000


# Create Servers
docpadServer = express()


# Configure DocPad
docpadConfig =
  port: docpadPort
  maxAge: expiresOffset
  server: docpadServer
  checkVersion: false


# =====================================
# Start & Extend DocPad


# Create DocPad, and wait for it to load
docpad.createInstance docpadConfig, (err,docpadInstance) ->
  # Prepare
  console.log err.stack if err
  docpadInstance.action "server generate watch", (error) ->
    console.log error.stack if error
    console.log 'OK,Docpad was Initialized'


# =====================================
# Exports


# Export the DocPad Server we created
module.exports = docpadServer