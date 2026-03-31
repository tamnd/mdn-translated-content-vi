---
title: "Permissions-Policy: chỉ thị xr-spatial-tracking"
short-title: xr-spatial-tracking
slug: Web/HTTP/Reference/Headers/Permissions-Policy/xr-spatial-tracking
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.xr-spatial-tracking
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `xr-spatial-tracking` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này:

- Các lần gọi {{DOMxRef("XRSystem/isSessionSupported","navigator.xr.isSessionSupported()")}} và {{DOMxRef("XRSystem/requestSession","navigator.xr.requestSession()")}} sẽ trả về một {{jsxref("Promise")}} bị từ chối với một {{domxref("DOMException")}} kiểu `SecurityError`.

- Các sự kiện {{domxref("XRSystem/devicechange_event", "devicechange")}} sẽ không được kích hoạt trên đối tượng {{DOMxRef("Navigator.xr","navigator.xr")}}.

## Cú pháp

```http
Permissions-Policy: xr-spatial-tracking=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `xr-spatial-tracking` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- {{DOMxRef("XRSystem/requestSession","navigator.xr.requestSession()")}}, {{DOMxRef("XRSystem/isSessionSupported","navigator.xr.isSessionSupported()")}} và sự kiện {{domxref("XRSystem/devicechange_event", "devicechange")}} trên {{DOMxRef("Navigator.xr","navigator.xr")}}
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
