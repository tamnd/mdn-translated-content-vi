---
title: "AuthenticatorAssertionResponse: thuộc tính authenticatorData"
short-title: authenticatorData
slug: Web/API/AuthenticatorAssertionResponse/authenticatorData
page-type: web-api-instance-property
browser-compat: api.AuthenticatorAssertionResponse.authenticatorData
---

{{securecontext_header}}{{APIRef("Web Authentication API")}}

Thuộc tính **`authenticatorData`** của giao diện {{domxref("AuthenticatorAssertionResponse")}} trả về một {{jsxref("ArrayBuffer")}} chứa thông tin từ authenticator, chẳng hạn như mã băm Relying Party ID (rpIdHash), bộ đếm chữ ký, kết quả kiểm tra sự hiện diện của người dùng, các cờ xác minh người dùng, và mọi tiện ích mở rộng mà authenticator đã xử lý.

## Giá trị

Một {{jsxref("ArrayBuffer")}} có {{jsxref("ArrayBuffer.byteLength", "byteLength")}} ít nhất 37 byte, chứa cấu trúc dữ liệu được giải thích trong [Dữ liệu authenticator](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data).

## Ví dụ

Xem [Truy xuất thông tin xác thực khóa công khai](/en-US/docs/Web/API/CredentialsContainer/get#retrieving_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
