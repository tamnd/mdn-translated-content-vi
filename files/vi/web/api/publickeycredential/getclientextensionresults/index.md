---
title: "PublicKeyCredential: phương thức getClientExtensionResults()"
short-title: getClientExtensionResults()
slug: Web/API/PublicKeyCredential/getClientExtensionResults
page-type: web-api-instance-method
browser-compat: api.PublicKeyCredential.getClientExtensionResults
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức **`getClientExtensionResults()`** của giao diện {{domxref("PublicKeyCredential")}} trả về một đối tượng ánh xạ các định danh của tiện ích mở rộng được yêu cầu trong quá trình tạo hoặc xác thực thông tin xác thực, và kết quả xử lý của chúng bởi user agent.

Trong quá trình tạo hoặc tìm nạp `PublicKeyCredential` (qua {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} và {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}} tương ứng), có thể yêu cầu xử lý "tùy chỉnh" bởi client cho các tiện ích mở rộng khác nhau, được chỉ định trong thuộc tính `extensions` của tùy chọn `publicKey`. Bạn có thể tìm thêm thông tin về việc yêu cầu các tiện ích mở rộng khác nhau trong [Web Authentication extensions](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions).

> [!NOTE]
> `getClientExtensionResults()` chỉ trả về kết quả từ các tiện ích mở rộng được xử lý bởi user agent (client). Kết quả từ các tiện ích mở rộng được xử lý bởi thiết bị xác thực có thể được tìm thấy trong [authenticator data](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data) có sẵn trong {{domxref("AuthenticatorAssertionResponse.authenticatorData")}}.

## Cú pháp

```js-nolint
getClientExtensionResults()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng trong đó mỗi mục nhập là chuỗi định danh của tiện ích mở rộng làm khóa, và đầu ra từ việc xử lý tiện ích mở rộng bởi client làm giá trị.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.

## Ví dụ

```js
const publicKey = {
  // Here are the extension "inputs"
  extensions: {
    appid: "https://accounts.example.com",
  },
  allowCredentials: {
    id: "fgrt46jfgd...",
    transports: ["usb", "nfc"],
    type: "public-key",
  },
  challenge: new Uint8Array(16) /* from the server */,
};

navigator.credentials
  .get({ publicKey })
  .then((publicKeyCred) => {
    const myResults = publicKeyCred.getClientExtensionResults();
    // myResults will contain the output of processing the "appid" extension
  })
  .catch((err) => {
    console.error(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

> [!NOTE]
> Các tiện ích mở rộng là tùy chọn và các trình duyệt khác nhau có thể nhận ra các tiện ích mở rộng khác nhau. Việc xử lý tiện ích mở rộng luôn là tùy chọn cho client: nếu một trình duyệt không nhận ra một tiện ích mở rộng nhất định, nó sẽ bỏ qua nó. Để biết thông tin về tiện ích mở rộng nào được các trình duyệt hỗ trợ, xem [Web Authentication extensions](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions).

## Xem thêm

- [The list of the currently defined extensions](https://w3c.github.io/webauthn/#sctn-defined-extensions)
- {{domxref("AuthenticatorAssertionResponse.authenticatorData")}} chứa kết quả xử lý tiện ích mở rộng của thiết bị xác thực
