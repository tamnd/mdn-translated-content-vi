---
title: "PublicKeyCredential: phương thức tĩnh signalCurrentUserDetails()"
short-title: signalCurrentUserDetails()
slug: Web/API/PublicKeyCredential/signalCurrentUserDetails_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.signalCurrentUserDetails_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`signalCurrentUserDetails()`** của giao diện {{domxref("PublicKeyCredential")}} báo hiệu cho thiết bị xác thực rằng một người dùng cụ thể đã cập nhật tên người dùng và/hoặc tên hiển thị của họ trên máy chủ [relying party](https://en.wikipedia.org/wiki/Relying_party) (RP).

Điều này cho phép thiết bị xác thực cập nhật chi tiết tài kho��n người dùng, để đảm bảo chúng đồng bộ với những chi tiết mà RP giữ. Phương thức này chỉ nên được sử dụng khi người dùng hiện tại đã được xác th��c, sau khi đăng nhập, hoặc khi họ thay đổi metadata liên quan đến thông tin xác thực của họ trên ứng dụng web RP.

## Cú pháp

```js-nolint
signalCurrentUserDetails(options)
```

### Tham số

- `options`
  - : Một đối tượng biểu diễn thông tin người dùng đã cập nhật, chứa các thuộc tính sau:
    - `displayName`
      - : Một chuỗi biểu diễn [`displayName`](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#displayname) người dùng đã cập nhật.
    - `name`
      - : Một chuỗi biểu diễn [`name`](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#name_2) người dùng đã cập nhật.
    - `rpId`
      - : Một chuỗi biểu diễn [`id` của RP](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#id_2) đã gửi tín hiệu.
    - `userId`
      - : Một chuỗi được mã hóa base64url biểu diễn [`id` của người dùng](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#id_3) mà thông tin xác thực liên quan đến.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành {{jsxref("undefined")}}.

### Ngoại lệ

Promise bị từ chối với các ngoại lệ sau:

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.
- `TypeError` {{domxref("DOMException")}}
  - : `credentialId` không phải là chuỗi được mã hóa base64url hợp lệ.

## Mô tả

Có thể thông tin được lưu trữ trong thiết bị xác thực của người dùng về [thông tin xác thực có thể phát hiện](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials) (ví dụ, [passkey](/en-US/docs/Web/Security/Authentication/Passkeys)) bị mất đồng bộ với máy chủ. Điều này có thể xảy ra khi người dùng cập nhật tên người dùng hoặc tên hiển thị của họ trên ứng dụng web RP mà không cập nhật thiết bị xác thực.

Lần tiếp theo họ cố đăng nhập bằng thông tin xác thực có thể phát hiện, thông tin xác thực vẫn sẽ được hiển thị cho họ với tên người dùng/tên hiển thị cũ trong UI liên quan, điều này có thể dẫn đến trải nghiệm người dùng khó hiểu.

Để tránh vấn đề này, `signalCurrentUserDetails()` nên được gọi trên ứng dụng web RP mỗi khi người dùng cập nhật chi tiết tài khoản của họ hoặc đăng nhập, để thông báo cho thiết bị xác thực rằng thông tin người dùng đã được cập nhật. Tùy thiết bị xác thực cách xử lý thông tin này, nhưng kỳ vọng là nó sẽ đồng bộ hóa thông tin người dùng của mình với bản cập nhật được cung cấp.

## Ví dụ

### Báo hiệu chi tiết người dùng hiện tại

Trong ví dụ này, chúng ta gọi phương thức `signalCurrentUserDetail()`, truyền vào chi tiết của một thông tin xác thực mà người dùng vừa chỉnh sửa trên RP. Kết quả là, thiết bị xác thực nên cập nhật bản sao thông tin xác thực của mình để giữ nó đồng bộ với RP.

```js
if (PublicKeyCredential.signalCurrentUserDetails) {
  await PublicKeyCredential.signalCurrentUserDetails({
    rpId: "example.com",
    userId: "M2YPl-KGnA8", // base64url-encoded user ID
    name: "a.new.email.address@example.com", // username
    displayName: "Maria Sanchez",
  });
} else {
  // Encourage the user to update their details in the authenticator
}
```

Để biết thêm ví dụ code, xem [Keep passkeys consistent with credentials on your server with the Signal API](https://developer.chrome.com/docs/identity/webauthn-signal-api) trên developer.chrome.com (2024).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PublicKeyCredential.signalAllAcceptedCredentials_static", "PublicKeyCredential.signalAllAcceptedCredentials()")}}
- {{domxref("PublicKeyCredential.signalUnknownCredential_static", "PublicKeyCredential.signalUnknownCredential()")}}
- [Keep passkeys consistent with credentials on your server with the Signal API](https://developer.chrome.com/docs/identity/webauthn-signal-api) trên developer.chrome.com (2024)
