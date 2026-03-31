---
title: "Permissions-Policy: chỉ thị ch-ua-high-entropy-values"
short-title: ch-ua-high-entropy-values
slug: Web/HTTP/Reference/Headers/Permissions-Policy/ch-ua-high-entropy-values
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.ch-ua-high-entropy-values
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `ch-ua-high-entropy-values` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu có được phép sử dụng phương thức {{domxref("NavigatorUAData.getHighEntropyValues()")}} để truy xuất dữ liệu user-agent entropy cao hay không.

Nếu quyền không được cho phép, phương thức sẽ chỉ trả về dữ liệu entropy thấp là `brands`, `mobile`, và `platform`.

## Cú pháp

```http
Permissions-Policy: ch-ua-high-entropy-values=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `ch-ua-high-entropy-values` là `*`.

## Ví dụ

### Giới hạn dữ liệu entropy cao cho các nguồn gốc cụ thể

Chính sách sau sẽ chỉ cho phép nguồn gốc hiện tại và hai nguồn gốc cụ thể khác truy xuất dữ liệu entropy cao.

```http
Permissions-Policy: ch-ua-high-entropy-values=("self https://a.example.com" "https://b.example.com")
```

Sau đó bạn có thể nhúng một trong hai nguồn gốc kia:

```html
<iframe src="https://a.example.com" allow="ch-ua-high-entropy-values"></iframe>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
