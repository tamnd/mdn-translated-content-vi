---
title: "Permissions-Policy: chỉ thị display-capture"
short-title: display-capture
slug: Web/HTTP/Reference/Headers/Permissions-Policy/display-capture
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.display-capture
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `display-capture` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu có được phép sử dụng [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API), tức là {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} để chụp nội dung màn hình hay không.

Nếu `display-capture` bị vô hiệu hóa trong một tài liệu, tài liệu đó sẽ không thể khởi tạo chụp màn hình thông qua {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} và sẽ ném ngoại lệ `NotAllowedError`.

## Cú pháp

```http
Permissions-Policy: display-capture=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `display-capture` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
