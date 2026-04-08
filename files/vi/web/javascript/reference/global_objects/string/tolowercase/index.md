---
title: String.prototype.toLowerCase()
short-title: toLowerCase()
slug: Web/JavaScript/Reference/Global_Objects/String/toLowerCase
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.toLowerCase
sidebar: jsref
---

Phương thức **`toLowerCase()`** của các giá trị {{jsxref("String")}} trả về chuỗi này được chuyển đổi sang chữ thường.

{{InteractiveExample("JavaScript Demo: String.prototype.toLowerCase()", "shorter")}}

```js interactive-example
const sentence = "The quick brown fox jumps over the lazy dog.";

console.log(sentence.toLowerCase());
// Expected output: "the quick brown fox jumps over the lazy dog."
```

## Cú pháp

```js-nolint
toLowerCase()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mới biểu diễn chuỗi gọi được chuyển đổi sang chữ thường.

## Mô tả

Phương thức `toLowerCase()` trả về giá trị của chuỗi được chuyển đổi sang chữ thường. `toLowerCase()` không ảnh hưởng đến giá trị của bản thân chuỗi `str`.

## Ví dụ

### Sử dụng `toLowerCase()`

```js
console.log("ALPHABET".toLowerCase()); // 'alphabet'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.toLocaleLowerCase()")}}
- {{jsxref("String.prototype.toLocaleUpperCase()")}}
- {{jsxref("String.prototype.toUpperCase()")}}
