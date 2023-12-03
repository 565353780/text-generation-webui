cd ..
git clone https://github.com/oobabooga/text-generation-webui textgen

cp ./text-generation-webui/characters/* ./textgen/characters/
cp ./text-generation-webui/models/config-user.yaml ./textgen/models/config-user.yaml

cd textgen
git pull

mkdir repositories
cd repositories
git clone https://github.com/johnsmith0031/alpaca_lora_4bit
cd ..

pip uninstall -y exllama
pip uninstall -y llama-cpp-python

pip install -U torch torchvision torchaudio
pip install -r requirements.txt --upgrade

pip install -U git+https://github.com/huggingface/transformers.git
pip install -U git+https://github.com/sterlind/GPTQ-for-LLaMa.git@lora_4bit

pip uninstall -y llama-cpp-python
CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install llama-cpp-python --no-cache-dir
