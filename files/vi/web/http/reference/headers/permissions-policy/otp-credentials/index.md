---
title: "Permissions-Policy: chỉ thị otp-credentials"
short-title: otp-credentials
slug: Web/HTTP/Reference/Headers/Permissions-Policy/otp-credentials
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.otp-credentials
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị `otp-credentials` của header HTTP {{HTTPHeader("Permissions-Policy")}} kiểm soát việc tài liệu hiện tại có được phép sử dụng [WebOTP API](/en-US/docs/Web/API/WebOTP_API) để yêu cầu mật khẩu dùng một lần (OTP) từ tin nhắn SMS có định dạng đặc biệt được gửi bởi máy chủ của ứng dụng, tức là thông qua {{domxref("CredentialsContainer.get", "navigator.credentials.get({otp: ..., ...})")}} hay không.

Cụ thể, khi một chính sách đã được xác định chặn việc sử dụng tính năng này, {{jsxref("Promise")}} được trả về bởi `navigator.credentials.get({otp})` sẽ bị từ chối với `SecurityError` {{domxref("DOMException")}}.

## Cú pháp

```http
Permissions-Policy: otp-credentials=<allowlist>;
```

- `<allowlist>`
  - : Danh sách các nguồn gốc được cấp quyền sử dụng tính năng. Xem [`Permissions-Policy` > Cú pháp](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#syntax) để biết thêm chi tiết.

## Chính sách mặc định

Danh sách cho phép mặc định cho `otp-credentials` là `self`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- [WebOTP API](/en-US/docs/Web/API/WebOTP_API)
- Giao diện {{DOMxRef("OTPCredential")}}
