---
title: Chứng thực và xác nhận trong WebAuthn
slug: Web/API/Web_Authentication_API/Attestation_and_Assertion
page-type: guide
---

{{DefaultAPISidebar("Web Authentication API")}}{{securecontext_header}}

Trang này mô tả hai phản hồi mà [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) trả về: phản hồi chứng thực (attestation) trong quá trình đăng ký và phản hồi xác nhận (assertion) trong quá trình xác thực.

## Chứng thực (Attestation)

Chứng thực xảy ra trong quá trình **đăng ký**. Khi người dùng đăng ký tài khoản, thiết bị xác thực tạo ra cặp khóa mới và gửi **phản hồi chứng thực** cho trang web.

Phản hồi chứng thực cho phép trang web xác minh rằng:

- Thông tin xác thực đã được tạo bởi thiết bị xác thực thực sự (ví dụ như token bảo mật phần cứng cụ thể).
- Thông tin xác thực không bị giả mạo.

### Cấu trúc phản hồi chứng thực

Khi `navigator.credentials.create()` hoàn thành, nó trả về `PublicKeyCredential` với thuộc tính `response` là đối tượng {{domxref("AuthenticatorAttestationResponse")}}:

```js
const credential = await navigator.credentials.create({
  publicKey: creationOptions,
});

const response = credential.response; // AuthenticatorAttestationResponse

// Dữ liệu thiết bị xác thực
const authenticatorData = response.getAuthenticatorData();

// Dữ liệu khách hàng (thách thức, gốc, loại)
const clientDataJSON = response.clientDataJSON;

// Đối tượng chứng thực
const attestationObject = response.attestationObject;

// Khóa công khai dưới dạng SubjectPublicKeyInfo
const publicKey = response.getPublicKey();
```

## Xác nhận (Assertion)

Xác nhận xảy ra trong quá trình **xác thực**. Khi người dùng đăng nhập, thiết bị xác thực ký thách thức với khóa riêng tư của thông tin xác thực được yêu cầu và gửi **phản hồi xác nhận** cho trang web.

Phản hồi xác nhận cho phép trang web xác minh rằng:

- Người dùng có quyền kiểm soát thông tin xác thực (khóa riêng tư).
- Thông tin xác thực được liên kết với tài khoản.

### Cấu trúc phản hồi xác nhận

Khi `navigator.credentials.get()` hoàn thành, nó trả về `PublicKeyCredential` với thuộc tính `response` là đối tượng {{domxref("AuthenticatorAssertionResponse")}}:

```js
const assertion = await navigator.credentials.get({
  publicKey: requestOptions,
});

const response = assertion.response; // AuthenticatorAssertionResponse

// Dữ liệu thiết bị xác thực
const authenticatorData = response.authenticatorData;

// Dữ liệu khách hàng
const clientDataJSON = response.clientDataJSON;

// Chữ ký - được ký bằng khóa riêng tư
const signature = response.signature;

// Handle người dùng (nếu được yêu cầu)
const userHandle = response.userHandle;
```

## So sánh chứng thực và xác nhận

|                 | Chứng thực                         | Xác nhận                         |
| --------------- | ---------------------------------- | -------------------------------- |
| Khi xảy ra      | Đăng ký                            | Xác thực                         |
| Phương thức API | `credentials.create()`             | `credentials.get()`              |
| Loại phản hồi   | `AuthenticatorAttestationResponse` | `AuthenticatorAssertionResponse` |
| Mục đích        | Tạo thông tin xác thực mới         | Xác minh quyền sở hữu            |

## Xác minh phía máy chủ

### Xác minh chứng thực

Máy chủ cần xác minh phản hồi chứng thực bằng cách:

1. Phân tích đối tượng chứng thực.
2. Xác minh dữ liệu JSON của khách hàng.
3. Kiểm tra thách thức và gốc.
4. Xác minh dữ liệu thiết bị xác thực.
5. Xác minh chữ ký chứng thực (nếu không phải "none").
6. Lưu trữ khóa công khai và ID thông tin xác thực.

### Xác minh xác nhận

Máy chủ cần xác minh phản hồi xác nhận bằng cách:

1. Tìm thông tin xác thực bằng ID đã cung cấp.
2. Xác minh dữ liệu JSON của khách hàng.
3. Xác minh dữ liệu thiết bị xác thực.
4. Xác minh chữ ký bằng khóa công khai đã lưu.
5. Kiểm tra signCount để phát hiện thiết bị bị sao chép.

## Xem thêm

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- {{domxref("AuthenticatorAttestationResponse")}}
- {{domxref("AuthenticatorAssertionResponse")}}
