cd ..
git clone https://github.com/ggerganov/llama.cpp

cd llama.cpp
git pull

pip install -r requirements.txt --upgrade

mkdir build
cd build
cmake .. -DLLAMA_CUBLAS=ON
cmake --build . --config Release
