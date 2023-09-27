# nibbles
AtCoderにnibblesで参加するための実行環境

# イメージ作成
docer build --tag nibbles .

# 実行
docker run -it --rm -v `pwd`:/src nibbles

この状態でmain.nblとinput.txtの変更が監視され、
どちらかが変更されると、cat input.txt | nibbles main.nblが
実行される。

また、
docker run -it --rm nibbles /bin/bash
とすれば、コンテナ内でnibblesを実行できる。
