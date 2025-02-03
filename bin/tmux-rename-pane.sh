#!/bin/bash

declare -A paths=(
  # ParrotPoster
  # ~/projects/parrotposter/code/*
  ["api-server"]="api"
  ["back-app-2.0"]="back"
  ["front-app-2.0"]="front"
  ["frontend-vuexy"]="front-old"
  ["image-formatter-server"]="image-formatter"
  ["insta-api-server"]="insta"
  ["jenkins-shared-libs"]="jenkins"
  ["scheduler-server"]="scheduler"
  ["social-fb-server"]="fb"
  ["social-ig-server"]="ig"
  ["social-ok-server"]="ok"
  ["social-tg-server"]="tg"
  ["social-tw-server"]="tw"
  ["social-vk-server"]="vk"
  ["www/wp.loc/wp-content/plugins/parrotposter"]="wp"
  ["www/bx-start-8.loc/local/modules/vettich.sp3"]="bx"

  # Avangard
  # ~/projects/avangard/*
  ["av-api"]="api"
  ["av-auth"]="auth"
  ["av-frontapp-online"]="online"
  ["av-frontapp-center"]="center"
  ["av-regions"]="regions"
)

current_path="${1:-$(pwd)}"
current_dir_name=$(basename "$current_path")

# Проверяем полные пути и имена папок
for key in "${!paths[@]}"; do
  if [[ "$current_path" == *"$key"* ]] || [[ "$current_dir_name" == "$key" ]]; then
    echo "${paths[$key]}"
    exit 0
  fi
done

# Если не найдено соответствие, выводим имя текущей папки
echo "$current_dir_name" | cut -c1-16
