---
title: "Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Methods'"
slug: Web/HTTP/Guides/CORS/Errors/CORSInvalidAllowMethod
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Methods'
```

## Điều gì đã xảy ra sai?

Phản hồi cho yêu cầu {{Glossary("CORS")}} được gửi bởi máy chủ bao gồm header {{HTTPHeader("Access-Control-Allow-Methods")}} chứa ít nhất một tên phương thức không hợp lệ.

Header `Access-Control-Allow-Methods` được máy chủ gửi để cho client biết các [phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods) nào nó hỗ trợ cho các yêu cầu CORS. Giá trị của header là một chuỗi tên phương thức HTTP được phân tách bằng dấu phẩy, chẳng hạn như {{HTTPMethod("GET")}}, {{HTTPMethod("POST")}}, hoặc {{HTTPMethod("HEAD")}}. Nếu bất kỳ giá trị nào được chỉ định không được {{Glossary("user agent")}} client nhận ra, lỗi này xảy ra.

Đây là vấn đề rất có thể chỉ có thể được sửa ở phía máy chủ, bằng cách sửa đổi cấu hình máy chủ để không còn gửi tên phương thức không hợp lệ hoặc không xác định với header `Access-Control-Allow-Methods`. Cũng có thể đáng kiểm tra để đảm bảo rằng user agent hoặc thư viện HTTP bạn đang sử dụng trên client đã được cập nhật.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
