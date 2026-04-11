---
title: "PublicKeyCredential: phương thức tĩnh getClientCapabilities()"
short-title: getClientCapabilities()
slug: Web/API/PublicKeyCredential/getClientCapabilities_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.getClientCapabilities_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`getClientCapabilities()`** của giao diện {{domxref("PublicKeyCredential")}} trả về một {{jsxref("Promise")}} được giải quyết với một đối tượng có thể được dùng để kiểm tra xem các khả năng client WebAuthn cụ thể và [tiện ích mở rộng](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions) có được hỗ trợ hay không.

Một relying party (RP) có thể dùng thông tin này để tùy chỉnh giao diện người dùng và quy trình đăng nhập và đăng ký của mình một cách phù hợp.

## Cú pháp

```js-nolint
PublicKeyCredential.getClientCapabilities()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một đối tượng trong đó tên thuộc tính là các chuỗi khả năng client, và giá trị là các giá trị boolean cho biết khả năng hoặc tiện ích mở rộng tương ứng có được hỗ trợ hay không.

Các chuỗi khả năng client WebAuthn là:

- `"conditionalCreate"`
  - : Client có khả năng tạo [thông tin xác thực có thể phát hiện](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials).
- `"conditionalGet"`
  - : Client có khả năng [điều phối có điều kiện](/en-US/docs/Web/API/Web_Authentication_API#autofill_ui).
    Khả năng này tương đương với [`isConditionalMediationAvailable()`](/en-US/docs/Web/API/PublicKeyCredential/isConditionalMediationAvailable_static) giải quyết thành `true`.
- `"hybridTransport"`
  - : Client hỗ trợ sử dụng phương thức truyền tải [hybrid](/en-US/docs/Web/API/AuthenticatorAttestationResponse/getTransports#hybrid).
    Điều này có nghĩa là client có thể sử dụng thiết bị xác thực dựa trên Bluetooth, NFC, hoặc USB.
- `"passkeyPlatformAuthenticator"`
  - : Client cho phép sử dụng thiết bị xác thực passkey hỗ trợ các cơ chế {{glossary("multi-factor authentication")}} như mã PIN hoặc kiểm tra sinh trắc học.
    Thiết bị xác thực có thể là một phần của cùng nền tảng (thiết bị) với client, hoặc kết nối qua phương thức truyền tải hybrid như Bluetooth hoặc USB.
    Thông tin xác thực được lưu trữ trên thiết bị xác thực.
    Xem [Passkeys developer guide for relying parties](https://developers.google.com/identity/passkeys/developer-guides).
- `userVerifyingPlatformAuthenticator`
  - : Client có thiết bị xác thực nền tảng (là một phần của cùng thiết bị) hỗ trợ các cơ chế {{glossary("multi-factor authentication")}}, chẳng hạn như mã PIN hoặc kiểm tra sinh trắc học.
    Thông tin xác thực có thể được lưu trữ trên RP hoặc thiết bị xác thực.
- `relatedOrigins`
  - : Client hỗ trợ [Related Origin Requests](https://web.dev/articles/webauthn-related-origin-requests).
    Các client này cho phép sử dụng passkey trên nhiều trang web có cùng nguồn gốc.
- `signalAllAcceptedCredentials`
  - : Client hỗ trợ phương thức tĩnh [`PublicKeyCredential.signalAllAcceptedCredentials()`](/en-US/docs/Web/API/PublicKeyCredential/signalAllAcceptedCredentials_static).
    Nếu không được hỗ trợ, quy trình RP sẽ cần nhắc người dùng xóa thông tin xác thực trên thiết bị xác thực theo cách thủ công.
- `signalCurrentUserDetails`
  - : Client hỗ trợ phương thức tĩnh [`PublicKeyCredential.signalCurrentUserDetails()`](/en-US/docs/Web/API/PublicKeyCredential/signalCurrentUserDetails_static).
    Nếu không được hỗ trợ, quy trình RP sẽ cần nhắc người dùng cập nhật chi tiết người dùng trên thiết bị xác thực theo cách thủ công.
- `signalUnknownCredential`
  - : Client hỗ trợ phương thức tĩnh [`PublicKeyCredential.signalUnknownCredential()`](/en-US/docs/Web/API/PublicKeyCredential/signalUnknownCredential_static).
    Nếu không được hỗ trợ, quy trình RP sẽ cần nhắc người dùng xóa thông tin xác thực từ thiết bị xác thực theo cách thủ công.

Các chuỗi [web extension](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions) được định dạng bằng cách thêm tiền tố vào [extension identifier](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions#available_extensions) với tiền tố `extension:`.
Ví dụ, khóa `extension:appid` có thể được dùng để kiểm tra xem [tiện ích mở rộng `appid`](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions#appid) có được hỗ trợ hay không.

### Ngoại lệ

{{jsxref("Promise")}} được trả về có thể bị từ chối với các giá trị sau:

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.

## Mô tả

`getClientCapabilities()` cho phép bạn kiểm tra xem khả năng hoặc tiện ích mở rộng nhất định có được hỗ trợ hay không, và sử dụng thông tin đó để cung cấp trải nghiệm người dùng phù hợp.

Ví dụ, hỗ trợ khả năng `userVerifyingPlatformAuthenticator` cho biết các biometric như cảm biến vân tay được cho phép.
Một ứng dụng web có thể dùng điều này để hiển thị biểu tượng vân tay nếu khả năng được hỗ trợ, hoặc ô nhập mật khẩu nếu không. Nếu đăng nhập bằng sinh trắc học là bắt buộc, nó có thể cung cấp thông báo rằng trang web không thể xác thực bằng trình duyệt hoặc thiết bị này.
Tương tự, `conditionalGet` cho biết client hỗ trợ điều phối có điều kiện khi đăng nhập người dùng, nghĩa là trình duyệt có thể cung cấp thông tin xác thực có thể phát hiện được điền tự động trong biểu mẫu đăng nhập (ví dụ như trường văn bản tự hoàn thành hoặc danh sách thả xuống), cùng với nút đăng nhập.

Nếu giá trị của một khả năng nhất định có mặt trong đối tượng được trả về, thì `true` cho biết khả năng hiện đang được hỗ trợ, và `false` cho biết nó không được. Tuy nhiên, nếu một khóa không có mặt cho khả năng cụ thể, không thể đưa ra giả định về sự có sẵn của tính năng liên quan.

Với tiện ích mở rộng, các giả định là như nhau. Tuy nhiên, lưu ý rằng ngay cả khi tiện ích mở rộng được client hỗ trợ, một thiết bị xác thực cụ thể có thể không hỗ trợ tiện ích mở rộng đó, vì vậy RP không được giả định rằng đây là đảm bảo rằng các bước xử lý thiết bị xác thực cho tiện ích mở rộng đó sẽ được thực hiện.

## Ví dụ

### Kiểm tra tất cả khả năng

Ví dụ này cho thấy cách lấy đối tượng khả năng và lặp qua các giá trị của nó.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```css hidden
#log {
  height: 230px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Đầu tiên chúng ta await `getClientCapabilities()` để lấy một đối tượng chứa các khả năng.
Sau đó chúng ta lặp qua đối tượng và ghi kết quả (mã ghi nhật ký không hiển thị):

```js
async function checkClientCapabilities() {
  const capabilities = await PublicKeyCredential.getClientCapabilities();

  if (capabilities) {
    log("Client Capabilities:");

    for (const [key, value] of Object.entries(capabilities)) {
      log(` ${key}: ${value}`);
    }
  }
}
```

Trước khi gọi hàm, chúng ta kiểm tra xem nó có được định nghĩa không, và ghi kết quả.

```js
// Call the function to check capabilities.
if (PublicKeyCredential.getClientCapabilities) {
  checkClientCapabilities();
} else {
  log(
    "PublicKeyCredential.getClientCapabilities() is not supported on this browser.",
  );
}
```

#### Kết quả

{{EmbedLiveSample("Check all capabilities", "", "280")}}

### Kiểm tra thiết bị xác thực nền tảng xác minh người dùng

Ví dụ này kiểm tra một khả năng duy nhất, `userVerifyingPlatformAuthenticator`. Một ứng dụng thực tế có thể dùng kết quả để cấu hình giao diện người dùng.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```css hidden
#log {
  height: 40px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Code tương tự như ví dụ trước, ngoại trừ chúng ta kiểm tra một khả năng cụ thể được trả về, và chúng ta dùng `try...catch` để bắt trường hợp `getClientCapabilities()` không được hỗ trợ.

```js
checkIsUserVerifyingPlatformAuthenticatorAvailable();

async function checkIsUserVerifyingPlatformAuthenticatorAvailable() {
  try {
    const capabilities = await PublicKeyCredential.getClientCapabilities();

    if (capabilities.userVerifyingPlatformAuthenticator) {
      log("Biometric login supported");
    } else {
      log("Biometric login not supported. Do password.");
    }
  } catch (error) {
    if (error instanceof TypeError) {
      log(
        "PublicKeyCredential.getClientCapabilities() is not supported on this browser.",
      );
    } else {
      log(`Unexpected error: ${error}`);
    }
  }
}
```

Lưu ý rằng ở đây chúng ta ghi kết quả của một kiểm tra.
Trong ứng dụng thực tế, chúng ta có thể cập nhật giao diện người dùng để hiển thị các tùy chọn phù hợp để xác minh người dùng.

#### Kết quả

Nhật ký bên dưới hiển thị một chuỗi cho biết phương thức không được hỗ trợ, hoặc một chuỗi cho biết đăng nhập sinh trắc học hay mật khẩu có được hỗ trợ hay không.

{{EmbedLiveSample("Test for user verifying platform authenticator", "", "90")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
