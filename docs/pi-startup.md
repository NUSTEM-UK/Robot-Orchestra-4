# Configuring a Pi to run a script at startup

## OSC broadcast router -- Systemd

This is on the wifi access point Pi, `conpi.local`:

System user is default (`pi`), password changed to NUSTEM default low-security.

Command is going to be:

    /usr/bin/python3 /home/pi/Robot-Orchestra-4/osc/broadcastosc.py

...and we're going to configure it via systemd. Following [guide](https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/):

    sudo nano /lib/systemd/system/oscbroadcast.service

    [Unit]
    Description=OSC broadcast repeater
    After=multi-user.target

    [Service]
    Type=idle
    ExecStart=/usr/bin/python3 /home/pi/Robot-Orchestra-4/osc/broadcastosc.py

    [Install]
    WantedBy=multi-user.target

Save & exit nano.

We're not logging - will fire up a monitor script to watch for traffic rather than routinely spool log files.

    sudo chmod 644 /lib/systemd/system/oscbroadcast.service

Then:

    sudo systemctl daemon-reload
    sudo systemctl enable oscbroadcast.service

...and we're done. Reboot... and that failed.

    sudo systemctl status oscbroadcast.service

reveals error was: system python3 doesn't have pythonosc available. Oh, durr. So `sudo pip3 install python-osc` ... which fails because we don't have network to the world. Gaaaaah. Sooo... bridge the Pi to the world via my MacBook, Ethernet/Thunderbolt cable, and my phone. Do the `pip` install, and try again.

`systemctl status oscbroadcast.service` now reports loaded and active/running. `osc-monitor.py` shows broadcast behaviour happening as expected. 