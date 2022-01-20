// require('dotenv').config()

// const { Webhook } = require('discord-webhook-node')
// const publicIp = require('public-ip')

import dotenv from 'dotenv'
import { Webhook } from 'discord-webhook-node'
import publicIp from 'public-ip'

dotenv.config()

// prepare hook
const hook = new Webhook(process.env.WEBHOOK_URL)
hook.setUsername(process.env.WEBHOOK_NAME)
hook.setAvatar(process.env.IMAGE_URL)


// fetch public ip
const v4 = await publicIp.v4()
const v6 = await publicIp.v6()

// send message
hook.send(`
------
Config
------
Date: ${ new Date()}

IP v4: ${v4}
IP v6: ${v6}
`)
