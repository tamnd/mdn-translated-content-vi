---
title: "Permissions-Policy: chỉ thị usb"
short-title: usb
slug: Web/HTTP/Reference/Headers/Permissions-Policy/usb
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.usb
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `usb` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng {{domxref("WebUSB API", "WebUSB API", "", "nocode")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng WebUSB, thuộc tính {{domxref("Navigator.usb")}} sẽ không có sẵn.

## Cú pháp

```http
Permissions-Policy: usb=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `usb` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader('Permissions-Policy')}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
