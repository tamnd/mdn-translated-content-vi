---
title: "TrustedTypePolicyFactory: isScript() method"
short-title: isScript()
slug: Web/API/TrustedTypePolicyFactory/isScript
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicyFactory.isScript
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`isScript()`** của giao diện {{domxref("TrustedTypePolicyFactory")}} trả về true nếu được truyền một đối tượng {{domxref("TrustedScript")}} hợp lệ.

> [!NOTE]
> Mục đích của các hàm `isScript()`, {{domxref("TrustedTypePolicyFactory.isHTML","isHTML()")}}, và {{domxref("TrustedTypePolicyFactory.isScriptURL","isScriptURL()")}} là để kiểm tra xem đối tượng có phải là đối tượng TrustedType hợp lệ, được tạo bởi một chính sách đã cấu hình hay không.

## Cú pháp

```js-nolint
isScript(value)
```

### Tham số

- `value`
  - : Một đối tượng {{domxref("TrustedScript")}}.

### Giá trị trả về

Một {{jsxref("boolean")}} là true nếu đối tượng là đối tượng {{domxref("TrustedScript")}} hợp lệ.

## Ví dụ

Trong ví dụ bên dưới, hằng số `url` được tạo bởi một chính sách, do đó `isScriptURL()` trả về true. Ví dụ thứ hai là cố gắng làm giả đối tượng, và ví dụ thứ ba là một chuỗi. Cả hai sẽ trả về false khi được truyền vào `isScriptURL()`.

```js
const myScript = policy.createScript("eval('2 + 2')");
console.log(trustedTypes.isScript(myScript)); // true;

const fake = Object.create(TrustedScript.prototype);
console.log(trustedTypes.isScript(fake)); // false

console.log(trustedTypes.isScript("eval('2 + 2')")); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
