---
title: "Permissions-Policy: chỉ thị speaker-selection"
short-title: speaker-selection
slug: Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.speaker-selection
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `speaker-selection` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép liệt kê và chọn thiết bị đầu ra âm thanh (loa, tai nghe, v.v.) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này:

- {{domxref("MediaDevices.enumerateDevices()")}} sẽ không trả về thiết bị kiểu _audio output_.
- {{domxref("MediaDevices.selectAudioOutput()")}} sẽ không hiển thị popup để chọn đầu ra âm thanh, và {{jsxref("Promise")}} được trả về sẽ bị từ chối với một {{domxref("DOMException")}} kiểu `NotAllowedError`.
- {{domxref("HTMLMediaElement.setSinkId()")}} và {{domxref("AudioContext.setSinkId()")}} sẽ ném `NotAllowedError` nếu được gọi cho đầu ra âm thanh.

## Cú pháp

```http
Permissions-Policy: speaker-selection=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `speaker-selection` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
