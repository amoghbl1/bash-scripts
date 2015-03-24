###### WRITTEN BY AMOGHBL1
#/bin/sh
if [ `whoami` != "root" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi
echo "@@@@@@"
echo "@    @"
echo "@ @@ @"
echo "@@@@@@"
echo "@ @@ @"
echo "@    @"
echo "PLEASE NOTE, I TAKE NO RESPONSIBILITY IF THIS SCRIPT MESSES UP YOUR WHATSAPP, OR PHONE FOR THAT MATTER OF FACT :P"
if [ ! -f /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml.backup ]; then
    echo "Backup doesn't exist, will make a copy for future use of the script!"
    cp /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml.backup
else
    echo "Backup found! will replace original."
    cp /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml.backup /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml
    rm -rf /data/data/com.whatsapp/shared_prefs/temp.xml # deleting this file in case it was partially written before.
fi
while read line 
do
    if [ $line == "<map>" ]; then
        echo "Inserting necessary permissions"
        echo $line >> /data/data/com.whatsapp/shared_prefs/temp.xml
        echo '<boolean name="call" value="true" />' >> /data/data/com.whatsapp/shared_prefs/temp.xml
    else
        echo $line >> /data/data/com.whatsapp/shared_prefs/temp.xml
    fi
done < /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml 2>/dev/null
cp /data/data/com.whatsapp/shared_prefs/temp.xml /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml
rm -rf /data/data/com.whatsapp/shared_prefs/temp.xml
rm -rf /data/data/com.whatsapp/shared_prefs/com.whatsapp_preferences.xml.backup
killall com.whatsapp
echo "IF YOU CAN READ THIS, YOU PROBABLY HAVE CALLING PERMISSIONS NOW ON WHATSAPP!! :D"
