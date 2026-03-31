---
title: "Permissions-Policy: chỉ thị autoplay"
short-title: autoplay
slug: Web/HTTP/Reference/Headers/Permissions-Policy/autoplay
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.autoplay
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `autoplay` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép tự động phát phương tiện được yêu cầu thông qua giao diện {{domxref("HTMLMediaElement")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này và không có cử chỉ của người dùng, {{jsxref("Promise")}} được trả về bởi {{domxref("HTMLMediaElement.play()")}} sẽ bị từ chối với một {{domxref("DOMException")}}. Thuộc tính [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/audio#autoplay) trên các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}} sẽ bị bỏ qua.

> [!NOTE]
> Để biết thêm chi tiết về autoplay và chặn autoplay, xem bài viết [Hướng dẫn autoplay cho phương tiện và Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay).

## Cú pháp

```http
Permissions-Policy: autoplay=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `autoplay` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
