# 🎟️ TicketBox - Hệ thống Đặt vé Sự kiện Microservices

![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen) ![Java](https://img.shields.io/badge/Java-21-orange) ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-green) ![Docker](https://img.shields.io/badge/Docker-Compose-blue)

Dự án bài tập lớn môn **Kiến trúc Phần mềm**, xây dựng nền tảng đặt vé sự kiện trực tuyến hiệu năng cao dựa trên kiến trúc Microservices.

## 🚀 Công nghệ sử dụng (Tech Stack)

### Backend Core (JDK 21)

- **Spring Boot 3:** Framework chính.
- **Spring Cloud Gateway:** API Gateway, Rate Limiting.
- **Spring Security + JWT:** Authentication & Authorization.
- **Spring Data JPA:** ORM làm việc với MySQL.
- **Resilience4j:** Circuit Breaker & Retry Mechanism.

### Infrastructure & DevOps

- **Docker & Docker Compose:** Containerization (7+ Containers).
- **MySQL 8.0:** Cơ sở dữ liệu quan hệ.
- **Redis:** Caching & Rate Limiter Storage.
- **RabbitMQ:** Message Queue xử lý đặt vé bất đồng bộ (Async).
- **Jenkins & GitLab CI:** CI/CD Pipelines.
- **Terraform:** Infrastructure as Code (IaC) demo.

---

## 🏗️ Kiến trúc Hệ thống

Hệ thống bao gồm 9 Microservices độc lập:

| Service              | Port   | Nhiệm vụ chính                             |
| :------------------- | :----- | :----------------------------------------- |
| **api-gateway**      | `8080` | Cổng vào duy nhất, điều hướng, Rate Limit. |
| **identity-service** | `8081` | Đăng ký, Đăng nhập, cấp phát JWT.          |
| **event-service**    | `8082` | Quản lý sự kiện, tích hợp Redis Cache.     |
| **ticket-service**   | `8083` | Quản lý kho vé.                            |
| **booking-service**  | `8084` | Xử lý đặt vé, Retry, tích hợp RabbitMQ.    |
| **payment-service**  | `8085` | Giả lập thanh toán.                        |
| ...                  | ...    | (Các service khác)                         |

---

## 🛠️ Hướng dẫn Cài đặt & Chạy (Dành cho Giảng viên)

### Cách 1: Chạy toàn bộ bằng Docker (Khuyên dùng)

Yêu cầu: Đã cài Docker Desktop.

```bash
# 1. Clone dự án
git clone <LINK_GITLAB_CUA_BAN>
cd EVENT-TICKETING-PLATFORM

# 2. Build và Run (Tự động tải DB, Redis, RabbitMQ và build Java app)
docker-compose up --build
Bước 2: Kiểm tra trạng thái
API Documentation (Swagger): http://localhost:8080/swagger-ui.html

RabbitMQ Dashboard: http://localhost:15672 (User/Pass: guest/guest)

GitLab Pipeline: Truy cập mục Build > Pipelines để xem minh chứng CI/CD.
```
