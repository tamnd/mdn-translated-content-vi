---
title: "Permissions-Policy: chỉ thị compute-pressure"
short-title: compute-pressure
slug: Web/HTTP/Reference/Headers/Permissions-Policy/compute-pressure
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.compute-pressure
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `compute-pressure` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát quyền truy cập vào [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API).

## Cú pháp

```http
Permissions-Policy: compute-pressure=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `compute-pressure` là `self`, cho phép sử dụng trong các frame lồng nhau cùng nguồn gốc nhưng ngăn nội dung bên thứ ba sử dụng tính năng này. Các worker (dedicated và shared) tuân thủ chính sách quyền được đặt bởi tài liệu sở hữu chúng.

## Ví dụ

### Bật compute pressure cho nội dung bên thứ ba

Việc sử dụng bên thứ ba có thể được bật có chọn lọc bằng cách sử dụng thuộc tính `allow` trên các phần tử {{HTMLElement("iframe")}}:

```html
<iframe src="https://example.com" allow="compute-pressure"></iframe>
```

### Tắt hoàn toàn Compute Pressure API

Header phản hồi HTTP này tắt hoàn toàn compute pressure:

```http
Permissions-Policy: compute-pressure=()
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API)
