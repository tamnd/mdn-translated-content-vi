---
title: HTTP request methods
short-title: Request methods
slug: Web/HTTP/Reference/Methods
page-type: landing-page
browser-compat: http.methods
sidebar: http
---

HTTP định nghĩa một tập hợp các **phương thức yêu cầu** để chỉ ra mục đích của yêu cầu và những gì được mong đợi nếu yêu cầu thành công.
Mặc dù chúng cũng có thể là danh từ, các phương thức yêu cầu này đôi khi được gọi là _HTTP verbs_ (động từ HTTP).
Mỗi phương thức yêu cầu có ngữ nghĩa riêng, nhưng một số đặc điểm được chia sẻ trên nhiều phương thức, cụ thể là các phương thức yêu cầu có thể là {{glossary("Safe/HTTP", "an toàn")}}, {{glossary("idempotent", "bất biến")}}, hoặc {{glossary("cacheable", "có thể lưu đệm")}}.

- {{HTTPMethod("GET")}}
  - : Phương thức `GET` yêu cầu một biểu diễn của tài nguyên được chỉ định.
    Các yêu cầu sử dụng `GET` chỉ nên lấy dữ liệu và không nên chứa {{Glossary("HTTP Content", "nội dung")}} yêu cầu.
- {{HTTPMethod("HEAD")}}
  - : Phương thức `HEAD` yêu cầu một phản hồi giống hệt yêu cầu `GET`, nhưng không có phần thân phản hồi.
- {{HTTPMethod("POST")}}
  - : Phương thức `POST` gửi một thực thể đến tài nguyên được chỉ định, thường gây ra sự thay đổi trạng thái hoặc tác dụng phụ trên máy chủ.
- {{HTTPMethod("PUT")}}
  - : Phương thức `PUT` thay thế tất cả các biểu diễn hiện tại của tài nguyên đích bằng {{Glossary("HTTP Content", "nội dung")}} yêu cầu.
- {{HTTPMethod("DELETE")}}
  - : Phương thức `DELETE` xóa tài nguyên được chỉ định.
- {{HTTPMethod("CONNECT")}}
  - : Phương thức `CONNECT` thiết lập một đường hầm đến máy chủ được xác định bởi tài nguyên đích.
- {{HTTPMethod("OPTIONS")}}
  - : Phương thức `OPTIONS` mô tả các tùy chọn giao tiếp cho tài nguyên đích.
- {{HTTPMethod("TRACE")}}
  - : Phương thức `TRACE` thực hiện kiểm tra vòng lặp thông điệp dọc theo đường dẫn đến tài nguyên đích.
- {{HTTPMethod("PATCH")}}
  - : Phương thức `PATCH` áp dụng các sửa đổi một phần cho tài nguyên.

## Các phương thức yêu cầu an toàn, bất biến và có thể lưu đệm

Bảng sau liệt kê các phương thức yêu cầu HTTP và cách phân loại chúng theo mức độ an toàn, khả năng lưu đệm và tính bất biến.

| Phương thức               | An toàn | Bất biến | Có thể lưu đệm |
| ------------------------- | ------- | -------- | -------------- |
| {{HTTPMethod("GET")}}     | Có      | Có       | Có             |
| {{HTTPMethod("HEAD")}}    | Có      | Có       | Có             |
| {{HTTPMethod("OPTIONS")}} | Có      | Có       | Không          |
| {{HTTPMethod("TRACE")}}   | Có      | Có       | Không          |
| {{HTTPMethod("PUT")}}     | Không   | Có       | Không          |
| {{HTTPMethod("DELETE")}}  | Không   | Có       | Không          |
| {{HTTPMethod("POST")}}    | Không   | Không    | Có điều kiện\* |
| {{HTTPMethod("PATCH")}}   | Không   | Không    | Có điều kiện\* |
| {{HTTPMethod("CONNECT")}} | Không   | Không    | Không          |

\* `POST` và `PATCH` có thể lưu đệm khi phản hồi đưa ra thông tin [độ tươi mới](/en-US/docs/Web/HTTP/Guides/Caching) và một tiêu đề {{HTTPHeader("Content-Location")}} phù hợp.

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
