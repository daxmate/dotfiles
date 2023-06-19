#!/usr/bin/env bash

osascript <<'END'
tell application "Terminal"
	do script "nvim ~/Library/Rime/wubi86_user.dict.yaml"
	activate
end tell
END
