Check the current setting:  
```
sysctl net.ipv4.ip_forward
```
```
net.ipv4.ip_forward=0 #disable
net.ipv4.ip_forward=1 #enable
```

Enable IP forwarding:  
```
sudo sysctl net.ipv4.ip_forward=1
```
Disable IP forwarding:
```
sudo sysctl net.ipv4.ip_forward=0
```
To make change perminant acroos reboot:
```
sudo vi /etc/sysctl.conf
```
Find the following text:
```
#Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1
```
Save and exit.

Make the changes take effect immediately:
```
sudo sysctl -p
```
