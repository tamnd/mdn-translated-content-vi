---
title: "Reason: expected 'true' in CORS header 'Access-Control-Allow-Credentials'"
slug: Web/HTTP/Guides/CORS/Errors/CORSMIssingAllowCredentials
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: expected 'true' in CORS header 'Access-Control-Allow-Credentials'
```

## Điều gì đã xảy ra sai?

Yêu cầu {{Glossary("CORS")}} yêu cầu máy chủ cho phép sử dụng thông tin xác thực, nhưng giá trị của header {{HTTPHeader("Access-Control-Allow-Credentials")}} của máy chủ không được đặt thành `true` để kích hoạt việc sử dụng chúng.

Để sửa vấn đề này ở phía client, hãy sửa đổi code để không yêu cầu sử dụng thông tin xác thực.

- Nếu sử dụng [Fetch API](/en-US/docs/Web/API/Fetch_API), hãy đảm bảo {{domxref("Request.credentials")}} là `"omit"`.
- Nếu yêu cầu đang được phát hành bằng {{domxref("XMLHttpRequest")}}, hãy đảm bảo bạn không đặt {{domxref("XMLHttpRequest.withCredentials", "withCredentials")}} thành `true`.
- Nếu sử dụng [Server-sent events](/en-US/docs/Web/API/Server-sent_events), hãy đảm bảo {{domxref("EventSource.withCredentials")}} là `false` (đây là giá trị mặc định).

Để loại bỏ lỗi này bằng cách thay đổi cấu hình máy chủ, hãy điều chỉnh cấu hình máy chủ để đặt giá trị của header `Access-Control-Allow-Credentials` thành `true`.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
