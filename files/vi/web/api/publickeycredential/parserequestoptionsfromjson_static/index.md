---
title: "PublicKeyCredential: phương thức tĩnh parseRequestOptionsFromJSON()"
short-title: parseRequestOptionsFromJSON()
slug: Web/API/PublicKeyCredential/parseRequestOptionsFromJSON_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.parseRequestOptionsFromJSON_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`parseRequestOptionsFromJSON()`** của giao diện {{domxref("PublicKeyCredential")}} chuyển đổi {{glossary("JSON type representation")}} thành một phiên bản {{domxref("PublicKeyCredentialRequestOptions")}}.

Phương thức này là hàm tiện lợi để chuyển đổi thông tin được cung cấp bởi máy chủ relying party sang ứng dụng web để yêu cầu thông tin xác thực hiện có.

## Cú pháp

```js-nolint
PublicKeyCredential.parseRequestOptionsFromJSON(options)
```

### Tham số

- `options`
  - : Một đối tượng có cùng cấu trúc với phiên bản {{domxref("PublicKeyCredentialRequestOptions")}}, nhưng với các chuỗi được mã hóa [base64url](/en-US/docs/Glossary/Base64) được dùng thay cho các thuộc tính buffer.

### Giá trị trả về

Một phiên bản {{domxref("PublicKeyCredentialRequestOptions")}}.

### Ngoại lệ

- `EncodingError` {{domxref("DOMException")}}
  - : Được ném ra nếu bất kỳ phần nào của đối tượng `options` không thể được chuyển đổi thành phiên bản {{domxref("PublicKeyCredentialRequestOptions")}}.
- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.

## Mô tả

Quá trình Web Authentication để [xác thực người dùng (đã đăng ký)](/en-US/docs/Web/API/Web_Authentication_API#authenticating_a_user) liên quan đến máy chủ relying party gửi cho ứng dụng web thông tin cần thiết để tìm thông tin xác thực hiện có, bao gồm chi tiết về danh tính người dùng, relying party, "challenge", và tùy chọn nơi tìm kiếm thông tin xác thực: ví dụ trên thiết bị xác thực được tích hợp cục bộ, hoặc trên thiết bị ngoài qua USB, BLE, v.v.
Ứng dụng web truyền thông tin này cho thiết bị xác thực để tìm thông tin xác thực, bằng cách gọi [`navigator.credentials.get()`](/en-US/docs/Web/API/CredentialsContainer/get) với đối số chứa dữ liệu do máy chủ cung cấp như một phiên bản {{domxref("PublicKeyCredentialRequestOptions")}}.

Đặc tả không định nghĩa cách thông tin cần để yêu cầu thông tin xác thực được gửi đi.
Một cách tiếp cận thuận tiện là máy chủ đóng gói thông tin trong {{glossary("JSON type representation")}} của phiên bản {{domxref("PublicKeyCredentialRequestOptions")}}, phản ánh cấu trúc của nó nhưng mã hóa các thuộc tính buffer như `challenge` thành chuỗi [base64url](/en-US/docs/Glossary/Base64).
Đối tượng này có thể được tuần tự hóa thành chuỗi [JSON](/en-US/docs/Glossary/JSON), gửi đến ứng dụng web và giải tuần tự hóa, rồi được chuyển đổi thành phiên bản {{domxref("PublicKeyCredentialRequestOptions")}} bằng cách dùng **`parseRequestOptionsFromJSON()`**.

## Ví dụ

Khi xác thực người dùng đã đăng ký, máy chủ relying party sẽ cung cấp cho ứng dụng web thông tin về thông tin xác thực được yêu cầu, relying party, và challenge.
Code bên dưới định nghĩa thông tin này theo dạng được mô tả trong [tham số `options`](#tham-số) ở trên:

```js
const requestCredentialOptionsJSON = {
  challenge: new Uint8Array([139, 66, 181, 87, 7, 203 /* … */]),
  rpId: "acme.com",
  allowCredentials: [
    {
      type: "public-key",
      id: new Uint8Array([64, 66, 25, 78, 168, 226, 174 /* … */]),
    },
  ],
  userVerification: "required",
};
```

Vì đối tượng này chỉ sử dụng các kiểu dữ liệu JSON, nó có thể được tuần tự hóa thành JSON bằng [`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) và gửi đến ứng dụng web.

```js
JSON.stringify(requestCredentialOptionsJSON);
```

Ứng dụng web có thể giải tuần tự hóa chuỗi JSON trở lại thành đối tượng `requestCredentialOptionsJSON` (không hiển thị).
Phương thức **`parseRequestOptionsFromJSON()`** được dùng để chuyển đổi đối tượng đó sang dạng có thể được sử dụng trong `navigator.credentials.get()`:

```js
// Convert options to form used by get()
const publicKey = PublicKeyCredential.parseRequestOptionsFromJSON(
  requestCredentialOptionsJSON, // JSON-type representation
);

navigator.credentials
  .get({ publicKey })
  .then((returnedCredentialInfo) => {
    // Handle the returned credential information here.
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

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- {{domxref("PublicKeyCredential.parseCreationOptionsFromJSON_static", "PublicKeyCredential.parseCreationOptionsFromJSON()")}}
