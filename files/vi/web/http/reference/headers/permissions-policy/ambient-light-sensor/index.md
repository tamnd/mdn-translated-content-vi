---
title: "Permissions-Policy: chỉ thị ambient-light-sensor"
short-title: ambient-light-sensor
slug: Web/HTTP/Reference/Headers/Permissions-Policy/ambient-light-sensor
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.ambient-light-sensor
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `ambient-light-sensor` của header HTTP {{HTTPHeader('Permissions-Policy')}} kiểm soát việc tài liệu hiện tại có được phép thu thập thông tin về lượng ánh sáng trong môi trường xung quanh thiết bị thông qua giao diện {{domxref('AmbientLightSensor')}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi constructor {{domxref("AmbientLightSensor.AmbientLightSensor", "AmbientLightSensor()")}} sẽ ném một {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: ambient-light-sensor=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `ambient-light-sensor` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader('Permissions-Policy')}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
