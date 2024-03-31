#!/bin/bash
echo パスワードマネージャーへようこそ!
read -p "サービス名を入力してください:" ServiceName
read -p "ユーザー名を入力してください:" UserName
read -p "パスワードを入力してください:" Password
echo "$ServiceName:$UserName:$Password" >> password.txt
echo -e "Thank you\033[31m!\033[m"

