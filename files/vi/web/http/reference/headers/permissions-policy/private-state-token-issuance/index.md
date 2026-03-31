---
title: "Permissions-Policy: chỉ thị private-state-token-issuance"
short-title: private-state-token-issuance
slug: Web/HTTP/Reference/Headers/Permissions-Policy/private-state-token-issuance
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.private-state-token-issuance
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `private-state-token-issuance` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc sử dụng các thao tác `token-request` của [private state token](/en-US/docs/Web/API/Private_State_Token_API).

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, các thao tác [yêu cầu token](/en-US/docs/Web/API/Private_State_Token_API/Using#issuing_a_token_via_your_server) sẽ thất bại.

## Cú pháp

```http
Permissions-Policy: private-state-token-issuance=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các [nguồn gốc](/en-US/docs/Glossary/Origin) được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `private-state-token-issuance` là `*`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
