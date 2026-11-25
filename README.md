# timediffコマンド
![test](https://github.com/s25c1060qa-cmd/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から受け取った日本の時刻に対し、引数で指定された国名や経度から時差を計算して加味し、現地の時刻を標準出力に出力する。

## 動作環境
OS: Ubuntu24.04.1 LTS
ライブラリ: Python 3.9 以上（標準ライブラリの `sys`、`datetime`、`zoneinfo` を使用）
- テスト済みバージョン: 3.10~3.14
## セットアップ方法
1. リポジトリのクローン
```bash
$ cd ~
$ git clone https://github.com/s25c1060qa-cmd/robosys2026.git
```
2. 実行権限の付与
```bash
$ cd robosys2026/
$ chmod +x timediff
```
## 使い方
標準入力で日本の時刻（0〜24の数値）を渡し、引数に国名または経度（-180〜180）を指定する。
(echo＜日本の時刻＞ | ./timediff ＜国名 or 経度＞と打ち込む。)以下に例を挙げる。
### 例1
```bash
$ echo 15 | ./timediff 75
```
### 例2
```bash
$ echo 15 | ./timediff 韓国
```
## テスト結果
<img width="771" height="105" alt="image" src="https://github.com/user-attachments/assets/85eef7d4-c8ad-4fcb-92ab-0b99b1fbd905" />

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 Kota Takeguchi
