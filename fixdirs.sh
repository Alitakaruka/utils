#!/bin/bash

set -e

echo "🔧 Меняем русские пользовательские папки на английские..."

# Проверяем наличие утилиты
if ! command -v xdg-user-dirs-update >/dev/null 2>&1; then
    echo "❌ Пакет xdg-user-dirs не установлен. Устанавливаю..."
    sudo apt update
    sudo apt install -y xdg-user-dirs
fi

# Делаем бэкап текущего конфига
CONFIG_FILE="$HOME/.config/user-dirs.dirs"
if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$CONFIG_FILE.bak"
    echo "📦 Бэкап сохранён: $CONFIG_FILE.bak"
fi

# Устанавливаем английскую локаль для XDG
LANG=en_US.UTF-8 xdg-user-dirs-update --force

echo "✅ Готово."
echo "ℹ️ Перелогинься или перезагрузи систему, чтобы изменения применились."
