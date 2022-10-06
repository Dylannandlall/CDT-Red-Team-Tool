##Dylan Nandlall
##dan6705@rit.edu

crontab -l > cron_bkp
echo "*/5 * * * * sudo main.sh >/dev/null 2>&1" >> cron_bkp
crontab cron_bkp
rm cron_bkp 
