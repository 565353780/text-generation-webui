cd ..
git clone https://github.com/oobabooga/text-generation-webui textgen

cp ./text-generation-webui/characters/instruction-following/* ./textgen/characters/instruction-following/
cp ./text-generation-webui/models/config-user.yaml ./textgen/models/config-user.yaml

cd textgen
git pull

pip uninstall -y exllama
pip uninstall -y llama-cpp-python

pip install -U torch torchvision torchaudio
pip install -r requirements.txt --upgrade

pip install -U git+https://github.com/huggingface/transformers.git
pip install -U git+https://github.com/huggingface/peft.git@70af02a2bca5a63921790036b2c9430edf4037e2
pip install -U git+https://github.com/sterlind/GPTQ-for-LLaMa.git@lora_4bit

pip uninstall -y llama-cpp-python
CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install llama-cpp-python --no-cache-dir
