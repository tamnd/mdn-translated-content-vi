---
title: "Permissions-Policy: chỉ thị aria-notify"
short-title: aria-notify
slug: Web/HTTP/Reference/Headers/Permissions-Policy/aria-notify
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.aria-notify
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `aria-notify` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng các phương thức {{domxref("Document.ariaNotify()")}} và {{domxref("Element.ariaNotify()")}} để phát các thông báo cho {{glossary("screen reader")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng, mọi thông báo được tạo bằng `ariaNotify()` sẽ âm thầm thất bại (chúng sẽ không được gửi đi).

## Cú pháp

```http
Permissions-Policy: aria-notify=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `aria-notify` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- {{domxref("Document.ariaNotify()")}}, {{domxref("Element.ariaNotify()")}}
