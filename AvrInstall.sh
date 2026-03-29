sudo apt update
sudo apt install gcc-avr avr-libc binutils-avr avrdude
sudo usermod -aG dialout $USER

echo "All done"