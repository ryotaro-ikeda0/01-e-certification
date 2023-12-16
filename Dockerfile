FROM python:3.9.7-buster

# パッケージの追加とタイムゾーンの設定
# 必要に応じてインストールするパッケージを追加してください
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    tzdata \
&&  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo


COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
&&  pip3 install -r requirements.txt \
&&  pip install --no-cache-dir \
    black \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git \
    jupyterlab_widgets \
    ipywidgets \
    import-ipynb \
    numpy \
    pandas

RUN rm requirements.txt