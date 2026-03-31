---
title: "Reason: CORS disabled"
slug: Web/HTTP/Guides/CORS/Errors/CORSDisabled
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS disabled
```

## Điều gì đã xảy ra sai?

Một yêu cầu cần sử dụng {{Glossary("CORS")}} đã được thực hiện, nhưng CORS bị tắt trong trình duyệt của người dùng. Khi điều này xảy ra, người dùng cần bật lại CORS trong trình duyệt của họ.

Trong Firefox, tùy chọn tắt CORS là `content.cors.disable`. Đặt tùy chọn này thành `true` sẽ tắt CORS, vì vậy bất cứ khi nào trường hợp đó xảy ra, các yêu cầu CORS sẽ luôn thất bại với lỗi này.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
