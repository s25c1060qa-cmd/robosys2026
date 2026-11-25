#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kota Takeguchi
# SPDX-License-Identifier: BSD-3-Clause

ng () {                               # 関数ngの定義（P18と同じ）
         echo ${1}行目のテスト失敗
         res=1                          # 失敗したことを記録
}

res=0                                  # 0: 失敗なし（ngが呼ばれると1になる）

###timediffのテスト###
out=$(echo 15 | ./timediff -75)         #引数に経度を与えた場合
[ "${out}" = 1.0 ] || ng "$LINENO"

out=$(echo 15 | ./timediff 韓国)        #引数に国名を与えた場合
[ "${out}" = 15.0 ] || ng "$LINENO"

### STARNGE INPUT(timediff)###
out=$(echo abc | ./timediff イギリス)   #標準入力に数字以外を与えた場合
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 15 | ./timediff 火星)        #引数に登録していない単語を与えた場合
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 15 | ./timediff 999)         #引数に-180〜180の範囲外の経度を与えた場合
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"



[ "${res}" = 0 ] && echo OK            # 通ったのが（人間に）分かるように表示
exit $res                              # 終了ステータスを返して終了（機械向け）
