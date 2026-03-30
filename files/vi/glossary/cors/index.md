---
title: CORS
slug: Glossary/CORS
page-type: glossary-definition
sidebar: glossarysidebar
---

**CORS** (Cross-Origin Resource Sharing - Chia sẻ tài nguyên giữa các nguồn gốc khác nhau) là một hệ thống, bao gồm việc truyền {{Glossary("HTTP_header", "HTTP header")}}, xác định liệu trình duyệt có chặn mã JavaScript front-end truy cập các phản hồi cho các yêu cầu giữa các nguồn gốc khác nhau hay không.

[Chính sách bảo mật cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) cấm truy cập tài nguyên giữa các nguồn gốc khác nhau. Nhưng CORS cho phép các máy chủ web có khả năng cho phép truy cập tài nguyên giữa các nguồn gốc khác nhau.

## Các CORS header

- {{HTTPHeader("Access-Control-Allow-Origin")}}
  - : Cho biết liệu phản hồi có thể được chia sẻ hay không.
- {{HTTPHeader("Access-Control-Allow-Credentials")}}
  - : Cho biết liệu phản hồi cho yêu cầu có thể được hiển thị khi cờ thông tin xác thực là true hay không.
- {{HTTPHeader("Access-Control-Allow-Headers")}}
  - : Được sử dụng trong phản hồi cho yêu cầu preflight để chỉ ra các HTTP header nào có thể được sử dụng khi thực hiện yêu cầu thực tế.
- {{HTTPHeader("Access-Control-Allow-Methods")}}
  - : Chỉ định phương thức hoặc các phương thức được phép khi truy cập tài nguyên trong phản hồi cho yêu cầu preflight.
- {{HTTPHeader("Access-Control-Expose-Headers")}}
  - : Cho biết header nào có thể được hiển thị như một phần của phản hồi bằng cách liệt kê tên chúng.
- {{HTTPHeader("Access-Control-Max-Age")}}
  - : Cho biết kết quả của yêu cầu preflight có thể được lưu trong bộ nhớ đệm bao lâu.
- {{HTTPHeader("Access-Control-Request-Headers")}}
  - : Được sử dụng khi phát hành yêu cầu preflight để cho máy chủ biết HTTP header nào sẽ được sử dụng khi thực hiện yêu cầu thực tế.
- {{HTTPHeader("Access-Control-Request-Method")}}
  - : Được sử dụng khi phát hành yêu cầu preflight để cho máy chủ biết [phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) nào sẽ được sử dụng khi thực hiện yêu cầu thực tế.
- {{HTTPHeader("Origin")}}
  - : Cho biết nguồn gốc của một fetch.
- {{HTTPHeader("Timing-Allow-Origin")}}
  - : Chỉ định các nguồn gốc được phép xem các giá trị thuộc tính được truy xuất qua các tính năng của [Resource Timing API](/en-US/docs/Web/API/Performance_API/Resource_timing), mà nếu không thì sẽ được báo cáo là không do các hạn chế giữa các nguồn gốc.

## Xem thêm

- [Chia sẻ tài nguyên giữa các nguồn gốc khác nhau (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [Cross-origin resource sharing](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) trên Wikipedia
- [Đặc tả Fetch](https://fetch.spec.whatwg.org/)
