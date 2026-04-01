---
title: String.prototype.includes()
short-title: includes()
slug: Web/JavaScript/Reference/Global_Objects/String/includes
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.includes
sidebar: jsref
---

Phương thức **`includes()`** của các giá trị {{jsxref("String")}} thực hiện tìm kiếm phân biệt chữ hoa chữ thường để xác định xem một string đã cho có thể được tìm thấy trong string này hay không, trả về `true` hoặc `false` tùy trường hợp.

{{InteractiveExample("JavaScript Demo: String.prototype.includes()", "shorter")}}

```js interactive-example
const sentence = "The quick brown fox jumps over the lazy dog.";

const word = "fox";

console.log(
  `The word "${word}" ${
    sentence.includes(word) ? "is" : "is not"
  } in the sentence`,
);
// Expected output: "The word "fox" is in the sentence"
```

## Cú pháp

```js-nolint
includes(searchString)
includes(searchString, position)
```

### Tham số

- `searchString`
  - : Một string cần tìm trong `str`. Không thể [là regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes). Tất cả các giá trị không phải regex được [ép kiểu thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua hoặc truyền `undefined` khiến `includes()` tìm kiếm string `"undefined"`, điều này hiếm khi bạn muốn.
- `position` {{optional_inline}}
  - : Vị trí trong string bắt đầu tìm kiếm `searchString`. (Mặc định là `0`.)

### Giá trị trả về

**`true`** nếu search string được tìm thấy ở bất kỳ đâu trong string đã cho, bao gồm khi `searchString` là string rỗng; ngược lại là **`false`**.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `searchString` [là regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes).

## Mô tả

Phương thức này cho phép bạn xác định xem một string có bao gồm một string khác hay không.

### Phân biệt chữ hoa chữ thường

Phương thức `includes()` phân biệt chữ hoa chữ thường. Ví dụ, biểu thức sau trả về `false`:

```js
"Blue Whale".includes("blue"); // returns false
```

Bạn có thể giải quyết vấn đề này bằng cách chuyển đổi cả string gốc và search string thành chữ thường:

```js
"Blue Whale".toLowerCase().includes("blue"); // returns true
```

## Ví dụ

### Sử dụng includes()

```js
const str = "To be, or not to be, that is the question.";

console.log(str.includes("To be")); // true
console.log(str.includes("question")); // true
console.log(str.includes("nonexistent")); // false
console.log(str.includes("To be", 1)); // false
console.log(str.includes("TO BE")); // false
console.log(str.includes("")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.includes` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.includes`](https://www.npmjs.com/package/string.prototype.includes)
- {{jsxref("Array.prototype.includes()")}}
- {{jsxref("TypedArray.prototype.includes()")}}
- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
- {{jsxref("String.prototype.startsWith()")}}
- {{jsxref("String.prototype.endsWith()")}}
