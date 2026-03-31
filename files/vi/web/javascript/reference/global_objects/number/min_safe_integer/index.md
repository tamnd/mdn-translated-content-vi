---
title: Number.MIN_SAFE_INTEGER
short-title: MIN_SAFE_INTEGER
slug: Web/JavaScript/Reference/Global_Objects/Number/MIN_SAFE_INTEGER
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.MIN_SAFE_INTEGER
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.MIN_SAFE_INTEGER`** biểu diễn số nguyên an toàn tối thiểu trong JavaScript, hay -(2<sup>53</sup> - 1).

Để biểu diễn các số nguyên nhỏ hơn giá trị này, hãy cân nhắc sử dụng {{jsxref("BigInt")}}.

{{InteractiveExample("JavaScript Demo: Number.MIN_SAFE_INTEGER")}}

```js interactive-example
const x = Number.MIN_SAFE_INTEGER - 1;
const y = Number.MIN_SAFE_INTEGER - 2;

console.log(Number.MIN_SAFE_INTEGER);
// Expected output: -9007199254740991

console.log(x);
// Expected output: -9007199254740992

console.log(x === y);
// Expected output: true
```

## Giá trị

`-9007199254740991` (-9.007.199.254.740.991, hay khoảng -9 nghìn tỷ).

{{js_property_attributes(0, 0, 0)}}

## Mô tả

[Định dạng dấu phẩy động độ chính xác đôi](https://en.wikipedia.org/wiki/Double_precision_floating-point_format) chỉ có 52 bit để biểu diễn [phần định trị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding), vì vậy nó chỉ có thể biểu diễn an toàn các số nguyên trong khoảng -(2<sup>53</sup> – 1) đến 2<sup>53</sup> – 1. An toàn trong bối cảnh này đề cập đến khả năng biểu diễn số nguyên chính xác và so sánh chúng đúng cách. Ví dụ, `Number.MIN_SAFE_INTEGER - 1 === Number.MIN_SAFE_INTEGER - 2` sẽ đánh giá là true, điều này không đúng về mặt toán học. Xem {{jsxref("Number.isSafeInteger()")}} để biết thêm thông tin.

Như đề cập trong {{jsxref("Number.EPSILON")}}, độ chính xác của số phụ thuộc vào độ lớn của chúng. `Number.MIN_SAFE_INTEGER` biểu diễn giá trị nhỏ nhất mà các phép toán cấp độ số nguyên có thể được thực hiện chính xác, nhưng bạn vẫn có thể thực hiện các phép toán có ý nghĩa trên các số âm hơn, chỉ là không có độ chính xác cấp độ số nguyên. Số lớn nhất có thể biểu diễn trong JavaScript thực ra là {{jsxref("Number.MAX_VALUE")}}, xấp xỉ 1.7976931348623157 × 10<sup>308</sup>.

Vì `MIN_SAFE_INTEGER` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.MIN_SAFE_INTEGER`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Sử dụng MIN_SAFE_INTEGER

```js
Number.MIN_SAFE_INTEGER; // -9007199254740991
-(2 ** 53 - 1); // -9007199254740991
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.MIN_SAFE_INTEGER` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.MIN_SAFE_INTEGER`](https://www.npmjs.com/package/es-constants)
- {{jsxref("Number.MAX_SAFE_INTEGER")}}
- {{jsxref("Number.isSafeInteger()")}}
- {{jsxref("BigInt")}}
