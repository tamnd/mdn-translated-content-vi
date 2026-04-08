---
title: Number.isNaN()
short-title: isNaN()
slug: Web/JavaScript/Reference/Global_Objects/Number/isNaN
page-type: javascript-static-method
browser-compat: javascript.builtins.Number.isNaN
sidebar: jsref
---

Phương thức tĩnh **`Number.isNaN()`** xác định xem giá trị được truyền vào có phải là giá trị số {{jsxref("NaN")}} hay không, và trả về `false` nếu đầu vào không thuộc kiểu Number. Đây là phiên bản mạnh mẽ hơn của hàm {{jsxref("isNaN()")}} toàn cục ban đầu.

{{InteractiveExample("JavaScript Demo: Number.isNaN()", "taller")}}

```js interactive-example
function typeOfNaN(x) {
  if (Number.isNaN(x)) {
    return "Number NaN";
  }
  if (isNaN(x)) {
    return "NaN";
  }
}

console.log(typeOfNaN("100F"));
// Expected output: "NaN"

console.log(typeOfNaN(NaN));
// Expected output: "Number NaN"
```

## Cú pháp

```js-nolint
Number.isNaN(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra có phải là {{jsxref("NaN")}} hay không.

### Giá trị trả về

Giá trị boolean `true` nếu giá trị đã cho là số có giá trị {{jsxref("NaN")}}. Ngược lại, `false`.

## Mô tả

Hàm `Number.isNaN()` cung cấp cách thuận tiện để kiểm tra bằng `NaN`. Lưu ý rằng bạn không thể kiểm tra bằng `NaN` sử dụng toán tử [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) hay [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality), vì khác với tất cả các so sánh giá trị khác trong JavaScript, các toán tử này luôn trả về `false` khi một toán hạng là {{jsxref("NaN")}}, ngay cả khi toán hạng còn lại cũng là {{jsxref("NaN")}}.

Vì `x !== x` chỉ đúng với `NaN` trong số tất cả các giá trị JavaScript có thể có, `Number.isNaN(x)` cũng có thể được thay thế bằng kiểm tra `x !== x`, dù cái sau ít dễ đọc hơn.

Trái ngược với hàm {{jsxref("isNaN()")}} toàn cục, phương thức `Number.isNaN()` không ép buộc chuyển đổi tham số sang số. Điều này giúp an toàn khi truyền các giá trị thường sẽ chuyển thành {{jsxref("NaN")}} nhưng thực ra không phải cùng giá trị với {{jsxref("NaN")}}. Điều này cũng có nghĩa là chỉ các giá trị kiểu Number mà cũng là {{jsxref("NaN")}} mới trả về `true`.

## Ví dụ

### Sử dụng isNaN()

```js
Number.isNaN(NaN); // true
Number.isNaN(Number.NaN); // true
Number.isNaN(0 / 0); // true
Number.isNaN(37); // false
```

### Sự khác biệt giữa Number.isNaN() và isNaN() toàn cục

`Number.isNaN()` không cố gắng chuyển đổi tham số sang số, vì vậy các giá trị không phải số luôn trả về `false`. Tất cả những điều sau đây là `false`:

```js
Number.isNaN("NaN");
Number.isNaN(undefined);
Number.isNaN({});
Number.isNaN("blabla");
Number.isNaN(true);
Number.isNaN(null);
Number.isNaN("37");
Number.isNaN("37.37");
Number.isNaN("");
Number.isNaN(" ");
```

Hàm {{jsxref("isNaN()")}} toàn cục ép buộc chuyển đổi tham số sang số:

```js
isNaN("NaN"); // true
isNaN(undefined); // true
isNaN({}); // true
isNaN("blabla"); // true
isNaN(true); // false, this is coerced to 1
isNaN(null); // false, this is coerced to 0
isNaN("37"); // false, this is coerced to 37
isNaN("37.37"); // false, this is coerced to 37.37
isNaN(""); // false, this is coerced to 0
isNaN(" "); // false, this is coerced to 0
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.isNaN` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.isNaN`](https://www.npmjs.com/package/number.isnan)
- {{jsxref("Number")}}
- {{jsxref("isNaN()")}}
