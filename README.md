# renegade-fan-control – Libre Renegade (ROC-RK3328-CC)

*See attached images for what pins to use*

## 0. Prerequisites

```bash
sudo apt update
sudo apt install git
```

```bash
git clone https://github.com/angelicadvocate/renegade-fan-control.git
```

```bash
cd renegade-fan-control
```

## 1. Install Scripts

Move the following files to `/usr/local/bin/`:

- `enable_pwm.sh`  
- `fan_control.sh`

```bash
sudo mv enable_pwm.sh /usr/local/bin/enable_pwm.sh
sudo mv fan_control.sh /usr/local/bin/fan_control.sh
```

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

## 4. Cleanup Leftover Files

```bash
cd ..
sudo rm -r renegade-fan-control
```
