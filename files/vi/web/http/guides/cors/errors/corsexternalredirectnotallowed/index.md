---
title: "Reason: CORS request external redirect not allowed"
slug: Web/HTTP/Guides/CORS/Errors/CORSExternalRedirectNotAllowed
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS request external redirect not allowed
```

## Điều gì đã xảy ra sai?

Yêu cầu {{Glossary("CORS")}} đã được máy chủ phản hồi bằng một chuyển hướng HTTP đến URL trên một nguồn gốc khác với yêu cầu ban đầu, điều này không được phép trong các yêu cầu CORS.

Ví dụ: nếu trang `https://service.tld/fetchdata` được yêu cầu, và phản hồi HTTP là "301 Moved Permanently", "307 Temporary Redirect", hoặc "308 Permanent Redirect" với `Location` là `https://anotherservice.net/getdata`, yêu cầu CORS sẽ thất bại theo cách này.

Để sửa vấn đề, hãy cập nhật code của bạn để sử dụng URL mới theo báo cáo của chuyển hướng, từ đó tránh chuyển hướng.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
