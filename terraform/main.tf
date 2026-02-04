# 1. Khai báo Provider (Sử dụng Local provider để dễ demo)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

# 2. Định nghĩa một biến (Concept: Variables)
variable "app_name" {
  type    = string
  default = "TicketBox-Event-Platform"
}

# 3. Tạo một file cấu hình hạ tầng giả lập (Concept: Resources)
# Đây là minh chứng cho việc dùng mã lệnh để sinh ra tài nguyên
resource "local_file" "infrastructure_config" {
  content  = "Hệ thống: ${var.app_name}\nTrạng thái: Đã khởi tạo hạ tầng thành công.\nNgày tạo: ${timestamp()}"
  filename = "${path.module}/generated_infra_report.txt"
}

# 4. Xuất thông tin ra màn hình (Concept: Outputs)
output "config_path" {
  value       = local_file.infrastructure_config.filename
  description = "Đường dẫn file hạ tầng đã tạo"
}