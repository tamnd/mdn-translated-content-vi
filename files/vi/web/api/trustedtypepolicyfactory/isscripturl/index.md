---
title: "TrustedTypePolicyFactory: isScriptURL() method"
short-title: isScriptURL()
slug: Web/API/TrustedTypePolicyFactory/isScriptURL
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicyFactory.isScriptURL
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`isScriptURL()`** của giao diện {{domxref("TrustedTypePolicyFactory")}} trả về true nếu được truyền một đối tượng {{domxref("TrustedScriptURL")}} hợp lệ.

> [!NOTE]
> Mục đích của các hàm `isScriptURL()`, {{domxref("TrustedTypePolicyFactory.isHTML","isHTML()")}}, và {{domxref("TrustedTypePolicyFactory.isScript","isScript()")}} là để kiểm tra xem đối tượng có phải là đối tượng TrustedType hợp lệ, được tạo bởi một chính sách đã cấu hình hay không.

## Cú pháp

```js-nolint
isScriptURL(value)
```

### Tham số

- `value`
  - : Một đối tượng {{domxref("TrustedScriptURL")}}.

### Giá trị trả về

Một {{jsxref("boolean")}} là true nếu đối tượng là đối tượng {{domxref("TrustedScriptURL")}} hợp lệ.

## Ví dụ

Trong ví dụ bên dưới, hằng số `url` được tạo bởi một chính sách, do đó `isScriptURL()` trả về true. Ví dụ thứ hai là cố gắng làm giả đối tượng, và ví dụ thứ ba là một chuỗi. Cả hai sẽ trả về false khi được truyền vào `isScriptURL()`.

```js
const url = policy.createScriptURL("https://example.com/myscript.js");
console.log(trustedTypes.isScriptURL(url)); // true;

const fake = Object.create(TrustedScriptURL.prototype);
console.log(trustedTypes.isScriptURL(fake)); // false

console.log(trustedTypes.isScriptURL("https://example.com/myscript.js")); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
