#!/usr/bin/env bash
### sem vlozit cesty k scss:css suborom
watch="demo/main.scss:demo/main.css demo/template.scss:demo/template.css"
echo "Watcher for: main.scss && template.scss"

sass --watch $watch