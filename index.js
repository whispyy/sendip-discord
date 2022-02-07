import dotenv from 'dotenv'
import { Webhook } from 'discord-webhook-node'
import publicIp from 'public-ip'
import battery from 'battery'

dotenv.config()

const hook = new Webhook(process.env.WEBHOOK_URL)
hook.setUsername(process.env.WEBHOOK_NAME)
hook.setAvatar(process.env.IMAGE_URL)

let message = `
------
Config
------
Date: ${new Date()}
`

try {
  const v4 = await publicIp.v4()
  const v6 = await publicIp.v6()

  message += `IP v4: ${v4}\nIP v6: ${v6}\n`
} catch (e) {
  message += `Error fetching ip ${e}`
}


try {
  const { level, charging } = await battery()

  message += `Battery: ${level*100}%, ${charging ? 'charging' : 'not charging'}\n`
} catch(e) {
  message += `Error fetching battery info ${e}`
}

hook.send(message)