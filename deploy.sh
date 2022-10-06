##Dylan Nandlall
##dan6705@rit.edu


##Creates a crontab and references the main file to run every 5 minutes
crontab -l > cron_bkp
echo "*/5 * * * * sudo main.sh >/dev/null 2>&1" >> cron_bkp
crontab cron_bkp
rm cron_bkp 
