#!bin/bash
sudo su
yum install openswan -y
echo "net.ipv4.ip_forward = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0" > /etc/sysctl.conf

service network restart
echo "conn Tunnel1
authby=secret
auto=start
left=%defaultroute
leftid="${aws_instance.harsh-viradia-ec2-region-2.public_ip}"
right="${aws_vpn_connection.harsh-viradia-site-to-site.tunnel1_address}"
type=tunnel
ikelifetime=8h
keylife=1h
phase2alg=aes128-sha1;modp1024
ike=aes128-sha1;modp1024
keyingtries=%forever
keyexchange=ike
leftsubnet=11.0.1.0/24
rightsubnet=10.0.0.0/16
dpddelay=10
dpdtimeout=30
dpdaction=restart_by_peer" > /etc/ipsec.d/aws-vpn.conf
echo ""${aws_instance.harsh-viradia-ec2-region-2.public_ip}" "${aws_vpn_connection.harsh-viradia-site-to-site.tunnel1_address}": PSK "${aws_vpn_connection.harsh-viradia-site-to-site.tunnel1_preshared_key}" | tee /etc/ipsec.d/aws-vpn.secrets
chkconfig ipsec on
service ipsec start
service ipsec status