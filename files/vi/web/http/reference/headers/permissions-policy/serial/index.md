---
title: "Permissions-Policy: chỉ thị serial"
short-title: serial
slug: Web/HTTP/Reference/Headers/Permissions-Policy/serial
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.serial
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `serial` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng {{domxref("Web Serial API", "Web Serial API", "", "nocode")}} để giao tiếp với các thiết bị nối tiếp, được kết nối trực tiếp qua cổng nối tiếp, hoặc qua thiết bị USB hoặc Bluetooth mô phỏng cổng nối tiếp hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("Serial.requestPort()")}} và {{domxref("Serial.getPorts()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: serial=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `serial` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
