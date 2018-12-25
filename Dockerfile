# Rubyの公式コンテナ（Docker イメージ、実行環境、命令の標準セットを含む）を使う
FROM ruby:2.5.0

# RubyイメージはDebianイメージをベースにしているため、apt-getを使い依存関係をインストールする
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# /lib/railbook を作業用ディレクトリに設定する
# 以下のRUN,CMD,ENTRYPOINT,COPY,ADDコマンドはこのディレクトリ配下で実行される
RUN mkdir /railbook
WORKDIR /railbook

# Gemfile をコピーして bundle install する
COPY Gemfile /railbook/Gemfile
COPY Gemfile.lock /railbook/Gemfile.lock
RUN bundle install

COPY . /railbook