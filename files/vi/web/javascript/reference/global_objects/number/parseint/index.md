---
title: Number.parseInt()
short-title: parseInt()
slug: Web/JavaScript/Reference/Global_Objects/Number/parseInt
page-type: javascript-static-method
browser-compat: javascript.builtins.Number.parseInt
sidebar: jsref
---

Phương thức tĩnh **`Number.parseInt()`** phân tích cú pháp một đối số chuỗi và trả về một số nguyên theo cơ số hoặc hệ cơ số được chỉ định.

{{InteractiveExample("JavaScript Demo: Number.parseInt()", "taller")}}

```js interactive-example
function roughScale(x, base) {
  const parsed = Number.parseInt(x, base);
  if (Number.isNaN(parsed)) {
    return 0;
  }
  return parsed * 100;
}

console.log(roughScale(" 0xF", 16));
// Expected output: 1500

console.log(roughScale("321", 2));
// Expected output: 0
```

## Cú pháp

```js-nolint
Number.parseInt(string)
Number.parseInt(string, radix)
```

### Tham số

- `string`
  - : Giá trị cần phân tích, [chuyển đổi thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Khoảng trắng đầu chuỗi trong đối số này bị bỏ qua.
- `radix` {{optional_inline}}
  - : Một số nguyên trong khoảng từ `2` đến `36` biểu diễn _cơ số_ (hệ cơ số trong các hệ thống số toán học) của `string`.

    Nếu `radix` là undefined hoặc `0`, nó được giả định là `10` trừ khi số bắt đầu bằng cặp mã đơn vị `0x` hoặc `0X`, trong trường hợp đó cơ số `16` được giả định.

### Giá trị trả về

Một số nguyên được phân tích từ `string` đã cho.

Nếu `radix` nhỏ hơn `2` hoặc lớn hơn `36`, hoặc ký tự đầu tiên không phải khoảng trắng không thể chuyển đổi thành số, {{jsxref("NaN")}} được trả về.

## Ví dụ

### Number.parseInt so với parseInt

Phương thức này có cùng chức năng với hàm {{jsxref("parseInt()")}} toàn cục:

```js
Number.parseInt === parseInt; // true
```

Mục đích của nó là mô-đun hóa các hàm toàn cục. Xem {{jsxref("parseInt()")}} để biết thêm chi tiết và ví dụ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.parseInt` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.parseInt`](https://www.npmjs.com/package/number.parseInt)
- {{jsxref("Number")}}
- {{jsxref("parseInt()")}}
