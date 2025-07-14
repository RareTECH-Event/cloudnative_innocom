
terraform {
  backend "s3" {
    bucket = "terraform-state-cloudnative-innocom-666944091918" # ★★★ 要変更: Terraformの状態を保存するS3バケット名
    key    = "cloudnative-innocom/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
