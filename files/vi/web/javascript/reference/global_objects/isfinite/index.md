---
title: isFinite()
slug: Web/JavaScript/Reference/Global_Objects/isFinite
page-type: javascript-function
browser-compat: javascript.builtins.isFinite
sidebar: jssidebar
---

Hàm **`isFinite()`** xác định xem một giá trị có phải là hữu hạn không, trước tiên chuyển đổi giá trị thành số nếu cần. Một số hữu hạn là số không phải {{jsxref("NaN")}} hay ±{{jsxref("Infinity")}}. Vì việc ép kiểu bên trong hàm `isFinite()` có thể [gây bất ngờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/isNaN#description), bạn có thể thích dùng {{jsxref("Number.isFinite()")}} hơn.

{{InteractiveExample("JavaScript Demo: isFinite()")}}

```js interactive-example
function div(x) {
  if (isFinite(1000 / x)) {
    return "Number is NOT Infinity.";
  }
  return "Number is Infinity!";
}

console.log(div(0));
// Expected output: "Number is Infinity!""

console.log(div(1));
// Expected output: "Number is NOT Infinity."
```

## Cú pháp

```js-nolint
isFinite(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra.

### Giá trị trả về

`false` nếu giá trị đã cho là {{jsxref("NaN")}}, {{jsxref("Infinity")}}, hoặc `-Infinity` sau khi [chuyển đổi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion); nếu không, `true`.

## Mô tả

`isFinite()` là thuộc tính hàm của đối tượng toàn cục.

Khi đối số của hàm `isFinite()` không thuộc kiểu [Number](/en-US/docs/Web/JavaScript/Guide/Data_structures#number_type), giá trị trước tiên bị ép thành số, và giá trị kết quả sau đó được so sánh với `NaN` và ±Infinity. Điều này cũng gây nhầm lẫn như hành vi của {{jsxref("isNaN")}} — ví dụ, `isFinite("1")` là `true`.

{{jsxref("Number.isFinite()")}} là cách đáng tin cậy hơn để kiểm tra xem một giá trị có phải là số hữu hạn không, vì nó trả về `false` cho bất kỳ đầu vào nào không phải số.

## Ví dụ

### Dùng isFinite()

```js
isFinite(Infinity); // false
isFinite(NaN); // false
isFinite(-Infinity); // false

isFinite(0); // true
isFinite(2e64); // true
isFinite(910); // true

// Would've been false with the more robust Number.isFinite():
isFinite(null); // true
isFinite("0"); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.isFinite()")}}
- {{jsxref("Number.NaN")}}
- {{jsxref("Number.POSITIVE_INFINITY")}}
- {{jsxref("Number.NEGATIVE_INFINITY")}}
