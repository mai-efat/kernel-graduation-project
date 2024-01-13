#!/bin/bash



pcap="dumpfile.pcap"


total_packets=$(tshark -r $pcap  | grep '[0-9]' |  wc -l)
http_packets=$(tshark -r $pcap -Y "http" | grep '[0-9]' | wc -l)
https_packets=$(tshark -r $pcap -Y "tls" | grep '[0-9]' | wc -l)
top_source_ips=$(tshark -r $pcap  | awk '{print $3}' | sort | uniq -c | head -n 5 )
top_distination_ips=$(tshark -r $pcap |  awk '{print $5}' |  sort | uniq -c | head -n 5 )








echo "Summary Report"
echo "----------------------------------"
echo "Total Packets:$total_packets"
echo "HTTP:$http_packets"
echo "HTTPS:$https_packets"
echo "top source IP Addresses:"
echo "$top_source_ips"
echo "Top Destination IP Addresses"
echo "$top_distination_ips"
