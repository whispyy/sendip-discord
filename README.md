# send-ip to discord

## Project

Little script that send your public ip into a webhook channel

## Config

- update `WEBHOOK_URL` variable to set a discord webhook url


## Automate script on startup and shutdown

To schedule a shutdown, you can use the following command:

`sudo rtcwake -m off -s 60`

This will put the system into sleep mode (-m off) after 60 seconds (-s 60), effectively shutting it down.

To schedule a wakeup at a specific time, you can use the following command:

`sudo rtcwake -m no -l -t $(date +%s -d 'tomorrow 08:00')`

This will put the system into a low-power state (-m no) until the specified time (-t) is reached. The time is specified using the date command, and in this example it's set to tomorrow at 8:00 AM. The -l option specifies that the time is in UTC format.

You can run these commands using cron to schedule them to run automatically. Open the crontab editor by running the command crontab -e. Then add the following line to schedule a shutdown every day at midnight:

`0 0 * * * rtcwake -m off -s 60`

And add the following line to schedule a wakeup at 8:00 AM every weekday:

`0 8 * * 1-5 rtcwake -m no -l -t $(date +%s -d 'tomorrow 08:00')`

Save and exit the crontab editor to schedule the jobs.
