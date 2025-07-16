#!/bin/bash
# このスクリプトは、Terraformで作成されたすべてのAWSリソースを削除します。
# 実行前に、削除されるリソースのリストが表示され、確認が求められます。

# スクリプトが設置されているディレクトリに移動
cd "$(dirname "$0")"

echo "Terraformの初期化..."
terraform init

echo "AWSインフラの削除計画を生成します..."
# docker_image_url変数はplanの生成に必要だが、destroy時には実際には使われないためダミーの値を渡す
terraform plan -destroy -var="docker_image_url=dummy"

echo "--------------------------------------------------"
echo "上記のリソースが削除されます。"
echo "本当に削除を実行しますか？ 'yes' と入力してください。"
echo "--------------------------------------------------"

# terraform destroyを実行
terraform destroy -var="docker_image_url=dummy"

echo "インフラの削除が完了しました。"
