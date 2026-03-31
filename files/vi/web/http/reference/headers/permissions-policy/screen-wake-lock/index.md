---
title: "Permissions-Policy: chỉ thị screen-wake-lock"
short-title: screen-wake-lock
slug: Web/HTTP/Reference/Headers/Permissions-Policy/screen-wake-lock
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.screen-wake-lock
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị **`screen-wake-lock`** của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Screen Wake Lock API](/en-US/docs/Web/API/Screen_Wake_Lock_API) để chỉ ra rằng thiết bị không nên làm mờ hoặc tắt màn hình hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("WakeLock.request()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `NotAllowedError`.

## Cú pháp

```http
Permissions-Policy: screen-wake-lock=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `screen-wake-lock` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Screen Wake Lock API](/en-US/docs/Web/API/Screen_Wake_Lock_API)
- Header {{HTTPHeader('Permissions-Policy')}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
