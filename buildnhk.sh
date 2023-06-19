ffmpeg -i "$1" -f lavfi -i "color=c=black:s=1280x720"  -filter_complex "[1]drawtext=fontsize=100:text='N':x=(w-text_w*8)/2:y=(h-text_h)/2:fontcolor=#E55934,
drawtext=fontsize=100:text='H':x=(w-text_w*8)/2 + text_w:y=(h-text_h)/2:fontcolor=#9BC53D,
drawtext=fontsize=100:text='K':x=(w-text_w*8)/2 - 10 + text_w*2:y=(h-text_h)/2:fontcolor=#5BC0EB,
drawtext=fontsize=100:text='N':x=w/2:y=(h-text_h)/2:fontcolor=#D0CEBA,
drawtext=fontsize=100:text='E':x=w/2 + text_w-20:y=(h-text_h)/2:fontcolor=#D0CEBA,
drawtext=fontsize=100:text='W':x=w/2 + text_w*0.92:y=(h-text_h)/2:fontcolor=#D0CEBA,
drawtext=fontsize=100:text='S':x=w/2 + text_w*2.35:y=(h-text_h)/2:fontcolor=#D0CEBA,
drawtext=fontsize=20:text='$2':x=w/2 + 215:y=h/2 - th*2.3:fontcolor=#D0CEBA
" \
	-shortest  -y "${1%.mp3}.mp4"
