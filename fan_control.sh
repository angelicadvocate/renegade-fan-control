#!/bin/bash

# Get the CPU temperature (adjust the path if necessary)
temp=$(cat /sys/class/thermal/thermal_zone0/temp)

# Convert the temperature to Celsius
temp=$((temp / 1000))

# Set fan speed based on temperature
if [ "$temp" -lt 40 ]; then
    # Temperature is less than 40°C, set fan to 25% speed
    echo 750000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 40 ] && [ "$temp" -lt 42 ]; then
    # Temperature is between 40°C and 42°C, set fan to 30% speed
    echo 720000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 42 ] && [ "$temp" -lt 45 ]; then
    # Temperature is between 42°C and 45°C, set fan to 35% speed
    echo 680000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 45 ] && [ "$temp" -lt 48 ]; then
    # Temperature is between 45°C and 48°C, set fan to 40% speed
    echo 640000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 48 ] && [ "$temp" -lt 50 ]; then
    # Temperature is between 48°C and 50°C, set fan to 45% speed
    echo 600000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 50 ] && [ "$temp" -lt 52 ]; then
    # Temperature is between 50°C and 52°C, set fan to 50% speed
    echo 560000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 52 ] && [ "$temp" -lt 55 ]; then
    # Temperature is between 52°C and 55°C, set fan to 55% speed
    echo 520000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 55 ] && [ "$temp" -lt 58 ]; then
    # Temperature is between 55°C and 58°C, set fan to 60% speed
    echo 480000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 58 ] && [ "$temp" -lt 60 ]; then
    # Temperature is between 58°C and 60°C, set fan to 70% speed
    echo 420000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 60 ] && [ "$temp" -lt 62 ]; then
    # Temperature is between 60°C and 62°C, set fan to 80% speed
    echo 360000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
elif [ "$temp" -ge 62 ] && [ "$temp" -lt 65 ]; then
    # Temperature is between 62°C and 65°C, set fan to 90% speed
    echo 300000 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
else
    # Temperature is above 65°C, set fan to 100% speed
    echo 1 | sudo tee /sys/class/pwm/pwmchip0/pwm0/duty_cycle
fi
