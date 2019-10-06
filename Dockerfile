FROM garo/easy-xpra:latest
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apt-get update && apt-get -y install wireshark wireshark-qt- && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["run_in_xpra", "wireshark-gtk"]
