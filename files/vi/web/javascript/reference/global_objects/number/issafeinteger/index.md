---
title: Number.isSafeInteger()
short-title: isSafeInteger()
slug: Web/JavaScript/Reference/Global_Objects/Number/isSafeInteger
page-type: javascript-static-method
browser-compat: javascript.builtins.Number.isSafeInteger
sidebar: jsref
---

Phương thức tĩnh **`Number.isSafeInteger()`** xác định xem giá trị được cung cấp có phải là một số là _số nguyên an toàn_ hay không.

{{InteractiveExample("JavaScript Demo: Number.isSafeInteger()")}}

```js interactive-example
function warn(x) {
  if (Number.isSafeInteger(x)) {
    return "Precision safe.";
  }
  return "Precision may be lost!";
}

console.log(warn(2 ** 53));
// Expected output: "Precision may be lost!"

console.log(warn(2 ** 53 - 1));
// Expected output: "Precision safe."
```

## Cú pháp

```js-nolint
Number.isSafeInteger(testValue)
```

### Tham số

- `testValue`
  - : Giá trị cần kiểm tra xem có phải là số nguyên an toàn hay không.

### Giá trị trả về

Giá trị boolean `true` nếu giá trị đã cho là một số là số nguyên an toàn. Ngược lại là `false`.

## Mô tả

Các số nguyên an toàn bao gồm tất cả các số nguyên từ -(2<sup>53</sup> - 1) đến 2<sup>53</sup> - 1, bao gồm cả hai đầu (±9.007.199.254.740.991). Một số nguyên an toàn là số nguyên:

- có thể được biểu diễn chính xác dưới dạng số dấu phẩy động độ chính xác đôi IEEE-754, và
- biểu diễn IEEE-754 của nó không thể là kết quả làm tròn của bất kỳ số nguyên nào khác để phù hợp với biểu diễn IEEE-754.

Ví dụ, 2<sup>53</sup> - 1 là số nguyên an toàn: nó có thể được biểu diễn chính xác, và không có số nguyên nào khác làm tròn đến nó trong bất kỳ chế độ làm tròn IEEE-754 nào. Ngược lại, 2<sup>53</sup> _không_ phải là số nguyên an toàn: nó có thể được biểu diễn chính xác trong IEEE-754, nhưng số nguyên 2<sup>53</sup> + 1 không thể được biểu diễn trực tiếp trong IEEE-754 mà thay vào đó làm tròn đến 2<sup>53</sup> trong chế độ làm tròn về gần nhất và làm tròn về không.

Xử lý các giá trị lớn hơn hoặc nhỏ hơn ~9 nghìn tỷ với độ chính xác đầy đủ yêu cầu sử dụng [thư viện số học độ chính xác tùy ý](https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic). Xem [What Every Programmer Needs to Know about Floating Point Arithmetic](https://floating-point-gui.de/) để biết thêm thông tin về biểu diễn dấu phẩy động của các số.

Với các số nguyên lớn hơn, hãy cân nhắc sử dụng kiểu {{jsxref("BigInt")}}.

## Ví dụ

### Sử dụng isSafeInteger()

```js
Number.isSafeInteger(3); // true
Number.isSafeInteger(2 ** 53); // false
Number.isSafeInteger(2 ** 53 - 1); // true
Number.isSafeInteger(NaN); // false
Number.isSafeInteger(Infinity); // false
Number.isSafeInteger("3"); // false
Number.isSafeInteger(3.1); // false
Number.isSafeInteger(3.0); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.isSafeInteger` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.isSafeInteger`](https://www.npmjs.com/package/number.issafeinteger)
- {{jsxref("Number")}}
- {{jsxref("Number.MIN_SAFE_INTEGER")}}
- {{jsxref("Number.MAX_SAFE_INTEGER")}}
- {{jsxref("BigInt")}}
