---
title: "Permissions-Policy: chỉ thị idle-detection"
short-title: idle-detection
slug: Web/HTTP/Reference/Headers/Permissions-Policy/idle-detection
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.idle-detection
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `idle-detection` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng {{domxref("Idle Detection API", "Idle Detection API", "", "nocode")}} để phát hiện khi người dùng đang tương tác với thiết bị của họ, ví dụ để báo cáo trạng thái "available"/"away" trong các ứng dụng chat hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("IdleDetector.start()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `NotAllowedError`.

## Cú pháp

```http
Permissions-Policy: idle-detection=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `idle-detection` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
