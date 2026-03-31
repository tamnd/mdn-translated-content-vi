---
title: "Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Headers'"
slug: Web/HTTP/Guides/CORS/Errors/CORSInvalidAllowHeader
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Headers'
```

## Điều gì đã xảy ra sai?

Phản hồi cho yêu cầu {{Glossary("CORS")}} được gửi bởi máy chủ bao gồm header {{HTTPHeader("Access-Control-Allow-Headers")}} chứa ít nhất một tên header không hợp lệ.

Header `Access-Control-Allow-Headers` được máy chủ gửi để phản hồi {{Glossary("preflight request")}}; nó cho client biết các [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) nào được phép trong các yêu cầu CORS. Nếu {{Glossary("user agent")}} client tìm thấy trong số các giá trị được phân tách bằng dấu phẩy do header cung cấp bất kỳ tên header nào mà nó không nhận ra, lỗi này xảy ra.

Đây là vấn đề rất có thể chỉ có thể được sửa ở phía máy chủ, bằng cách sửa đổi cấu hình máy chủ để không còn gửi tên header không hợp lệ hoặc không xác định với header `Access-Control-Allow-Headers`. Cũng có thể đáng kiểm tra để đảm bảo rằng user agent hoặc thư viện HTTP bạn đang sử dụng trên client đã được cập nhật.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers)
