../llama.cpp/build/bin/main \
	-m ../textgen/models/guanaco-65B.ggmlv3.q2_K.bin \
	--n-gpu-layers 10 \
	--threads 16 \
	-n 256 \
	-i \
	-r "User:" \
	-f ../llama.cpp/prompts/chat-with-bob.txt \
	--repeat_penalty 1.0 \
	--color
