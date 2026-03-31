---
title: "Permissions-Policy: chỉ thị publickey-credentials-create"
short-title: publickey-credentials-create
slug: Web/HTTP/Reference/Headers/Permissions-Policy/publickey-credentials-create
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.publickey-credentials-create
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `publickey-credentials-create` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) để tạo thông tin xác thực WebAuthn mới, tức là thông qua {{domxref("CredentialsContainer.create","navigator.credentials.create({publicKey})")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, {{jsxref("Promise")}} được trả về bởi `navigator.credentials.create({publicKey})` sẽ bị từ chối với `NotAllowedError` {{domxref("DOMException")}}.
Nếu phương thức được gọi cross-origin, {{jsxref("Promise")}} cũng sẽ bị từ chối với `NotAllowedError` nếu tính năng được cấp bởi [`allow=` trên một iframe](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#iframes) và frame đó không có {{glossary("Transient activation")}}.

## Cú pháp

```http
Permissions-Policy: publickey-credentials-create=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `publickey-credentials-create` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- Giao diện {{DOMxRef("PublicKeyCredential")}}
