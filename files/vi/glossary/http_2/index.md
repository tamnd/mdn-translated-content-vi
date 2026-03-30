---
title: HTTP/2
slug: Glossary/HTTP_2
page-type: glossary-definition
sidebar: glossarysidebar
---

**HTTP/2** là một bản sửa đổi lớn của [giao thức mạng HTTP](/en-US/docs/Web/HTTP).

Các mục tiêu chính của HTTP/2 là giảm {{glossary("latency","độ trễ")}} và {{glossary("head of line blocking","chặn đầu hàng")}}, bằng cách cho phép ghép kênh hoàn toàn các yêu cầu và phản hồi và hỗ trợ ưu tiên hóa yêu cầu, và giảm thiểu overhead giao thức thông qua nén hiệu quả các trường HTTP header (HPACK).

HTTP/2 cũng giới thiệu cơ chế gọi là Server Push, cho phép máy chủ gửi tài nguyên đến client khi dự đoán client sẽ sớm cần chúng. Server Push tỏ ra khó thực hiện trong thực tế, và đã bị loại bỏ khỏi hầu hết các công cụ trình duyệt lớn. Nó đã được thay thế bằng các phương pháp thay thế như [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) và {{HTTPStatus("103", "103 Early hints")}}.

HTTP/2 không sửa đổi ngữ nghĩa của HTTP, có nghĩa là các khái niệm cốt lõi trong HTTP/1.1, như phương thức, mã trạng thái, URI và các trường header vẫn giữ nguyên. Thay vào đó, HTTP/2 sửa đổi cách dữ liệu được định dạng (đóng khung) và truyền tải giữa client và máy chủ, cả hai đều quản lý toàn bộ quá trình, và ẩn sự phức tạp của giao thức trong một lớp đóng khung. Kết quả là, tất cả các ứng dụng hiện có có thể được cung cấp qua giao thức mà không cần sửa đổi.

## Xem thêm

- [HTTP](/en-US/docs/Web/HTTP) trên MDN
- Các thuật ngữ liên quan:
  - {{glossary("HTTP")}}
  - {{glossary("Latency")}}, {{glossary("head of line blocking","Chặn đầu hàng")}}
- {{RFC("7540", "Server Push", "8.2")}}
- [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2) trên Wikipedia
