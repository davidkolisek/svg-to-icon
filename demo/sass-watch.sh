#!/usr/bin/env bash
### sem vlozit cesty k scss:css suborom
watch="main.scss:main.css template.scss:template.css"
echo "Watcher for: main.scss && template.scss"

sass --watch $watch --style compressed