sudo apt update
sudo apt install gcc-avr avr-libc binutils-avr avrdude
sudo apt install make



#rules 
#com port
sudo usermod -aG dialout $USER
#usbasp
echo "Setting up USBasp udev rules..."

RULE_FILE="/etc/udev/rules.d/usbasp.rules"

# Проверка root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

# Создаём правило
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="16c0", ATTR{idProduct}=="05dc", MODE="0666"' > $RULE_FILE

echo "Rule written to $RULE_FILE"

# Перезагрузка правил
udevadm control --reload-rules
udevadm trigger

echo "Udev rules reloaded"

echo "Now unplug and replug your USBasp device"

# Проверка
echo "Checking device list:"
lsusb | grep 16c0:05dc

echo "Done."

# echo "Add user in dialout!"
# sudo usermod -aG dialout $USER
# newgrp dialout
# groups

echo "All done. Please reboot the computer."
