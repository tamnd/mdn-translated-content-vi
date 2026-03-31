---
title: "Permissions-Policy: chỉ thị captured-surface-control"
short-title: captured-surface-control
slug: Web/HTTP/Reference/Headers/Permissions-Policy/captured-surface-control
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.captured-surface-control
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `captured-surface-control` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu có được phép sử dụng [Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) hay không. Cụ thể, các phương thức {{domxref("CaptureController.forwardWheel", "forwardWheel()")}}, {{domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()")}}, {{domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()")}}, và {{domxref("CaptureController.resetZoomLevel", "resetZoomLevel()")}} được kiểm soát bởi chỉ thị này.

Promise được trả về bởi các phương thức chính của API sẽ bị từ chối với `NotAllowedError` {{DOMxRef("DOMException")}} nếu quyền không được cho phép.

## Cú pháp

```http
Permissions-Policy: captured-surface-control=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `captured-surface-control` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
