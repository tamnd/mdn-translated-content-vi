---
title: "TrustedTypePolicyFactory: isHTML() method"
short-title: isHTML()
slug: Web/API/TrustedTypePolicyFactory/isHTML
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicyFactory.isHTML
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`isHTML()`** của giao diện {{domxref("TrustedTypePolicyFactory")}} trả về true nếu được truyền một đối tượng {{domxref("TrustedHTML")}} hợp lệ.

> [!NOTE]
> Mục đích của các hàm `isHTML()`, {{domxref("TrustedTypePolicyFactory.isScript","isScript()")}}, và {{domxref("TrustedTypePolicyFactory.isScriptURL","isScriptURL()")}} là để kiểm tra xem đối tượng có phải là đối tượng TrustedType hợp lệ, được tạo bởi một chính sách đã cấu hình hay không.

## Cú pháp

```js-nolint
isHTML(value)
```

### Tham số

- `value`
  - : Một đối tượng {{domxref("TrustedHTML")}}.

### Giá trị trả về

Một {{jsxref("boolean")}} là true nếu đối tượng là đối tượng {{domxref("TrustedHTML")}} hợp lệ.

## Ví dụ

Trong ví dụ bên dưới, hằng số `html` được tạo bởi một chính sách, do đó `isHTML()` trả về true. Ví dụ thứ hai là cố gắng làm giả đối tượng, và ví dụ thứ ba là một chuỗi. Cả hai sẽ trả về false khi được truyền vào `isHTML()`.

```js
const html = policy.createHTML("<div>");
console.log(trustedTypes.isHTML(html)); // true;

const fake = Object.create(TrustedHTML.prototype);
console.log(trustedTypes.isHTML(fake)); // false

console.log(trustedTypes.isHTML("<div>plain string</div>")); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
