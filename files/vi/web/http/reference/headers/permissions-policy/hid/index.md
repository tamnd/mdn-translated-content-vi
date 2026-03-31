---
title: "Permissions-Policy: chỉ thị hid"
short-title: hid
slug: Web/HTTP/Reference/Headers/Permissions-Policy/hid
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.hid
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `hid` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng {{domxref("WebHID API", "WebHID API", "", "nocode")}} để kết nối với các thiết bị giao diện người dùng không phổ biến hoặc đặc biệt như bàn phím thay thế hoặc gamepad hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng WebHID, thuộc tính {{domxref("Navigator.hid")}} sẽ không có sẵn.

## Cú pháp

```http
Permissions-Policy: hid=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `hid` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
