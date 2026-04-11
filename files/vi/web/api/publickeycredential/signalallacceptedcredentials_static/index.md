---
title: "PublicKeyCredential: phương thức tĩnh signalAllAcceptedCredentials()"
short-title: signalAllAcceptedCredentials()
slug: Web/API/PublicKeyCredential/signalAllAcceptedCredentials_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.signalAllAcceptedCredentials_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`signalAllAcceptedCredentials()`** của giao diện {{domxref("PublicKeyCredential")}} báo hiệu cho thiết bị xác thực tất cả các [ID thông tin xác thực](/en-US/docs/Web/API/PublicKeyCredentialRequestOptions#id) hợp lệ mà máy chủ [relying party](https://en.wikipedia.org/wiki/Relying_party) (RP) vẫn giữ cho một người dùng cụ thể.

Điều này cho phép thiết bị xác thực cập nhật thông tin thông tin xác thực, xóa tất cả thông tin xác thực không còn được RP nhận ra, chẳng hạn như những thông tin xác thực của tài khoản đã bị xóa. Phương thức này nên được gọi mỗi khi người dùng xác thực với RP.

`signalAllAcceptedCredentials()` chỉ _nên_ được gọi khi người dùng hiện tại đã được xác thực, sau khi đăng ký hoặc đăng nhập, hoặc khi người dùng xóa thông tin xác thực, vì nó tiết lộ thông tin nhạy cảm thuộc về người dùng.

## Cú pháp

```js-nolint
signalAllAcceptedCredentials(options)
```

### Tham số

- `options`
  - : Một đối tượng biểu diễn các thông tin xác thực hợp lệ, chứa các thuộc tính sau:
    - `allAcceptedCredentialIds`
      - : Một mảng các chuỗi được mã hóa base64url biểu diễn các [`id` của thông tin xác thực](/en-US/docs/Web/API/PublicKeyCredentialRequestOptions#id) vẫn còn hợp lệ.
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
  - : `userId` hoặc bất kỳ phần tử nào của `allAcceptedCredentialIds` không phải l�� chuỗi được mã hóa base64url hợp lệ.

## Mô tả

Có thể thông tin được lưu trữ trong thiết bị xác thực của người dùng về [thông tin xác thực có thể phát hiện](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials) (ví dụ, [passkey](/en-US/docs/Web/Security/Authentication/Passkeys)) bị mất đồng bộ với máy chủ. Điều này thường xảy ra khi người dùng xóa thông tin xác thực từ ứng dụng web RP mà không cập nhật thiết bị xác thực.

Khi người dùng cố gắng đăng nhập bằng thông tin xác thực có thể phát hiện, họ được hiển thị một tập hợp thông tin xác thực từ thiết bị xác thực để lựa chọn, và thông tin xác thực được chọn được trả về cho ứng dụng web RP để đăng nhập. Nếu người dùng chọn một thông tin xác thực đã bị xóa khỏi máy chủ RP, nó sẽ không được nhận ra, và đăng nhập sẽ thất bại. Đây là trải nghiệm khó hiểu với người dùng, những người kỳ vọng chỉ được cung cấp các thông tin xác thực có thể thành công.

Để giảm thiểu vấn đề này, `signalAllAcceptedCredentials()` nên được gọi bởi ứng dụng web RP mỗi khi người dùng xóa thông tin xác thực hoặc đăng nhập, để thông báo cho thiết bị xác thực biết thông tin xác th��c nào vẫn còn hợp lệ cho người dùng đó. Tùy thiết bị xác thực cách xử lý thông tin này, nhưng kỳ vọng là nó sẽ đồng bộ hóa thông tin của mình với danh sách thông tin xác thực được cung cấp. Các thông tin xác thực không có trong danh sách nên bị xóa để người dùng sẽ không được cung cấp các thông tin xác thực không tồn tại trong UI đăng nhập.

> [!WARNING]
> Hãy thận trọng khi gọi `signalAllAcceptedCredentials()` — bất kỳ thông tin xác thực hợp lệ nào không có trong danh sách có ý định bị xóa khỏi thiết bị xác thực, điều này sẽ ngăn người dùng đăng nhập bằng chúng. Truyền danh sách rỗng có thể xóa tất cả thông tin xác thực của người dùng. Một số thiết bị xác thực có thể hỗ trợ khôi phục thông tin xác thực thông qua cuộc gọi tiếp theo tới `signalAllAcceptedCredentials()` với các ID thông tin xác thực đã bị xóa trước đó được bao gồm trong danh sách.

`signalAllAcceptedCredentials()` chỉ _nên_ được gọi khi người dùng hiện tại đã được xác thực vì nó tiết lộ thông tin nhạy cảm thuộc về người dùng. Nếu người dùng không được xác thực vì họ đã cố đăng nhập với thông tin xác thực không tồn tại trên máy chủ RP, bạn nên thay thế bằng cách gọi {{domxref("PublicKeyCredential.signalUnknownCredential_static", "PublicKeyCredential.signalUnknownCredential()")}} với thông tin xác thực không được nhận ra, để thiết bị xác thực có thể xóa nó. Xem [Discoverable credential synchronization methods](/en-US/docs/Web/API/Web_Authentication_API#discoverable_credential_synchronization_methods) để so sánh chi tiết hơn.

## Ví dụ

### Báo hiệu các thông tin xác thực được chấp nhận

Trong ví dụ này, chúng ta gọi phương thức `signalAllAcceptedCredentials()`, truyền vào chi tiết của tất cả thông tin xác thực thuộc về người dùng, bao gồm cả những thông tin họ vừa đăng nhập bằng. Kết quả là, thiết bị xác thực nên cập nhật bản sao thông tin xác thực của mình để giữ chúng đồng bộ với RP.

```js
if (PublicKeyCredential.signalAllAcceptedCredentials) {
  await PublicKeyCredential.signalAllAcceptedCredentials({
    rpId: "example.com",
    userId: "M2YPl-KGnA8", // base64url-encoded user ID
    allAcceptedCredentialIds: [
      // A list of base64url-encoded credential IDs
      "vI0qOggiE3OT01ZRWBYz5l4MEgU0c7PmAA",
      // …
    ],
  });
}
```

Để biết thêm ví dụ code, xem [Keep passkeys consistent with credentials on your server with the Signal API](https://developer.chrome.com/docs/identity/webauthn-signal-api) trên developer.chrome.com (2024).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PublicKeyCredential.signalCurrentUserDetails_static", "PublicKeyCredential.signalCurrentUserDetails()")}}
- {{domxref("PublicKeyCredential.signalUnknownCredential_static", "PublicKeyCredential.signalUnknownCredential()")}}
- [Keep passkeys consistent with credentials on your server with the Signal API](https://developer.chrome.com/docs/identity/webauthn-signal-api) trên developer.chrome.com (2024)
