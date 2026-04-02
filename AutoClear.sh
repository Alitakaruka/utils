#!/bin/bash

# Проверка на права root
if [[ $EUID -ne 0 ]]; then
   echo "Этот скрипт должен быть запущен от root" 
   exit 1
fi

echo "--- Начало обслуживания системы ---"

# Обновление списка пакетов
echo "--- Обновление списков пакетов ---"
apt-get update -y

# Обновление пакетов
echo "--- Обновление установленных пакетов ---"
apt-get upgrade -y

# Обновление дистрибутива (опционально)
# apt-get dist-upgrade -y

# Удаление ненужных зависимостей
echo "--- Удаление ненужных зависимостей ---"
apt-get autoremove -y

# Очистка кэша apt
echo "--- Очистка кэша пакетов ---"
apt-get autoclean -y


sudo apt update; 
sudo update-apt-xapian-index; 
sudo apt upgrade;
 sudo apt install -f;
sudo apt install --fix-broken;
 sudo apt autoclean; 
 sudo apt autoremove; 
 sudo apt autopurge
 history -c

echo "--- Обслуживание завершено ---"
