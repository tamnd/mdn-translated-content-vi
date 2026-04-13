---
title: Thuộc tính clientDataJSON của AuthenticatorResponse
short-title: clientDataJSON
slug: Web/API/AuthenticatorResponse/clientDataJSON
page-type: web-api-instance-property
browser-compat: api.AuthenticatorResponse.clientDataJSON
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính **`clientDataJSON`** của giao diện {{domxref("AuthenticatorResponse")}} lưu trữ một chuỗi [JSON](/en-US/docs/Learn_web_development/Core/Scripting/JSON) trong một {{jsxref("ArrayBuffer")}}, biểu diễn dữ liệu client đã được truyền vào {{domxref("CredentialsContainer.create()", "navigator.credentials.create()")}} hoặc {{domxref("CredentialsContainer.get()", "navigator.credentials.get()")}}. Thuộc tính này chỉ được truy cập trên một trong các đối tượng con của `AuthenticatorResponse`, cụ thể là {{domxref("AuthenticatorAttestationResponse")}} hoặc {{domxref("AuthenticatorAssertionResponse")}}.

## Giá trị

Một {{jsxref("ArrayBuffer")}}.

## Thuộc tính thể hiện

Sau khi đối tượng `clientDataJSON` được chuyển đổi từ `ArrayBuffer` sang một đối tượng JavaScript, nó sẽ có các thuộc tính sau:

- `challenge`
  - : Phiên bản được mã hóa theo [base64url](/en-US/docs/Glossary/Base64) của challenge mật mã được gửi từ máy chủ của relying party. Giá trị gốc được truyền dưới dạng tùy chọn `challenge` trong {{domxref("CredentialsContainer.get()")}} hoặc {{domxref("CredentialsContainer.create()")}}.

- `crossOrigin` {{optional_inline}}
  - : Một giá trị Boolean. Nếu được đặt thành `true`, điều đó có nghĩa là ngữ cảnh gọi là một {{htmlelement("iframe")}} không cùng nguồn gốc với các khung tổ tiên của nó.

- `origin`
  - : Nguồn gốc đầy đủ của relying party đã được client/trình duyệt cung cấp cho authenticator. Ta nên kỳ vọng rằng _id_ của relying party là hậu tố của giá trị này.

- `tokenBinding` {{optional_inline}} {{deprecated_inline}}
  - : Một đối tượng mô tả trạng thái của [giao thức token binding](https://datatracker.ietf.org/doc/html/rfc8471) cho giao tiếp với relying party. Nó có hai thuộc tính:
    - `status`: Một chuỗi nhận một trong hai giá trị `"supported"` để chỉ ra client hỗ trợ token binding nhưng không thương lượng với relying party, hoặc `"present"` khi token binding đã được sử dụng
    - `id`: Một chuỗi là dạng mã hóa [base64url](/en-US/docs/Glossary/Base64) của mã định danh token binding đã được dùng cho giao tiếp

    Nếu thuộc tính này không có mặt, điều đó cho biết client không hỗ trợ token binding.

    > [!NOTE]
    > `tokenBinding` đã bị phản đối từ Cấp độ 3 của đặc tả, nhưng trường này được dành riêng để không bị tái sử dụng cho mục đích khác.

- `topOrigin` {{optional_inline}}
  - : Chứa nguồn gốc cấp cao nhất đầy đủ của relying party. Nó chỉ được đặt nếu `crossOrigin` là `true`.

- `type`
  - : Một chuỗi có giá trị `"webauthn.get"` khi một credential hiện có được truy xuất hoặc `"webauthn.create"` khi một credential mới được tạo.

## Ví dụ

```js
function arrayBufferToStr(buf) {
  return String.fromCharCode.apply(null, new Uint8Array(buf));
}

// pk is a PublicKeyCredential that is the result of a create() or get() Promise
const clientDataStr = arrayBufferToStr(pk.response.clientDataJSON);
const clientDataObj = JSON.parse(clientDataStr);

console.log(clientDataObj.type); // "webauthn.create" or "webauthn.get"
console.log(clientDataObj.challenge); // base64 encoded String containing the original challenge
console.log(clientDataObj.origin); // the window.origin
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
