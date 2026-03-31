---
title: Number.isInteger()
short-title: isInteger()
slug: Web/JavaScript/Reference/Global_Objects/Number/isInteger
page-type: javascript-static-method
browser-compat: javascript.builtins.Number.isInteger
sidebar: jsref
---

Phương thức tĩnh **`Number.isInteger()`** xác định xem giá trị được truyền vào có phải là một số nguyên hay không.

{{InteractiveExample("JavaScript Demo: Number.isInteger()")}}

```js interactive-example
function fits(x, y) {
  if (Number.isInteger(y / x)) {
    return "Fits!";
  }
  return "Does NOT fit!";
}

console.log(fits(5, 10));
// Expected output: "Fits!"

console.log(fits(5, 11));
// Expected output: "Does NOT fit!"
```

## Cú pháp

```js-nolint
Number.isInteger(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra xem có phải là số nguyên hay không.

### Giá trị trả về

Giá trị boolean `true` nếu giá trị đã cho là một số nguyên. Ngược lại là `false`.

## Mô tả

Nếu giá trị đích là một số nguyên, trả về `true`, ngược lại trả về `false`. Nếu giá trị là {{jsxref("NaN")}} hoặc {{jsxref("Infinity")}}, trả về `false`. Phương thức cũng trả về `true` cho các số dấu phẩy động có thể được biểu diễn dưới dạng số nguyên. Nó luôn trả về `false` nếu giá trị không phải là số.

Lưu ý rằng một số số literal, dù trông có vẻ không phải số nguyên, thực ra biểu diễn số nguyên — do giới hạn độ chính xác của mã hóa số dấu phẩy động ECMAScript (IEEE-754). Ví dụ, `5.0000000000000001` chỉ khác `5` bởi `1e-16`, quá nhỏ để được biểu diễn. (Để tham khảo, [`Number.EPSILON`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/EPSILON) lưu trữ khoảng cách giữa 1 và số dấu phẩy động tiếp theo lớn hơn 1, và đó là khoảng `2.22e-16`.) Do đó, `5.0000000000000001` sẽ được biểu diễn với cùng mã hóa như `5`, do đó `Number.isInteger(5.0000000000000001)` trả về `true`.

Theo nghĩa tương tự, các số xung quanh độ lớn của [`Number.MAX_SAFE_INTEGER`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER) sẽ bị mất độ chính xác và khiến `Number.isInteger` trả về `true` ngay cả khi không phải là số nguyên. (Ngưỡng thực tế thay đổi dựa trên số bit cần thiết để biểu diễn phần thập phân — ví dụ: `Number.isInteger(4500000000000000.1)` là `true`, nhưng `Number.isInteger(4500000000000000.5)` là `false`.)

## Ví dụ

### Sử dụng isInteger

```js
Number.isInteger(0); // true
Number.isInteger(1); // true
Number.isInteger(-100000); // true
Number.isInteger(99999999999999999999999); // true

Number.isInteger(0.1); // false
Number.isInteger(Math.PI); // false

Number.isInteger(NaN); // false
Number.isInteger(Infinity); // false
Number.isInteger(-Infinity); // false
Number.isInteger("10"); // false
Number.isInteger(true); // false
Number.isInteger(false); // false
Number.isInteger([1]); // false

Number.isInteger(5.0); // true
Number.isInteger(5.000000000000001); // false
Number.isInteger(5.0000000000000001); // true, because of loss of precision
Number.isInteger(4500000000000000.1); // true, because of loss of precision
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.isInteger` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.isInteger`](https://www.npmjs.com/package/number.isinteger)
- {{jsxref("Number")}}
