#!/bin/bash
echo パスワードマネージャーへようこそ!

while read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" KEY
do
  case $KEY in
    "Add Password")while read -p "サービス名を入力してください:" ServiceName
				   do
					 if [ -z "$ServiceName" ]; then
					   :
					 else
						break
					 fi
				   done

     	           while read -p "ユーザー名を入力してください:" UserName
				   do
				     if [ -z "$UserName" ]; then
					   :
					 else
					   break
				     fi
				   done

	               while read -p "パスワードを入力してください:" Password
				   do
				     if [ -z "$Password" ]; then
					   :
					 else
					   break
				     fi
				   done
				   gpg -d password.txt.gpg > password.txt 2> /dev/null
				   echo 02178906 > /dev/null
	               rm password.txt.gpg
				   echo "$ServiceName:$UserName:$Password" >> password.txt
				   gpg -e -r s02178906@gmail.com password.txt
		   		   echo "パスワードの追加は成功しました。"
				   rm password.txt;;
    "Get Password")gpg -d password.txt.gpg > password.txt 2> /dev/null
		   		   echo 02178906 > /dev/null
		   		   read -p "サービス名を入力してください:" Service
		   		   RESULT=$(grep -E "^$Service:" password.txt)
					 if [ -n "$RESULT" ]; then
					   IFS=":"
								set -- $RESULT
					   echo "サービス名：$1"
					   echo "ユーザー名：$2"
					   echo "パスワード：$3"
					 else
					   echo "そのサービスは登録されていません。"
					 fi
				   rm password.txt;;
    Exit)echo -e "Thank you\033[31m!\033[m"
         exit 0;;
    *)echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。";;
  esac
done
