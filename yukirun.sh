#!/bin/bash
# The Yuki Chan
#
# Automated Intel-Gathering - Vulnerability Analysis - OSINT
# Tracking - System Enumeration - And Off Course Pentesting Too
#
# Version : 1.0 | Codename : Waifu Sudah Lacur 
# Coded by : Yukinoshita 47 | Garuda Security Hacker
#
# Tested on : Kali Linux 
# I highly recommend using this tool by using Kali Linux OS
# If You using another OS dont forget to install python and perl requirements
#
# More Info : http://www.garudasecurityhacker.org
# 
# This Tool Designed For Lazy Way To Pentest :)
# Remember Educational Purpose only Not For Crime
# Im Not Responsible If Something Bad Thing Happen
# Use At Your Own Risk
#

echo ""
echo "                                                   "
echo "            ██╗    ██╗           ██╗    ██ " 
echo "            ██║    ██║           ██║   ██╝ "
echo "            ██║    ██║           ██╚═██╝    ██╗ "
echo "            █████████║ ██╗  ██╗  ██ ██║     ══╝   "
echo "                ██╔══╝ ██║  ██║  ██╔═██╗    ██╗"
echo "                ██║    ██║  ██║  ██║   ██╗  ██║"
echo "                ██║    ███████║  ██║    ██╗ ██║ "
echo "                ══╝    ═══════╝  ══╝    ══╝ ══╝ "
echo "                        The YuKi-Chan         "
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  Automated Intel-Gathering - Vulnerability Analysis - OSINT    ║"   
echo "║  Tracking - System Enumeration - And Off Course Pentesting Too ║"
echo "╚════════════════════════════════════════════════════════════════╝"         
echo "╔════════════════════════════════════════════════════════════════╗"
echo " ║         Version : 1.0 | Codename : Waifu Sudah Lacur         ║"
echo "   ║    Coded by : Yukinoshita 47 | Garuda Security Hacker    ║"
echo "    ║                 Tested on : Kali Linux                 ║"
echo "     ║     More Info : http://www.garudasecurityhacker.org  ║"              
echo "      ╚════════════════════════════════════════════════════╝"
echo "         Recode The Copyright Is Not Make You A Coder Dude :p "
echo "══════════════════════════════════════════════════════════════════"
echo "Enter domain of your Target Below example site.com :"
read TARGET
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║                           WARNING                              ║"
echo "║                                                                ║"
echo "║      I highly recommend using this tool by using Kali Linux OS ║"
echo "║                                                                ║"
echo "║      By using this tool it means you agree with terms,         ║"
echo "║      conditions, and risks                                     ║"
echo "║                                                                ║"
echo "║      By using this tool you agree that                         ║"
echo "║      1. use for legitimate security testing                    ║"
echo "║      2. not for crime                                          ║"
echo "║      3. the use of this tool solely for                        ║"
echo "║         educational reasons only                               ║"
echo "║                                                                ║"
echo "║      By using this tool you agree that                         ║"
echo "║      1. You are willing to be charged with criminal or state   ║"
echo "║         law applicable by law enforcement officers             ║"
echo "║         and government when abused                             ║"
echo "║      2. the risk is borne by yourself                          ║"
echo "║                                                                ║"
echo "║         Thank you and happy pentest                            ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo ""
echo ""
echo ""
echo ""
echo "█[1]█"
echo ""
echo ""
echo ""
echo "█[2]█"
echo ""
echo ""
echo ""
echo "█[3]█"
echo ""
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                    YUKI-CHAN STARTED                           ║"              
echo "╚════════════════════════════════════════════════════════════════╝"

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║            Let's Find Who The Hell Is This Owner               ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "whois looking up (if not run maybe not installed in your OS)"
whois $TARGET
echo "whois looking up finished"
echo ""
echo "nslooking up (if not run maybe not installed in your OS)"
nslookup $TARGET
echo "nslooking up finished"
echo ""
echo "scanning with nmap (if not run maybe not installed in your OS)"
nmap -v -O $TARGET
echo "scanning with nmap finished"
echo ""
echo "starting the harvester for gathering email and subdomain information"
python2 Module/theHarvester/theHarvester.py -d $TARGET -l 500 -b google
echo "the harvester finished"
echo ""
echo "starting metagoofil for gathering document maybe important"
python2 Module/metagoofil/metagoofil.py -d $TARGET -t doc,pdf,xls,csv,txt -l 200 -n 50 -o metagoofiles -f data.html
echo "metagoofil finished"
echo ""
echo "starting dnsrecon for gathering DNS record "
python2 Module/dnsrecon/dnsrecon.py -d $TARGET
echo "dnsrecon finished"
echo ""
dig -x $TARGET
python2 Module/sublist3r/sublist3r.py --domain $TARGET
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                    Got It :v wkwkwkwkwk                        ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║             Web Application Firewall Scanning Starting         ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "scanning WAF with wafw00f"
sudo wafw00f http://$TARGET
echo "scanning finished next..."
echo ""
echo "try bypass WAF with wafninja"
./wafninja bypass -u "http://$TARGET/index.php" -p "Name=PAYLOAD&Submit=Submit" -c "phpsessid=value" -t xss -o output.html
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║             Web Application Firewall Scanning Finished         ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   XSS Scanning Starting                        ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
python2 Module/XssPy.py -u $TARGET -v
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   XSS Scanning Finished                        ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║              Web / CMS Vulnerability Scanning Starting         ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo "checking web with whatweb (if not run maybe not installed in your OS)"
./Module/WhatWeb/whatweb $TARGET
echo ""
echo ""
echo "checking web with spaghetti"
sudo pip install -r /root/yuki/Module/Spaghetti/doc/requirements
python2 Module/Spaghetti/spaghetti.py --url http://$TARGET --scan [0-3] 
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Scan Wordpress Starting                      ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo "start scanning wpscan.rb (if not run maybe not installed in your OS)"
wpscan --url http://$TARGET --enumerate u vp
echo ""
echo "If Your OS Doesn't Have WPScan"
echo "Dont Worry Dude I Have Alternative Scanner For You"
echo "Next Time Use Kali Linux if you want this tool work perfectly "
echo ""
python2 Module/wpscanner.py -s http://$TARGET -n 20
sudo droopescan scan wordpress -u http://$TARGET
python2 Module/WPSeku/wpseku.py --target http://$TARGET
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Scan Wordpress Finished                      ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Scan Joomla Starting                         ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo "start scanning"
./joomscan -u http://$TARGET >> ${TARGET}_joom.txt
echo -e "Joomscan Results saved to ${TARGET}_joom.txt in /root/yuki2"
joomscan -u http://$TARGET
droopescan scan joomla -u http://$TARGET >> ${TARGET}_droop.txt
echo -e "Droopscan Results saved to ${TARGET}_droop.txt in /root/yuki2"
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Scan Joomla Finished                         ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Scan Other CMS Starting                      ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo ""
echo "scan drupal cms"
sudo droopescan scan drupal -u http://$TARGET
echo "scan dupal cms finished next...."
echo ""
echo "scan silverstripe cms"
sudo droopescan scan silverstripe -u http://$TARGET
echo "scan silverstripe cms finished next..... "
echo ""
echo "scan moodle cms"
sudo droopescan scan moodle -u http://$TARGET
echo "scan moodle cms finished next..... "
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Scan Other CMS Finished                      ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║             Web / CMS Vulnerability Scanning Finished          ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   SSL Vulnerability Scanning Starting          ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo "starting sslscan (if not run maybe not installed in your OS)"
sslscan $TARGET
echo "sslscan finished let's use another way"
echo ""
echo "starting sslyze (if not run maybe not installed in your OS)"
sslyze --resum --certinfo=basic --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $TARGET
echo "sslyze finished let's change side"
echo ""
echo "Update U2SV First"
echo "When you are ready to continue press enter."
read CHOICE
echo ""
python2 Module/a2sv/a2sv.py -u 
echo "Update Finished Continue Scanning"
python2 Module/a2sv/a2sv.py -t $TARGET 
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   SSL Vulnerability Scanning Finished          ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Fuzz Scanning Starting                       ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo "starting fuzzing with waf ninja"
chmod +x wafninja
wafninja fuzz -u "http://$TARGET/index.php?id=FUZZ" -c "phpsessid=value" -t xss -o output.html
echo "fuzzing finished"
echo ""
echo "starting fuzzing.php web dir"
echo ""
sudo python3 Module/dirsearch/dirsearch.py -u http://$TARGET -e .php -f
echo ""
echo "fuzzing .php web dir"
echo ""
echo ""
echo "starting.asp web dir finished"
sudo python3 Module/dirsearch/dirsearch.py -u http://$TARGET -e .asp -f
echo "fuzzing .asp web dir finished"
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Fuzz  Scanning Finished                      ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                   Moving Metagoofil Files                      ║"              
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "Moving Metagoofil Folder"
sudo mv metagoofiles /root/Desktop 
echo "Moving Metagoofil Folder Finished"
echo ""
echo "Moving Metagoofile data.html"
sudo mv data.html /root/Desktop
echo "Moving Metagoofil data.html finished"
echo ""
echo ""
echo ""
echo ""
echo "█[1]█"
echo ""
echo ""
echo ""
echo "█[2]█"
echo ""
echo ""
echo ""
echo "█[3]█"
echo ""
echo ""
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                    YUKI-CHAN FINISHED                          ║"
echo "║                     HOPE YOU ENJOY IT                          ║"
echo "║                       AND AS ALWAYS                            ║"
echo "║                       HAVE NICE DAY                            ║"              
echo "╚════════════════════════════════════════════════════════════════╝"

