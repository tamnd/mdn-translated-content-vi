---
title: "Permissions-Policy: chỉ thị payment"
short-title: payment
slug: Web/HTTP/Reference/Headers/Permissions-Policy/payment
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.payment
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `payment` của trường header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các lần gọi constructor {{DOMxRef("PaymentRequest.PaymentRequest", "PaymentRequest()")}} sẽ ném một {{domxref("DOMException")}} kiểu `SecurityError`.

## Cú pháp

```http
Permissions-Policy: payment=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `payment` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Trường header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
