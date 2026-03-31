---
title: "Reason: Multiple CORS header 'Access-Control-Allow-Origin' not allowed"
slug: Web/HTTP/Guides/CORS/Errors/CORSMultipleAllowOriginNotAllowed
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: Multiple CORS header 'Access-Control-Allow-Origin' not allowed
```

## Điều gì đã xảy ra sai?

Máy chủ đã gửi nhiều hơn một header {{HTTPHeader("Access-Control-Allow-Origin")}}. Điều này không được phép.

Nếu bạn có quyền truy cập vào máy chủ, bạn có thể thay đổi triển khai của mình để trả về nguồn gốc trong header `Access-Control-Allow-Origin`. Bạn không thể gửi lại danh sách các nguồn gốc, vì trình duyệt chỉ chấp nhận giá trị là một nguồn gốc duy nhất hoặc null.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [Enable CORS: I want to add CORS support to my server](https://enable-cors.org/server.html)
