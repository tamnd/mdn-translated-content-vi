---
title: "Reason: Credential is not supported if the CORS header 'Access-Control-Allow-Origin' is '*'"
slug: Web/HTTP/Guides/CORS/Errors/CORSNotSupportingCredentials
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: Credential is not supported if the CORS header 'Access-Control-Allow-Origin' is '*'
```

## Điều gì đã xảy ra sai?

Yêu cầu {{Glossary("CORS")}} được thực hiện với cờ thông tin xác thực được đặt, nhưng máy chủ được cấu hình bằng ký tự đại diện (`"*"`) làm giá trị của {{HTTPHeader("Access-Control-Allow-Origin")}}, điều này không cho phép sử dụng thông tin xác thực.

Để sửa vấn đề này ở phía client, hãy đảm bảo giá trị cờ thông tin xác thực là `false` khi phát hành yêu cầu CORS của bạn.

- Nếu sử dụng [Fetch API](/en-US/docs/Web/API/Fetch_API), hãy đảm bảo {{domxref("Request.credentials")}} là `"omit"`.
- Nếu yêu cầu đang được phát hành bằng {{domxref("XMLHttpRequest")}}, hãy đảm bảo bạn không đặt {{domxref("XMLHttpRequest.withCredentials", "withCredentials")}} thành `true`.
- Nếu sử dụng [Server-sent events](/en-US/docs/Web/API/Server-sent_events), hãy đảm bảo {{domxref("EventSource.withCredentials")}} là `false` (đây là giá trị mặc định).

Nếu thay vào đó bạn cần điều chỉnh hành vi của máy chủ, bạn sẽ cần thay đổi giá trị của `Access-Control-Allow-Origin` để cấp quyền truy cập từ nguồn gốc mà client được tải.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
