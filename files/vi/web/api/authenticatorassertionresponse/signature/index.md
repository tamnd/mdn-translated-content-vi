---
title: "AuthenticatorAssertionResponse: thuộc tính signature"
short-title: signature
slug: Web/API/AuthenticatorAssertionResponse/signature
page-type: web-api-instance-property
browser-compat: api.AuthenticatorAssertionResponse.signature
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`signature`** của giao diện
{{domxref("AuthenticatorAssertionResponse")}} là một đối tượng {{jsxref("ArrayBuffer")}}
đại diện cho chữ ký của authenticator trên cả
{{domxref("AuthenticatorAssertionResponse.authenticatorData")}} và mã băm SHA-256 của
dữ liệu phía máy khách
({{domxref("AuthenticatorResponse.clientDataJSON","AuthenticatorAssertionResponse.clientDataJSON")}}).

Chữ ký này sẽ được gửi tới máy chủ để kiểm tra, như một phần của phản hồi. Nó
cung cấp bằng chứng rằng một authenticator thực sự sở hữu khóa riêng đã được dùng
để tạo thông tin xác thực.

## Giá trị

Một đối tượng {{jsxref("ArrayBuffer")}} là chữ ký của authenticator (dùng khóa
riêng của nó) trên cả {{domxref("AuthenticatorAssertionResponse.authenticatorData")}}
và mã băm SHA-256 do máy khách cung cấp cho dữ liệu của nó (thử thách, nguồn gốc,
v.v. và có thể lấy từ
{{domxref("AuthenticatorResponse.clientDataJSON","AuthenticatorAssertionResponse.clientDataJSON")}}).

## Ví dụ

Xem [Truy xuất thông tin xác thực khóa công khai](/en-US/docs/Web/API/CredentialsContainer/get#retrieving_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
