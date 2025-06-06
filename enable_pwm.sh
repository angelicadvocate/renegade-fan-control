#!/bin/bash

sudo ldto enable pwm2
sleep 1
echo 0 | sudo tee /sys/class/pwm/pwmchip0/export
sleep 1
echo 1 | sudo tee /sys/class/pwm/pwmchip0/export
sleep 1
echo 1000000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/period
sleep 1
echo 500000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
sleep 1
echo 1 | sudo tee /sys/class/pwm/pwmchip0/pwm0/enable
sleep 1

exit
