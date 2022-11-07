terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token = "y0_AgAAAABkpk0NAATuwQAAAADSwkfOmQ835bV7TKqjVbXe1ht1599AzVs"
  cloud_id = "b1gfqsibs2oth9v8tqp5"
  folder_id = var.folder_id
}

#Создаем сервис аккаунт SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name = "sa-testmaxim"
}

#Даем права на запись для этого SA
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
  role      = "storage.editor"
}

#Создаем ключи доступа Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description = "static access key for object storage"
}

#Создаем хранилище
resource "yandex_storage_bucket" "state" {
  bucket = "tf-state-bucket-testmaxim"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}