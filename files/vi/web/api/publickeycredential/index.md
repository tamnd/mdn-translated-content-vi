---
title: PublicKeyCredential
slug: Web/API/PublicKeyCredential
page-type: web-api-interface
browser-compat: api.PublicKeyCredential
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Giao diện **`PublicKeyCredential`** cung cấp thông tin về một cặp khóa công khai/riêng tư, là thông tin xác thực để đăng nhập vào dịch vụ bằng cặp khóa bất đối xứng không thể bị phishing và chống vi phạm dữ liệu thay vì mật khẩu. Nó kế thừa từ {{domxref("Credential")}}, và là một phần của tiện ích mở rộng [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) cho [Credential Management API](/en-US/docs/Web/API/Credential_Management_API).

{{InheritanceDiagram}}

> [!NOTE]
> API này bị giới hạn trong các ngữ cảnh cấp cao nhất. Việc sử dụng từ bên trong phần tử {{HTMLElement("iframe")}} sẽ không có hiệu lực.

## Thuộc tính phiên bản

- {{domxref("PublicKeyCredential.authenticatorAttachment")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết cơ chế mà qua đó việc triển khai WebAuthn được gắn với thiết bị xác thực tại thời điểm cuộc gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} hoặc {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}} liên quan hoàn tất.

- {{domxref("PublicKeyCredential.id")}} {{ReadOnlyInline}}
  - : Kế thừa từ {{domxref("Credential")}} và được ghi đè để là [mã hóa base64url](/en-US/docs/Glossary/Base64) của {{domxref("PublicKeyCredential.rawId")}}.

- {{domxref("PublicKeyCredential.rawId")}} {{ReadOnlyInline}}
  - : Một {{jsxref("ArrayBuffer")}} chứa định danh duy nhất toàn cầu cho `PublicKeyCredential` này. Định danh này có thể được dùng để tra cứu thông tin xác thực cho các cuộc gọi tương lai tới {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}}.
- {{domxref("PublicKeyCredential.response")}} {{ReadOnlyInline}}
  - : Một phiên bản của đối tượng {{domxref("AuthenticatorResponse")}}. Nó có loại {{domxref("AuthenticatorAttestationResponse")}} nếu `PublicKeyCredential` là kết quả của cuộc gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}}, hoặc loại {{domxref("AuthenticatorAssertionResponse")}} nếu `PublicKeyCredential` là kết quả của cuộc gọi {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}}.
- `PublicKeyCredential.type` {{ReadOnlyInline}}
  - : Kế thừa từ {{domxref("Credential")}}. Luôn được đặt thành `public-key` với các phiên bản `PublicKeyCredential`.

## Phương thức tĩnh

- {{domxref("PublicKeyCredential.getClientCapabilities_static", "PublicKeyCredential.getClientCapabilities()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với một đối tượng có thể được dùng để kiểm tra xem các khả năng WebAuthn cụ thể và [tiện ích mở rộng](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions) có được hỗ trợ hay không.
- {{domxref("PublicKeyCredential.isConditionalMediationAvailable_static", "PublicKeyCredential.isConditionalMediationAvailable()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành `true` nếu điều phối có điều kiện có sẵn.
- {{domxref("PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable_static", "PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành `true` nếu một thiết bị xác thực được gắn với nền tảng có khả năng _xác minh_ người dùng.
- {{domxref("PublicKeyCredential.parseCreationOptionsFromJSON_static", "PublicKeyCredential.parseCreationOptionsFromJSON()")}}
  - : Phương thức tiện lợi để giải tuần tự hóa dữ liệu đăng ký thông tin xác thực được gửi từ máy chủ khi [đăng ký người dùng với thông tin xác thực](/en-US/docs/Web/API/Web_Authentication_API#creating_a_key_pair_and_registering_a_user).
- {{domxref("PublicKeyCredential.parseRequestOptionsFromJSON_static", "PublicKeyCredential.parseRequestOptionsFromJSON()")}}
  - : Phương thức tiện lợi để giải tuần tự hóa dữ liệu yêu cầu thông tin xác thực được gửi từ máy chủ khi [xác thực người dùng (đã đăng ký)](/en-US/docs/Web/API/Web_Authentication_API#authenticating_a_user).
- {{domxref("PublicKeyCredential.signalAllAcceptedCredentials_static", "PublicKeyCredential.signalAllAcceptedCredentials()")}}
  - : Báo hiệu cho thiết bị xác thực tất cả các [ID thông tin xác thực](/en-US/docs/Web/API/PublicKeyCredentialRequestOptions#id) hợp lệ mà máy chủ [relying party](https://en.wikipedia.org/wiki/Relying_party) vẫn giữ cho một người dùng cụ thể.
- {{domxref("PublicKeyCredential.signalCurrentUserDetails_static", "PublicKeyCredential.signalCurrentUserDetails()")}}
  - : Báo hiệu cho thiết bị xác thực rằng một người dùng cụ thể đã cập nhật tên người dùng và/hoặc tên hiển thị của họ.
- {{domxref("PublicKeyCredential.signalUnknownCredential_static", "PublicKeyCredential.signalUnknownCredential()")}}
  - : Báo hiệu cho thiết bị xác thực rằng một [ID thông tin xác thực](/en-US/docs/Web/API/PublicKeyCredentialRequestOptions#id) không được máy chủ [relying party](https://en.wikipedia.org/wiki/Relying_party) nhận ra, ví dụ vì nó đã bị xóa.

## Phương thức phiên bản

- {{domxref("PublicKeyCredential.getClientExtensionResults()")}}
  - : Nếu có tiện ích mở rộng nào được yêu cầu, phương thức này sẽ trả về kết quả xử lý các tiện ích mở rộng đó.
- {{domxref("PublicKeyCredential.toJSON()")}}
  - : Phương thức tiện lợi để tạo biểu diễn chuỗi JSON của `PublicKeyCredential` để gửi đến máy chủ khi [đăng ký người dùng với thông tin xác thực](/en-US/docs/Web/API/Web_Authentication_API#creating_a_key_pair_and_registering_a_user) và [xác thực người dùng đã đăng ký](/en-US/docs/Web/API/Web_Authentication_API#authenticating_a_user).

## Ví dụ

### Tạo một phiên bản PublicKeyCredential mới

Ở đây, chúng ta dùng {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} để tạo thông tin xác thực mới.

```js
const createCredentialOptions = {
  publicKey: {
    challenge: new Uint8Array([
      21, 31, 105 /* 29 more random bytes generated by the server */,
    ]),
    rp: {
      name: "Example CORP",
      id: "login.example.com",
    },
    user: {
      id: new Uint8Array(16),
      name: "canand@example.com",
      displayName: "Carina Anand",
    },
    pubKeyCredParams: [
      {
        type: "public-key",
        alg: -7,
      },
    ],
  },
};

navigator.credentials
  .create(createCredentialOptions)
  .then((newCredentialInfo) => {
    const response = newCredentialInfo.response;
    const clientExtensionsResults =
      newCredentialInfo.getClientExtensionResults();
  })
  .catch((err) => {
    console.error(err);
  });
```

### Lấy một phiên bản PublicKeyCredential hiện có

Ở đây, chúng ta lấy một thông tin xác thực hiện có từ thiết bị xác thực, bằng cách dùng {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}}.

```js
const requestCredentialOptions = {
  publicKey: {
    challenge: new Uint8Array([
      /* bytes sent from the server */
    ]),
  },
};

navigator.credentials
  .get(requestCredentialOptions)
  .then((credentialInfoAssertion) => {
    // send assertion response back to the server
    // to proceed with the control of the credential
  })
  .catch((err) => {
    console.error(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện cha {{domxref("Credential")}}
