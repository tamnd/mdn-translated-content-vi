---
title: "Permissions-Policy: chỉ thị accelerometer"
short-title: accelerometer
slug: Web/HTTP/Reference/Headers/Permissions-Policy/accelerometer
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.accelerometer
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `accelerometer` của header HTTP {{HTTPHeader('Permissions-Policy')}} kiểm soát việc tài liệu hiện tại có được phép thu thập thông tin về gia tốc của thiết bị thông qua giao diện {{domxref('Accelerometer')}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi constructor {{domxref("Accelerometer.Accelerometer", "Accelerometer()")}} sẽ ném một {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: accelerometer=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `accelerometer` là: `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader('Permissions-Policy')}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
