---
title: "Reason: CORS header 'Origin' cannot be added"
slug: Web/HTTP/Guides/CORS/Errors/CORSOriginHeaderNotAdded
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS header 'Origin' cannot be added
```

## Điều gì đã xảy ra sai?

{{Glossary("user agent")}} không thể thêm header {{HTTPHeader("Origin")}} bắt buộc vào yêu cầu {{Glossary("HTTP")}}. Tất cả các yêu cầu CORS phải có header `Origin`.

Điều này có thể xảy ra nếu code JavaScript đang chạy với đặc quyền nâng cao cho phép nó truy cập nội dung của nhiều domain, chẳng hạn.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
