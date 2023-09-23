# https://www.freecodecamp.org/news/cron-jobs-in-linux/

# Cron is a powerful utility for job scheduling that is available in Unix-like operating systems. By configuring cron, you can set up automated jobs to run on a daily, weekly, monthly, or specific time basis. The automation capabilities provided by cron play a crucial role in Linux system administration.

# Below is the syntax to schedule crons:

# # Cron job example
# * * * * * sh /path/to/script.sh
# Here, the *s represent minute(s) hour(s) day(s) month(s) weekday(s), respectively.

# Below are some examples of scheduling cron jobs.

# SCHEDULE	DESCRIPTION	EXAMPLE
# 0 0 * * *	Run a script at midnight every day	0 0 * * * /path/to/script.sh
# */5 * * * *	Run a script every 5 minutes	*/5 * * * * /path/to/script.sh
# 0 6 * * 1-5	Run a script at 6 am from Monday to Friday	0 6 * * 1-5 /path/to/script.sh
# 0 0 1-7 * *	Run a script on the first 7 days of every month	0 0 1-7 * * /path/to/script.sh
# 0 12 1 * *	Run a script on the first day of every month at noon	0 12 1 * * /path/to/script.sh
# Using crontab
# The crontab utility is used to add and edit the cron jobs.

# crontab -l lists the already scheduled scripts for a particular user.

# You can add and edit the cron through crontab -e.