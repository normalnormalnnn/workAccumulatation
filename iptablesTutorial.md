Test system: Ubuntu 20.04 LTS

Persistent iptables rules, install netfilter-persistent:\
`sudo apt install -y netfilter-persistent`

Save current iptables rules:\
`sudo netfilter-persistent save`

Load current saved iptables rules:\
`sudo netfilter-persistent reload`

Saved files path:\
```
/etc/iptables/rules.v4
/etc/iptables/rules.v6
```

When you reboot, it will load rules.v4 and rules.v6 rules for iptables.

Forward tcp local port to another host port:\
```
sudo iptables -t nat -A PREROUTING -p tcp -m tcp --dport 'localPort' -j DNAT --to-destination 'forwardIP:forwardPort'
sudo iptables -t nat -A POSTROUTING -d 'forwardIP' -p tcp -m tcp --dport 'forwardPort' -j SNAT --to-source 'localIp'
```
