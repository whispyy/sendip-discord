require('dotenv').config();

const { Webhook } = require('discord-webhook-node');

const hook = new Webhook(process.env.WEBHOOK_URL);
hook.setUsername(process.env.WEBHOOK_NAME);
hook.setAvatar(process.env.IMAGE_URL);
 
 
hook.send('Hello there!');
