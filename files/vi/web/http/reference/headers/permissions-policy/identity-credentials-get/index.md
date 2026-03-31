---
title: "Permissions-Policy: chỉ thị identity-credentials-get"
short-title: identity-credentials-get
slug: Web/HTTP/Reference/Headers/Permissions-Policy/identity-credentials-get
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.identity-credentials-get
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `identity-credentials-get` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Federated Credential Management API (FedCM)](/en-US/docs/Web/API/FedCM_API), và cụ thể hơn là việc sử dụng các phương thức sau:

- {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} (khi sử dụng với tùy chọn `identity`)
- {{domxref("IdentityCredential.disconnect_static", "IdentityCredential.disconnect()")}}
- {{domxref("IdentityProvider.getUserInfo_static", "IdentityProvider.getUserInfo()")}}

Khi chính sách này cấm việc sử dụng API, các {{jsxref("Promise")}} được trả về bởi các phương thức này sẽ bị từ chối với `NotAllowedError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: identity-credentials-get=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `identity-credentials-get` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API (FedCM)](/en-US/docs/Web/API/FedCM_API)
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
