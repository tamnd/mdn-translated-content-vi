---
title: "Permissions-Policy: chỉ thị local-fonts"
short-title: local-fonts
slug: Web/HTTP/Reference/Headers/Permissions-Policy/local-fonts
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.local-fonts
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `local-fonts` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép thu thập dữ liệu về các phông chữ được cài đặt cục bộ của người dùng thông qua phương thức {{DOMxRef("Window.queryLocalFonts()")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các {{jsxref("Promise")}} được trả về bởi {{DOMxRef("Window.queryLocalFonts()")}} sẽ bị từ chối với một {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: local-fonts=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `local-fonts` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Local Font Access API", "Local Font Access API", "", "nocode")}}
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
