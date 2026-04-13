---
title: "PublicKeyCredential: phương thức tĩnh isUserVerifyingPlatformAuthenticatorAvailable()"
short-title: isUserVerifyingPlatformAuthenticatorAvailable()
slug: Web/API/PublicKeyCredential/isUserVerifyingPlatformAuthenticatorAvailable_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`isUserVerifyingPlatformAuthenticatorAvailable()`** của giao diện {{domxref("PublicKeyCredential")}} trả về một {{jsxref("Promise")}} được giải quyết thành `true` nếu có thiết bị xác thực nền tảng xác minh người dùng.

Thiết bị xác thực nền tảng xác minh người dùng là một loại {{glossary("multi-factor authentication", "thiết bị xác thực đa yếu tố")}} là một phần của thiết bị client (thường không thể tháo rời) và yêu cầu hành động từ người dùng để nhận dạng họ. Các thiết bị xác thực nền tảng xác minh người dùng phổ biến bao gồm:

- Touch ID hoặc Face ID (macOS và iOS)
- Windows Hello (Windows)
- Mở khóa thiết bị (vân tay, khuôn mặt, mã PIN, v.v.) trên Android

> [!NOTE]
> Phương thức này chỉ có thể được sử dụng trong ngữ cảnh cấp cao nhất và sẽ không có sẵn trong một {{HTMLElement("iframe")}} chẳng hạn.

## Cú pháp

```js-nolint
PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành giá trị boolean cho biết có hay không có thiết bị xác thực nền tảng xác minh người dùng.

> [!NOTE]
> Trong các phiên bản đầu của đặc tả, boolean cũng truyền đạt sự đồng ý của người dùng để tiết lộ rằng thiết bị xác thực như vậy tồn tại.

### Ngoại lệ

{{jsxref("Promise")}} được trả về có thể bị từ chối với các giá trị sau:

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.

## Ví dụ

```js
PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()
  .then((available) => {
    if (available) {
      // We can proceed with the creation of a PublicKeyCredential
      // with this authenticator
    } else {
      // Use another kind of authenticator or a classical login/password
      // workflow
    }
  })
  .catch((err) => {
    // Something went wrong
    console.error(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Windows Hello](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/windows-hello)
- [Web Authentication and Windows Hello - MSDN Guide](https://learn.microsoft.com/en-us/archive/microsoft-edge/legacy/developer/) và đặc biệt là [special considerations mentioning `isUserVerifyingPlatformAuthenticator()`](https://learn.microsoft.com/en-us/archive/microsoft-edge/legacy/developer/#special-considerations-for-windows-hello)
