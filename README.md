# Purpose:

This repo contains a set of ansible and bash scripts to configure automatically my laptop.

# Usage

Although you could, you shouldn't run this repo as-is. It is configured for my specific usage patterns which is probably different than yours. I hoe it is usefull to get you started though :) .

# Run
Using `ansible-pull` you can automatically pull this config, which will create a cron job that will then check for changes every 10 min and update the laptop configuration accordingly. 
 
To run, run the following command replacing the laptop_name with your actual workstation name 
```
ansible-pull -o -K -J -U https://github.com/jeremyforest/laptop-config.git
```

Basically `-o` will check if there has been any modifications from last time. If not, then nothing happens. If so, the laptop is updated as per the ansible configuration. `-K` will ask you your sudo password to run the plays as root. `-J` asks for the ansible-vault password for sensitive information.
