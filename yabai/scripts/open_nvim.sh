#!/usr/bin/env bash

osascript <<'END'
tell application "Terminal"
	do script "nvim"
	activate
end tell
END
