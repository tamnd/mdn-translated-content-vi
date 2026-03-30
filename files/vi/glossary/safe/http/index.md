---
title: Safe (HTTP Methods)
slug: Glossary/Safe/HTTP
page-type: glossary-definition
sidebar: glossarysidebar
---

Một phương thức HTTP được gọi là **an toàn** nếu nó không làm thay đổi trạng thái của máy chủ. Nói cách khác, một phương thức là an toàn nếu nó chỉ dẫn đến thao tác đọc. Một số phương thức HTTP phổ biến là an toàn: {{HTTPMethod("GET")}}, {{HTTPMethod("HEAD")}}, hoặc {{HTTPMethod("OPTIONS")}}. Tất cả các phương thức an toàn cũng đều là {{glossary("idempotent")}}, nhưng không phải mọi phương thức idempotent đều là an toàn. Ví dụ, {{HTTPMethod("PUT")}} và {{HTTPMethod("DELETE")}} đều idempotent nhưng không an toàn.

Mặc dù các phương thức an toàn có ngữ nghĩa chỉ đọc, máy chủ vẫn có thể thay đổi trạng thái của mình: ví dụ, chúng có thể ghi nhật ký hoặc lưu thống kê. Điều quan trọng ở đây là khi gọi một phương thức an toàn, client không yêu cầu bất kỳ thay đổi nào trên máy chủ, và do đó sẽ không tạo ra tải hay gánh nặng không cần thiết cho máy chủ. Trình duyệt có thể gọi các phương thức an toàn mà không lo gây hại cho máy chủ; điều này cho phép chúng thực hiện các hoạt động như tải trước (pre-fetching) mà không có rủi ro. Các bộ thu thập dữ liệu web (web crawler) cũng dựa vào việc gọi các phương thức an toàn.

Các phương thức an toàn không nhất thiết chỉ phục vụ các tệp tĩnh; máy chủ có thể tạo ra phản hồi cho một phương thức an toàn ngay trong lúc xử lý, miễn là đoạn mã tạo ra phản hồi đó đảm bảo tính an toàn: nó không được kích hoạt các hiệu ứng bên ngoài, như kích hoạt một đơn hàng trên trang web thương mại điện tử.

Trách nhiệm đảm bảo ngữ nghĩa an toàn được thực thi đúng cách thuộc về ứng dụng trên máy chủ; bản thân máy chủ web, dù là Apache, Nginx hay IIS, không thể tự thực thi điều đó. Đặc biệt, một ứng dụng không nên cho phép các yêu cầu {{HTTPMethod("GET")}} thay đổi trạng thái của nó.

Một lệnh gọi phương thức an toàn, không thay đổi trạng thái máy chủ:

```http
GET /pageX.html HTTP/1.1
```

Một lệnh gọi phương thức không an toàn, có thể thay đổi trạng thái máy chủ:

```http
POST /pageX.html HTTP/1.1
```

Một lệnh gọi phương thức idempotent nhưng không an toàn:

```http
DELETE /idX/delete HTTP/1.1
```

## Xem thêm

- Định nghĩa về [safe](https://httpwg.org/specs/rfc9110.html#safe.methods) trong đặc tả HTTP.
- Mô tả các phương thức an toàn phổ biến: {{HTTPMethod("GET")}}, {{HTTPMethod("HEAD")}}, {{HTTPMethod("OPTIONS")}}
- Mô tả các phương thức không an toàn phổ biến: {{HTTPMethod("PUT")}}, {{HTTPMethod("DELETE")}}, {{HTTPMethod("POST")}}
