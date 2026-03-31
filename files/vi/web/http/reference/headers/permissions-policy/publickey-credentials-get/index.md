---
title: "Permissions-Policy: chỉ thị publickey-credentials-get"
short-title: publickey-credentials-get
slug: Web/HTTP/Reference/Headers/Permissions-Policy/publickey-credentials-get
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.publickey-credentials-get
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `publickey-credentials-get` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép truy cập [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) để truy xuất thông tin xác thực khóa công khai, tức là thông qua {{domxref("CredentialsContainer.get","navigator.credentials.get({publicKey})")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, {{jsxref("Promise")}} được trả về bởi `navigator.credentials.get({publicKey})` sẽ bị từ chối với `NotAllowedError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: publickey-credentials-get=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `publickey-credentials-get` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- Giao diện {{DOMxRef("PublicKeyCredential")}}
