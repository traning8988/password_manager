#!/bin/bash
echo パスワードマネージャーへようこそ!

while read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" KEY
do
  case $KEY in
    "Add Password")read -p "サービス名を入力してください:" ServiceName
     	           read -p "ユーザー名を入力してください:" UserName
	           read -p "パスワードを入力してください:" Password
	           echo "$ServiceName:$UserName:$Password" >> password.txt;;
    "Get Password")read -p "サービス名を入力してください:" Service
		   RESULT=$(grep -E "^$Service:" password.txt)
		   IFS=":"
                   set -- $RESULT
		   echo "サービス名：$1"
		   echo "ユーザー名：$2"
		   echo "パスワード：$3";;
    Exit)echo -e "Thank you\033[31m!\033[m"
         exit 0;;
    *)echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。";;
  esac
done
