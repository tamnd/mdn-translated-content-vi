---
title: "Permissions-Policy: chỉ thị encrypted-media"
short-title: encrypted-media
slug: Web/HTTP/Reference/Headers/Permissions-Policy/encrypted-media
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.encrypted-media
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `encrypted-media` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng API [Encrypted Media Extensions](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) (EME) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, {{jsxref("Promise")}} được trả về bởi {{domxref("Navigator.requestMediaKeySystemAccess","Navigator.requestMediaKeySystemAccess()")}} sẽ bị từ chối với {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: encrypted-media=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `encrypted-media` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
