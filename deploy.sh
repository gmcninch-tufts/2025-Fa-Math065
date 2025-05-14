#!/usr/bin/env bash

echo "deploying math65-site"
cd /home/george/Prof-VC/classes/2025-Fa-Math065/
git add .
read -p "Commit message: " msg
git commit -m "$msg"
git push origin main
