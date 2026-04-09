---
title: "AuthenticatorAttestationResponse: phương thức getTransports()"
short-title: getTransports()
slug: Web/API/AuthenticatorAttestationResponse/getTransports
page-type: web-api-instance-method
browser-compat: api.AuthenticatorAttestationResponse.getTransports
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức **`getTransports()`** của giao diện {{domxref("AuthenticatorAttestationResponse")}} trả về một mảng chuỗi mô tả các phương thức truyền tải khác nhau có thể được authenticator sử dụng.

Các phương thức truyền tải như vậy có thể là USB, NFC, BLE, internal (áp dụng khi authenticator không thể tháo rời khỏi thiết bị), hoặc một cách tiếp cận hybrid. Các trang web không nên diễn giải mảng này mà thay vào đó nên lưu nó cùng với phần còn lại của thông tin thông tin xác thực. Trong lệnh gọi {{domxref("CredentialsContainer.get()", "navigator.credentials.get()")}} tiếp theo, (các) giá trị `transports` được chỉ định bên trong `publicKey.allowCredentials` nên được đặt thành giá trị mảng đã lưu. Điều này cung cấp một gợi ý cho trình duyệt về những loại authenticator nào nên được thử khi thực hiện một phép xác nhận cho thông tin xác thực này.

## Cú pháp

```js-nolint
getTransports()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} các chuỗi biểu thị các phương thức truyền tải khác nhau được authenticator hỗ trợ, theo thứ tự từ điển.
Các giá trị có thể bao gồm:

- `"ble"`
  - : Authenticator có thể được dùng qua [BLE (Bluetooth Low Energy)](https://en.wikipedia.org/wiki/Bluetooth_Low_Energy).
- `"hybrid"`
  - : Authenticator có thể được dùng qua sự kết hợp của các cơ chế truyền dữ liệu và cơ chế lân cận (thường tách biệt). Ví dụ, điều này hỗ trợ xác thực trên máy tính để bàn bằng điện thoại thông minh.
- `"internal"`
  - : Authenticator được gắn riêng với thiết bị khách (không thể tháo rời).
- `"nfc"`
  - : Authenticator có thể được dùng qua [NFC (Near Field Communication)](https://en.wikipedia.org/wiki/Near-field_communication).
- `"usb"`
  - : Có thể liên hệ với authenticator qua USB.

## Ví dụ

Xem [Creating a public key credential](/en-US/docs/Web/API/CredentialsContainer/create#creating_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
