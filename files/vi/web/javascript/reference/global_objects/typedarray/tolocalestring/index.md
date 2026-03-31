---
title: TypedArray.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các thực thể {{jsxref("TypedArray")}} trả về một chuỗi biểu diễn các phần tử của mảng được gõ kiểu. Các phần tử được chuyển đổi thành chuỗi bằng phương thức `toLocaleString` của chúng và các chuỗi này được phân tách bởi một chuỗi đặc thù theo địa phương (chẳng hạn như dấu phẩy ","). Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.toLocaleString()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.toLocaleString()")}}

```js interactive-example
const uint8 = new Uint32Array([500, 8123, 12]);

console.log(uint8.toLocaleString());
// Expected output: "500,8123,12"

console.log(uint8.toLocaleString("en-GB"));
// Expected output: "500,8,123,12"

console.log(
  uint8.toLocaleString("de-DE", { style: "currency", currency: "EUR" }),
);
// Expected output: "500,00 €,8.123,00 €,12,00 €"
```

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

- `locales` {{optional_inline}}
  - : Chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi đó. Để biết dạng chung và cách giải thích đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính cấu hình. Xem {{jsxref("Number.prototype.toLocaleString()")}}.

### Giá trị trả về

Chuỗi biểu diễn các phần tử của mảng được gõ kiểu.

## Mô tả

Xem {{jsxref("Array.prototype.toLocaleString()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng toLocaleString()

```js
const uint = new Uint32Array([2000, 500, 8123, 12, 4212]);

uint.toLocaleString();
// nếu chạy trong địa phương de-DE
// "2.000,500,8.123,12,4.212"

uint.toLocaleString("en-US");
// "2,000,500,8,123,12,4,212"

uint.toLocaleString("ja-JP", { style: "currency", currency: "JPY" });
// "￥2,000,￥500,￥8,123,￥12,￥4,212"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.toString()")}}
- {{jsxref("Array.prototype.toLocaleString()")}}
- {{jsxref("Intl")}}
- {{jsxref("Intl.ListFormat")}}
- {{jsxref("Number.prototype.toLocaleString()")}}
