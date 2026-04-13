---
title: "PublicKeyCredential: thuộc tính response"
short-title: response
slug: Web/API/PublicKeyCredential/response
page-type: web-api-instance-property
browser-compat: api.PublicKeyCredential.response
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`response`** của
giao diện {{domxref("PublicKeyCredential")}} là một đối tượng {{domxref("AuthenticatorResponse")}}
được gửi từ thiết bị xác thực đến user agent cho việc tạo/tìm nạp
thông tin xác thực. Thông tin trong phản hồi này sẽ được máy chủ của relying
party sử dụng để xác minh rằng yêu cầu là hợp lệ.

Một `AuthenticatorResponse` có thể là:

- {{domxref("AuthenticatorAttestationResponse")}} (khi
  `PublicKeyCredential` được tạo qua
  {{domxref("CredentialsContainer.create()")}})
- {{domxref("AuthenticatorAssertionResponse")}} (khi
  `PublicKeyCredential` được lấy qua
  {{domxref("CredentialsContainer.get()")}}).

Để xác thực _việc tạo_ thông tin xác thực, máy chủ của relying party
cần cả hai:

- phản hồi này
- các tiện ích mở rộng của client (được cung cấp bởi
  {{domxref("PublicKeyCredential.getClientExtensionResults()")}}) để xác thực
  yêu cầu.

> [!NOTE]
> Khi xác thực việc tìm nạp thông tin xác thực hiện có, toàn bộ đối tượng
> `PublicKeyCredential` và các tiện ích mở rộng client là cần thiết
> cho máy chủ của relying party.

> [!NOTE]
> Thuộc tính này chỉ có thể được sử dụng trong ngữ cảnh cấp cao nhất và
> sẽ không có sẵn trong một {{HTMLElement("iframe")}} chẳng hạn.

## Giá trị

Một đối tượng {{domxref("AuthenticatorResponse")}} chứa dữ liệu mà script của relying party
sẽ nhận và cần được gửi đến máy chủ của relying party để
xác thực yêu cầu tạo hoặc tìm nạp. Đối tượng này chứa dữ liệu từ client
({{domxref("AuthenticatorResponse/clientDataJSON")}}) và từ thiết bị xác thực.

## Ví dụ

```js
const options = {
  challenge: new Uint8Array(16) /* from the server */,
  rp: {
    name: "Example CORP",
    id: "login.example.com",
  },
  user: {
    id: new Uint8Array(16) /* from the server */,
    name: "canand@example.com",
    displayName: "Carina Anand",
  },
  pubKeyCredParams: [
    {
      type: "public-key",
      alg: -7,
    },
  ],
};

navigator.credentials
  .create({ publicKey: options })
  .then((pubKeyCredential) => {
    const response = pubKeyCredential.response;
    const clientExtResults = pubKeyCredential.getClientExtensionResults();
    // Send response and client extensions to the server so that it can validate
    // and create credentials
  })
  .catch((err) => {
    // Deal with any error
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
