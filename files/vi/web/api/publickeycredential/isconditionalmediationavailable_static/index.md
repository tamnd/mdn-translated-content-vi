---
title: "PublicKeyCredential: phương thức tĩnh isConditionalMediationAvailable()"
short-title: isConditionalMediationAvailable()
slug: Web/API/PublicKeyCredential/isConditionalMediationAvailable_static
page-type: web-api-static-method
browser-compat: api.PublicKeyCredential.isConditionalMediationAvailable_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức tĩnh **`isConditionalMediationAvailable()`** của giao diện {{domxref("PublicKeyCredential")}} trả về một {{jsxref("Promise")}} được giải quyết thành `true` nếu [điều phối có điều kiện](/en-US/docs/Web/API/Web_Authentication_API#autofill_ui) có sẵn.

## Cú pháp

```js-nolint
PublicKeyCredential.isConditionalMediationAvailable()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành giá trị boolean cho biết điều phối có điều kiện có sẵn hay không.

### Ngoại lệ

{{jsxref("Promise")}} được trả về có thể bị từ chối với các giá trị sau:

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.

## Ví dụ

Trước khi gọi API WebAuthn có điều kiện, hãy kiểm tra xem:

- Trình duyệt có hỗ trợ Web Authentication API không.
- Trình duyệt có hỗ trợ điều phối có điều kiện không.

```js
// Availability of `window.PublicKeyCredential` means WebAuthn is usable.
if (
  window.PublicKeyCredential &&
  PublicKeyCredential.isConditionalMediationAvailable
) {
  // Check if conditional mediation is available.
  const isCMA = await PublicKeyCredential.isConditionalMediationAvailable();
  if (isCMA) {
    // Call WebAuthn authentication
    const publicKeyCredentialRequestOptions = {
      // Server generated challenge
      challenge: challengeFromServer,
      // The same RP ID as used during registration
      rpId: "example.com",
    };

    const credential = await navigator.credentials.get({
      publicKey: publicKeyCredentialRequestOptions,
      signal: abortController.signal,
      // Specify 'conditional' to activate conditional UI
      mediation: "conditional",
    });
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
