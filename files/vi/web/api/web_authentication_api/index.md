---
title: Web Authentication API
slug: Web/API/Web_Authentication_API
page-type: web-api-overview
browser-compat: api.CredentialsContainer.create
spec-urls: https://w3c.github.io/webauthn/
---

{{DefaultAPISidebar("Web Authentication API")}}{{securecontext_header}}

Web Authentication API (WebAuthn) là một phần mở rộng của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API) cho phép xác thực mạnh mẽ với mật mã khóa công khai, không cần mật khẩu.

WebAuthn cho phép máy chủ đăng ký và xác thực người dùng bằng mật mã khóa công khai thay vì mật khẩu. Điều này giúp giải quyết nhiều vấn đề bảo mật liên quan đến mật khẩu như rò rỉ dữ liệu, tấn công phishing và tấn công replay.

## Khái niệm và cách sử dụng

WebAuthn sử dụng mật mã bất đối xứng (khóa công khai/khóa riêng tư) để tạo và xác thực thông tin xác thực, và giảm thiểu các mối đe dọa bảo mật như lừa đảo và rò rỉ dữ liệu.

### Đăng ký (Registration)

Khi người dùng đăng ký bằng WebAuthn:

1. Máy chủ tạo một thách thức ngẫu nhiên.
2. Thiết bị của người dùng (thiết bị xác thực) tạo một cặp khóa mới.
3. Khóa riêng tư được lưu trữ an toàn trên thiết bị.
4. Khóa công khai được gửi đến máy chủ cùng với metadata.

### Xác thực (Authentication)

Khi người dùng đăng nhập:

1. Máy chủ gửi thách thức.
2. Thiết bị ký thách thức bằng khóa riêng tư.
3. Máy chủ xác minh chữ ký bằng khóa công khai đã lưu.

## Phương thức

WebAuthn bổ sung các phương thức sau vào {{domxref("CredentialsContainer")}}:

### `create()` với PublicKeyCredentialCreationOptions

Đăng ký thông tin xác thực mới:

```js
const credential = await navigator.credentials.create({
  publicKey: {
    challenge: new Uint8Array([
      /* thách thức ngẫu nhiên từ máy chủ */
    ]),
    rp: {
      name: "Example Corp",
      id: "example.com",
    },
    user: {
      id: new Uint8Array([
        /* ID người dùng */
      ]),
      name: "user@example.com",
      displayName: "User Name",
    },
    pubKeyCredParams: [
      { alg: -7, type: "public-key" }, // ES256
      { alg: -257, type: "public-key" }, // RS256
    ],
    timeout: 60000,
    attestation: "none",
  },
});
```

### `get()` với PublicKeyCredentialRequestOptions

Xác thực bằng thông tin xác thực hiện có:

```js
const assertion = await navigator.credentials.get({
  publicKey: {
    challenge: new Uint8Array([
      /* thách thức ngẫu nhiên từ máy chủ */
    ]),
    rpId: "example.com",
    allowCredentials: [
      {
        id: credentialId, // ID thông tin xác thực đã đăng ký
        type: "public-key",
        transports: ["usb", "ble", "nfc", "internal"],
      },
    ],
    timeout: 60000,
  },
});
```

## Giao diện

- {{domxref("PublicKeyCredential")}}
  - : Đại diện cho thông tin xác thực, là cặp khóa công khai/khóa riêng tư được tạo khi người dùng đăng ký trên WebAuthn-enabled service.
- {{domxref("AuthenticatorResponse")}}
  - : Lớp cơ sở cho các phản hồi thiết bị xác thực.
- {{domxref("AuthenticatorAttestationResponse")}}
  - : Phản hồi từ thiết bị xác thực khi tạo thông tin xác thực mới.
- {{domxref("AuthenticatorAssertionResponse")}}
  - : Phản hồi từ thiết bị xác thực khi xác thực.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Authentication: An API for accessing Public Key Credentials](https://w3c.github.io/webauthn/) (đặc tả W3C)
- [WebAuthn Guide](https://webauthn.guide/)
