---
title: "Permissions-Policy: chỉ thị web-share"
short-title: web-share
slug: Web/HTTP/Reference/Headers/Permissions-Policy/web-share
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.web-share
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `web-share` của header HTTP {{HTTPHeader('Permissions-Policy')}} kiểm soát việc tài liệu hiện tại có được phép sử dụng phương thức {{domxref("Navigator.share","Navigator.share()")}} của Web Share API để chia sẻ văn bản, liên kết, hình ảnh và nội dung khác tới các đích tùy ý theo lựa chọn của người dùng hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("Navigator.share()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `NotAllowedError`.

## Cú pháp

```http
Permissions-Policy: web-share=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `web-share` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

<!--
Browser implementation is being discussed in <https://github.com/w3c/web-share/issues/169>.
-->

## Xem thêm

- Header {{HTTPHeader('Permissions-Policy')}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
