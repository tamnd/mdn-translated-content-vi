---
title: "CryptoKey: thuộc tính type"
short-title: type
slug: Web/API/CryptoKey/type
page-type: web-api-instance-property
browser-compat: api.CryptoKey.type
---

{{APIRef("Web Crypto API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`type`** của giao diện {{DOMxRef("CryptoKey")}} cho biết đối tượng đang biểu diễn loại khóa nào. Thuộc tính này có thể có các giá trị sau:

- `"secret"`: Đây là một khóa bí mật để sử dụng với {{Glossary("Symmetric-key cryptography", "thuật toán đối xứng")}}.
- `"private"`: Đây là nửa khóa riêng tư của một [`CryptoKeyPair`](/en-US/docs/Web/API/CryptoKeyPair) thuộc {{Glossary("Public-key cryptography", "thuật toán bất đối xứng")}}.
- `"public"`: Đây là nửa khóa công khai của một [`CryptoKeyPair`](/en-US/docs/Web/API/CryptoKeyPair) thuộc {{Glossary("Public-key cryptography", "thuật toán bất đối xứng")}}.

## Giá trị

Một trong các chuỗi sau: `"secret"`, `"private"`, hoặc `"public"`.

## Ví dụ

Hàm này xác minh một thông điệp bằng {{domxref("SubtleCrypto.verify()")}} và một khóa công khai được truyền vào tham số. Nếu khóa không phải là khóa công khai, hàm luôn trả về `"invalid"`, vì việc xác minh như vậy về bản chất là không an toàn.

```js
async function verifyMessage(publicKey) {
  const signatureValue = document.querySelector(
    ".rsassa-pkcs1 .signature-value",
  );
  signatureValue.classList.remove("valid", "invalid");

  let result = false; // Mặc định là không hợp lệ

  if (publicKey.type === "public") {
    const encoded = getMessageEncoding();
    result = await window.crypto.subtle.verify(
      "RSASSA-PKCS1-v1_5",
      publicKey,
      signature,
      encoded,
    );
  }

  signatureValue.classList.add(result ? "valid" : "invalid");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
