---
title: "Permissions-Policy: chỉ thị window-management"
short-title: window-management
slug: Web/HTTP/Reference/Headers/Permissions-Policy/window-management
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.window-management
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `window-management` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Window Management API](/en-US/docs/Web/API/Window_Management_API) để quản lý các cửa sổ trên nhiều màn hình hay không.

Khi chính sách này cấm việc sử dụng API:

- {{jsxref("Promise")}} được trả về bởi phương thức {{domxref("Window.getScreenDetails()")}} sẽ bị từ chối với ngoại lệ `NotAllowedError`.
- Thuộc tính {{domxref("Screen.isExtended", "Window.screen.isExtended")}} sẽ luôn trả về `false`.

## Cú pháp

```http
Permissions-Policy: window-management=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `window-management` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
