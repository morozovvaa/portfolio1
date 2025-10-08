#!/bin/bash

# Скрипт для деплоя Hugo сайта на GitHub Pages (gh-pages)

# 1. Собираем сайт
echo "Building site..."
hugo

# 2. Переходим в папку public
cd public || exit

# 3. Инициализируем git, если нужно
if [ ! -d ".git" ]; then
  git init
  git remote add origin https://github.com/morozovvaa/portfolio1.git
fi

# 4. Переключаемся на ветку gh-pages
git fetch origin
git checkout -B gh-pages

# 5. Полностью очищаем ветку
git rm -rf .
git clean -fd

# 6. Добавляем свежую сборку
git add .
git commit -m "Deploy new theme from hugo-coder-experiment"

# 7. Пушим на GitHub
git push -f origin gh-pages

# 8. Возвращаемся в корень проекта
cd ..

echo "Deployment completed! Check https://morozovvaa.github.io/portfolio1/"
