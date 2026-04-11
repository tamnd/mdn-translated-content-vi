---
title: "PublicKeyCredential: phương thức tĩnh signalUnknownCredential()"
short-title: signalUnknownCredential()
slug: Web/API/PublicKeyCredential/signalUnknownCredential_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.signalUnknownCredential_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`signalUnknownCredential()`** của giao diện {{domxref("PublicKeyCredential")}} báo hiệu cho thiết bị xác thực rằng một [ID thông tin xác thực](/en-US/docs/Web/API/PublicKeyCredentialRequestOptions#id) không được máy chủ [relying party](https://en.wikipedia.org/wiki/Relying_party) (RP) nhận ra.

Điều này cho phép thiết bị xác thực xóa các thông tin xác thực không được RP cho phép, chẳng hạn như những thông tin xác thực của tài khoản đã bị xóa, hoặc các tài kho��n được tạo và lưu trữ trên thiết bị xác thực nhưng không đ��ợc cập nhật đúng cách trên máy chủ. Nhìn chung, phương thức này được gọi sau khi đăng nhập thất bại vì chi tiết tài khoản không có sẵn cho RP. Nó có thể được sử dụng ngay cả khi người dùng hiện tại chưa được xác thực vì nó không tiết lộ thông tin nhạy cảm.

## Cú pháp

```js-nolint
signalUnknownCredential(options)
```

### Tham số

- `options`
  - : Một đối tượng biểu diễn thông tin xác thực kh��ng được nhận ra, chứa các thuộc tính sau:
    - `credentialId`
      - : Một chuỗi được mã hóa base64url biểu diễn [`id` của thông tin xác thực](/en-US/docs/Web/API/PublicKeyCredentialRequestOptions#id) không được nhận ra.
    - `rpId`
      - : Một chuỗi biểu diễn [`id` của RP](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#id_2) đã gửi tín hiệu.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành {{jsxref("undefined")}}.

### Ngoại lệ

Promise bị từ chối với các ngoại lệ sau:

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.
- `TypeError` {{domxref("DOMException")}}
  - : `credentialId` không phải là chuỗi được mã hóa base64url hợp lệ.

## Mô tả

Có thể thông tin được lưu trữ trong thiết bị xác thực của người dùng về [thông tin xác thực có thể phát hiện](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials) (ví dụ, [passkey](/en-US/docs/Web/Security/Authentication/Passkeys)) bị mất đồng bộ với máy chủ. Điều này thường xảy ra khi người dùng xóa thông tin xác thực từ ứng dụng web RP mà không cập nhật thiết bị xác thực.

Khi người dùng cố gắng đăng nhập bằng thông tin xác thực có thể phát hiện, họ được hiển thị m��t tập hợp thông tin xác thực từ thiết bị xác thực để lựa chọn, và thông tin xác thực được chọn được trả về cho ứng dụng web RP để đăng nhập. Nếu người dùng chọn một thông tin xác thực đã bị xóa khỏi máy chủ RP, nó sẽ không được nhận ra, và đăng nhập sẽ thất bại. Đây là trải nghiệm khó hiểu với người dùng, những người kỳ vọng chỉ được cung cấp các thông tin xác thực có thể thành công.

Để giảm thiểu vấn đề này, `signalUnknownCredential()` nên được gọi trên ứng dụng web RP mỗi khi đăng nhập dựa trên thông tin xác thực có thể phát hiện thất bại, để thông báo cho thiết bị xác thực rằng ID thông tin xác thực không được nhận ra.

Tùy thiết bị xác thực cách xử lý thông tin này, nhưng kỳ vọng là nó sẽ xóa thông tin xác thực liên quan để không có sự không khớp trong dữ liệu được lưu trữ trên thiết bị xác thực và relying party.

Ngoài ra, `signalUnknownCredential()` cũng có thể được gọi nếu ứng dụng web có thể tạo thông tin xác thực có thể phát hiện trên thiết bị xác thực nhưng vì lý do nào đó không thể tải lên thông tin xác thực lên máy chủ.

`signalUnknownCredential()` có thể được gọi ngay cả khi người dùng hiện tại chưa được xác thực vì nó không tiết lộ thông tin nhạy cảm.

## Ví dụ

### Báo hiệu thông tin xác thực không xác định

Trong ví dụ này, một lần thử đăng nhập đư���c thực hiện bằng thông tin xác thực có thể phát hiện thông qua cuộc gọi [`get()`](/en-US/docs/Web/API/CredentialsContainer/get). Thông tin xác thực được trả về thành công, và ID thông tin xác thực và payload được lưu trữ trong các hằng số.

Payload được gửi đến máy chủ RP thông qua yêu cầu [`fetch()`](/en-US/docs/Web/API/Window/fetch) để đăng nhập người dùng, nhưng yêu cầu thất bại với phản hồi {{httpstatus("404")}} vì RP không nhận ra người dùng đó (ví dụ vì thông tin xác thực đó đã bị xóa trước đó khỏi RP).

Kết quả là, chúng ta gọi phương thức `signalUnknownCredential()`, truyền vào `rpId` và ID thông tin xác thực, để thông báo cho thiết bị xác thực rằng thông tin xác thực không được biết đến với RP. Thiết bị xác thực sau đó nên xóa thông tin xác thực để nó không gây ra vấn đề tương tự nữa.

```js
const credential = await navigator.credentials.get({
  challenge: new Uint8Array([139, 66, 181, 87, 7, 203 /* … */]),
  rpId: "example.com",
  allowCredentials: [],
  // Empty allowCredentials list means only discoverable
  // credentials are presented to the user
});

// Retrieve base64url-encoded credential ID,
// such as "vI0qOggiE3OT01ZRWBYz5l4MEgU0c7PmAA"
const credID = credential.id;
// Retrieve payload to send to the RP server
const payload = credential.toJSON();

const result = await fetch("/login", {
  // fetch() options, will include the payload in the request body
});

// Detect authentication failure due to lack of the credential
if (result.status === 404) {
  if (PublicKeyCredential.signalUnknownCredential) {
    await PublicKeyCredential.signalUnknownCredential({
      rpId: "example.com",
      credentialId: credID,
    });
  } else {
    // Encourage the user to delete the credential from the authenticator
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PublicKeyCredential.signalAllAcceptedCredentials_static", "PublicKeyCredential.signalAllAcceptedCredentials()")}}
- {{domxref("PublicKeyCredential.signalCurrentUserDetails_static", "PublicKeyCredential.signalCurrentUserDetails()")}}
- [Keep passkeys consistent with credentials on your server with the Signal API](https://developer.chrome.com/docs/identity/webauthn-signal-api) trên developer.chrome.com (2024)
