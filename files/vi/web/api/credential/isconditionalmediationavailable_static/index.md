---
title: "Credential: phương thức tĩnh isConditionalMediationAvailable()"
short-title: isConditionalMediationAvailable()
slug: Web/API/Credential/isConditionalMediationAvailable_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.Credential.isConditionalMediationAvailable_static
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}{{SeeCompatTable}}

Phương thức tĩnh **`isConditionalMediationAvailable()`** của giao diện {{domxref("Credential")}} trả về một {{jsxref("Promise")}} được giải quyết thành `false`.

Các lớp con của {{domxref("Credential")}} sẽ ghi đè phương thức này nếu chúng hỗ trợ conditional mediation. Xem ví dụ tại {{domxref("PublicKeyCredential.isConditionalMediationAvailable_static", "PublicKeyCredential.isConditionalMediationAvailable()")}}.

## Cú pháp

```js-nolint
Credential.isConditionalMediationAvailable()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành `false`.

## Ví dụ

```js
await Credential.isConditionalMediationAvailable(); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
