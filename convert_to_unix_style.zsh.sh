#!/usr/bin/zsh -eu
# debug option : -eux

# @ref [ディレクトリ内のファイルの改行コードをLFに統一（nkfコマンド） - Qiita](https://qiita.com/kkdd/items/ac8796b790dc5978aadf)

# Rquirements
#   shell
#       - bash
#       - zsh

# ":"を区切り文字とする
# ここで bash を使ったほうが処理が圧倒的に早かった
x=$(find . -type f \
    | xargs -I{0} bash -c '\
        nkf --guess {0} \
        | xargs -I{1} echo {0}:{1}')

# エンコードスタイルで取捨選択
#ENCODING=\
#    $(echo ${x} \
#    | grep -e EUC-JP \
#           -e Shift-JIS)
#NEWLINE_CHAR=\
#    $(echo ${x} \
#    | grep -e MIXED\ NL \
#           -e CRLF)

# [shell script - How to properly collect an array of lines in zsh - Unix & Linux Stack Exchange](https://unix.stackexchange.com/a/29748/312216)
# @ 入力をスペース刻み(デフォルト挙動)で list にする
# f fを指定することで改行ごとにlistにするオプションを指定している.

x=(${(@f)${x}})
for a in ${x};
do
    # [Split string with zsh as in Python - Stack Overflow](https://stackoverflow.com/q/2930238/9316234)
    b=(${(@s/:/)${a}})
    if [ $(echo ${b[2]} \
           | grep -e EUC-JP \
                  -e Shift-JIS) ]; then
        echo "encoding    " ${b[1]} ${b[2]}
        # LF (Unix)
        nkf -Lu -d --in-place ${b[1]}
    fi
    if [ $(echo ${b[2]} \
           | grep -e MIXED\ NL \
                  -e CRLF) ]; then
        echo "newline char" ${b[1]} ${b[2]}
        # UTF-8 (without MOD) encoding
        nkf -w -w80 --in-place ${b[1]}
    fi
done


