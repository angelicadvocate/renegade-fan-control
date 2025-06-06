# renegade-fan-control
PWM fan control for Libre Renegade ROC-RK3328-CC

# PWM Fan Control Setup – Libre Renegade (ROC-RK3328-CC)

## 1. Install Scripts

Move the following files to `/usr/local/bin/`:

- `enable_pwm.sh`  
- `fan_control.sh`

Make them executable:

```bash
sudo chmod +x /usr/local/bin/enable_pwm.sh /usr/local/bin/fan_control.sh
```

## 2. Install systemd Service

Move `enable_pwm.service` to `/etc/systemd/system/`:

```bash
sudo mv enable_pwm.service /etc/systemd/system/
```

Enable and start the service:

```bash
sudo systemctl enable enable_pwm.service
sudo systemctl start enable_pwm.service
```

## 3. Set Up Cron Job

Edit the root crontab:

```bash
sudo crontab -e
```

Add the following line to run the fan control script every minute:

```
* * * * * /usr/local/bin/fan_control.sh
```

