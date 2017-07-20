mpeg2decode -i jellyfish-10-mbps-hd-hevc.hevc  --arch X86_SSSE3 --num_cores 2 --soc GENERIC --num_frames -1 -s 0


#hevc

./hevcdecode -i jellyfish-10-mbps-hd-hevc.hevc  --arch X86_SSSE3 --num_cores 1 --soc GENERIC --num_frames -1 -s 0

./hevcdecode -i jellyfish-10-mbps-hd-hevc.hevc  --arch X86_SSSE3 --num_cores 2 --soc GENERIC --num_frames -1 -s 0

./hevcdecode -i jellyfish-10-mbps-hd-hevc.hevc  --arch X86_SSE42 --num_cores 1 --soc GENERIC --num_frames -1 -s 0

./hevcdecode -i jellyfish-10-mbps-hd-hevc.hevc  --arch X86_SSE42 --num_cores 4 --soc GENERIC --num_frames -1 -s 0

./hevcdecode -i jellyfish-10-mbps-hd-hevc.hevc  --arch X86_GENERIC --num_cores 4 --soc GENERIC --num_frames -1 -s 0

#ffmpeg

ffmpeg -y -i  jellyfish-10-mbps-hd-hevc.hevc decodetest/null.yuv


#sample_decode

sample_decode  h265  -sw -i  jellyfish-10-mbps-hd-hevc.hevc 

sample_decode h265 -hw -i jellyfish-10-mbps-hd-hevc.hevc