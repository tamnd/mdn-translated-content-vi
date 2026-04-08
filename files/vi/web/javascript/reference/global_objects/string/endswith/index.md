---
title: String.prototype.endsWith()
short-title: endsWith()
slug: Web/JavaScript/Reference/Global_Objects/String/endsWith
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.endsWith
sidebar: jsref
---

Phương thức **`endsWith()`** của các giá trị {{jsxref("String")}} xác định xem một string có kết thúc bằng các ký tự của string này hay không, trả về `true` hoặc `false` tùy trường hợp.

{{InteractiveExample("JavaScript Demo: String.prototype.endsWith()")}}

```js interactive-example
const str1 = "Cats are the best!";

console.log(str1.endsWith("best!"));
// Expected output: true

console.log(str1.endsWith("best", 17));
// Expected output: true

const str2 = "Is this a question?";

console.log(str2.endsWith("question"));
// Expected output: false
```

## Cú pháp

```js-nolint
endsWith(searchString)
endsWith(searchString, endPosition)
```

### Tham số

- `searchString`
  - : Các ký tự cần tìm kiếm ở cuối `str`. Không thể [là regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes). Tất cả các giá trị không phải regex được [ép kiểu thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua hoặc truyền `undefined` khiến `endsWith()` tìm kiếm string `"undefined"`, điều này hiếm khi bạn muốn.
- `endPosition` {{optional_inline}}
  - : Vị trí kết thúc mà `searchString` dự kiến được tìm thấy (chỉ mục của ký tự cuối cùng của `searchString` cộng 1). Mặc định là `str.length`.

### Giá trị trả về

**`true`** nếu các ký tự đã cho được tìm thấy ở cuối string, bao gồm khi `searchString` là string rỗng; ngược lại là **`false`**.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `searchString` [là regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes).

## Mô tả

Phương thức này cho phép bạn xác định xem một string có kết thúc bằng một string khác hay không. Phương thức này phân biệt chữ hoa chữ thường.

## Ví dụ

### Sử dụng endsWith()

```js
const str = "To be, or not to be, that is the question.";

console.log(str.endsWith("question.")); // true
console.log(str.endsWith("to be")); // false
console.log(str.endsWith("to be", 19)); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.endsWith` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.endsWith`](https://www.npmjs.com/package/string.prototype.endswith)
- {{jsxref("String.prototype.startsWith()")}}
- {{jsxref("String.prototype.includes()")}}
- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
