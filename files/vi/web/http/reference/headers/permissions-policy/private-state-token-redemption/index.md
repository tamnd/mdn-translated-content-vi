---
title: "Permissions-Policy: chỉ thị private-state-token-redemption"
short-title: private-state-token-redemption
slug: Web/HTTP/Reference/Headers/Permissions-Policy/private-state-token-redemption
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.private-state-token-redemption
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `private-state-token-redemption` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc sử dụng các thao tác `token-redemption` và `send-redemption-record` của [private state token](/en-US/docs/Web/API/Private_State_Token_API).

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các thao tác [đổi token](/en-US/docs/Web/API/Private_State_Token_API/Using#redeeming_a_token_via_your_server) và [gửi bản ghi đổi](/en-US/docs/Web/API/Private_State_Token_API/Using#redemption_record_usage_2) sẽ thất bại.

## Cú pháp

```http
Permissions-Policy: private-state-token-redemption=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `private-state-token-redemption` là `*`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
