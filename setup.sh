cd ..
git clone https://github.com/oobabooga/text-generation-webui textgen

cp ./text-generation-webui/characters/instruction-following/* ./textgen/characters/instruction-following/
cp ./text-generation-webui/models/config-user.yaml ./textgen/models/config-user.yaml

cd textgen
git pull

pip uninstall -y exllama
pip uninstall -y llama-cpp-python

pip install -r requirements.txt --upgrade

pip uninstall -y llama-cpp-python
CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install llama-cpp-python --no-cache-dir
