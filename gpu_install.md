# CUDA 9.2 / cuDNN 7.1


- [CUDA 9.0とcuDNN 7.0をUbuntu 16.04LTSにインストールする - Qiita](https://qiita.com/JeJeNeNo/items/b30597918db3781e20cf)
- [Ubuntu 16.04へのCUDAインストール方法 - Qiita](https://qiita.com/yukoba/items/3692f1cb677b2383c983)
- [TensorFlowをソースからビルドする方法とその効果 | 株式会社カブク](https://www.kabuku.co.jp/developers/tensorflow_source_build)


## CUDA 9.2
- [TensorFlowをソースからビルドする方法とその効果 | 株式会社カブク](https://www.kabuku.co.jp/developers/tensorflow_source_build)
- [CUDA Toolkit Archive | NVIDIA Developer](https://developer.nvidia.com/cuda-toolkit-archive)
- [CUDA Toolkit 9.2 Download | NVIDIA Developer](https://developer.nvidia.com/cuda-downloads)

`Download`から`cuda-repo-ubuntu1604-9-2-local_9.2.148-1_amd64`をダウンロードしてそのディレクトリで以下のコマンド実行

```
wget https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda-repo-ubuntu1604-9-2-local_9.2.148-1_amd64
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb 
sudo apt-key add /var/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
```


## cuDNN 7.1
- [Membership Required | NVIDIA Developer](https://developer.nvidia.com/rdp/cudnn-download) (要メンバー登録)

