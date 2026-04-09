---
title: String.prototype.startsWith()
short-title: startsWith()
slug: Web/JavaScript/Reference/Global_Objects/String/startsWith
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.startsWith
sidebar: jsref
---

Phương thức **`startsWith()`** của các giá trị {{jsxref("String")}} xác định liệu chuỗi này có bắt đầu bằng các ký tự của một chuỗi được chỉ định không, trả về `true` hoặc `false` tùy theo trường hợp.

{{InteractiveExample("JavaScript Demo: String.prototype.startsWith()")}}

```js interactive-example
const str = "Saturday night plans";

console.log(str.startsWith("Sat"));
// Expected output: true

console.log(str.startsWith("Sat", 3));
// Expected output: false
```

## Cú pháp

```js-nolint
startsWith(searchString)
startsWith(searchString, position)
```

### Tham số

- `searchString`
  - : Các ký tự cần tìm kiếm ở đầu chuỗi này. Không thể [là một regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes). Tất cả các giá trị không phải regex đều được [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua nó hoặc truyền `undefined` khiến `startsWith()` tìm kiếm chuỗi `"undefined"`, điều này hiếm khi là điều bạn muốn.
- `position` {{optional_inline}}
  - : Vị trí bắt đầu mà `searchString` dự kiến được tìm thấy (chỉ số của ký tự đầu tiên của `searchString`). Mặc định là `0`.

### Giá trị trả về

**`true`** nếu các ký tự đã cho được tìm thấy ở đầu chuỗi, bao gồm cả khi `searchString` là một chuỗi rỗng; ngược lại, **`false`**.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `searchString` [là một regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes).

## Mô tả

Phương thức này cho phép bạn xác định liệu một chuỗi có bắt đầu bằng một chuỗi khác hay không. Phương thức này phân biệt hoa thường.

## Ví dụ

### Sử dụng startsWith()

```js
const str = "To be, or not to be, that is the question.";

console.log(str.startsWith("To be")); // true
console.log(str.startsWith("not to be")); // false
console.log(str.startsWith("not to be", 10)); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.startsWith` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.startsWith`](https://www.npmjs.com/package/string.prototype.startswith)
- {{jsxref("String.prototype.endsWith()")}}
- {{jsxref("String.prototype.includes()")}}
- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
