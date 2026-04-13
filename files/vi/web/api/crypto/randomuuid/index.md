---
title: "Crypto: phương thức randomUUID()"
short-title: randomUUID()
slug: Web/API/Crypto/randomUUID
page-type: web-api-instance-method
browser-compat: api.Crypto.randomUUID
---

{{APIRef("Web Crypto API")}}{{SecureContext_header}}{{AvailableInWorkers}}

Phương thức **`randomUUID()`** của giao diện {{domxref("Crypto")}} được dùng để tạo một {{Glossary("UUID")}} v4 bằng bộ sinh số ngẫu nhiên an toàn về mặt mật mã.

## Cú pháp

```js-nolint
randomUUID()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa một UUID v4 được tạo ngẫu nhiên với độ dài 36 ký tự.

## Ví dụ

```js
/* Assuming that self.crypto.randomUUID() is available */

let uuid = self.crypto.randomUUID();
console.log(uuid); // for example "36b8f84d-df4e-4d49-b662-bcde71a8764f"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- {{ domxref("Crypto.getRandomValues") }}, một nguồn cung cấp số lượng byte ngẫu nhiên an toàn bất kỳ.
