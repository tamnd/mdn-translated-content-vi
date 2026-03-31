---
title: "Permissions-Policy: chỉ thị midi"
short-title: midi
slug: Web/HTTP/Reference/Headers/Permissions-Policy/midi
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.midi
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `midi` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi {{domxref("Navigator.requestMIDIAccess()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `NotAllowedError`.

## Cú pháp

```http
Permissions-Policy: midi=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `midi` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
