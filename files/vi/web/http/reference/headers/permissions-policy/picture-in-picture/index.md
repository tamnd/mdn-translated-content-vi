---
title: "Permissions-Policy: chỉ thị picture-in-picture"
short-title: picture-in-picture
slug: Web/HTTP/Reference/Headers/Permissions-Policy/picture-in-picture
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.picture-in-picture
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `picture-in-picture` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép phát video ở chế độ {{domxref("Picture-in-Picture API", "Picture-in-Picture", "", "nocode")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("HTMLVideoElement.requestPictureInPicture()")}} sẽ ném một {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: picture-in-picture=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `picture-in-picture` là `*`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
