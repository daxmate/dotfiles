if [ -z "$VIRTUAL_ENV" ]; then
	source ~/codes/video_tools/.venv/bin/activate
fi

~/Codes/video_tools/remove_silence.py $1

if [ -n "$VIRTUAL_ENV" ]; then
	deactivate
fi

