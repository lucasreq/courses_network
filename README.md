# TP 1 - B2

## I. Gather informations

 ° ```ip a``` permet de recuperer toutes les infos

 ° déterminer si les cartes réseaux ont récupéré une IP en DHCP ou non : ```sudo nmcli -f DHCP4 con show ens32``` Moi j'en ai pas
 ![dhcp](img/dhcp.png)

 ° afficher la table de routage de la machine et sa table ARP : ```ip neighbour show et ip route show ```
 ![table ARP](img/ipnei.png)
 première ligne est ma carte réseau
 deuxieme ligne est mon ordi connecté
 troisieme ligne gateway

 °récupérer la liste des ports en écoute (listening) sur la machine (TCP et UDP) : ```ss -t et ss -u```
 ![tcp/udp](img/tcp-udp.png)

 ° récupérer la liste des DNS utilisés par la machine et de reddit : ```dig localhost et dig www.reddit.com```
 ![dig](img/dig.png)
    server DNS ok

 °  afficher l'état actuel du firewall : ```firewall-cmd --list-all```
        ![etatfw](img/etatfw.png)

 - quelles interfaces sont filtrées ? : ens32

 - quel port TCP/UDP sont autorisés/filtrés ? aucun ports filtrés ```firewall-cmd --list-post```
## II. Edit configuration

### 1. configuration carte réseau

 - mettre une ip statique manuellement il faut aller : ```/etc/sysconfig/network-scripts/ifcfg-eth0``` puis tu ajoute 
IPADDR=172.16.1.115
NETMASK=255.255.255.0
GATEWAY=172.16.1.1

   et tu change BOOTPROTO = dhcp ---> BOOTPROTO = static

- vérifier les changements 
    - ip :
    ![ipa](img/ipa2.png)

    - arp :
    ![arp](img/ipnei.png)

- NIC 
    - ![ip](img/memereseau.png)
        ens32 et ens35 même réseau

    -  mettre en place un NIC teaming (ou bonding)
        ![teaming](img/teaming.png)

### 2. SSH

- modification du port 22 en port 2222 dans les fichiers ssh : /etc/ssh/sshd_config puis ```systemctl restart sshd```

- 





