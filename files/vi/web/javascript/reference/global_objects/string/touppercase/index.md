---
title: String.prototype.toUpperCase()
short-title: toUpperCase()
slug: Web/JavaScript/Reference/Global_Objects/String/toUpperCase
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.toUpperCase
sidebar: jsref
---

Phương thức **`toUpperCase()`** của các giá trị {{jsxref("String")}} trả về chuỗi này được chuyển đổi sang chữ hoa.

{{InteractiveExample("JavaScript Demo: String.prototype.toUpperCase()", "shorter")}}

```js interactive-example
const sentence = "The quick brown fox jumps over the lazy dog.";

console.log(sentence.toUpperCase());
// Expected output: "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
```

## Cú pháp

```js-nolint
toUpperCase()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mới biểu diễn chuỗi gọi được chuyển đổi sang chữ hoa.

## Mô tả

Phương thức `toUpperCase()` trả về giá trị của chuỗi được chuyển đổi sang chữ hoa. Phương thức này không ảnh hưởng đến giá trị của bản thân chuỗi vì chuỗi trong JavaScript là bất biến.

## Ví dụ

### Sử dụng cơ bản

```js
console.log("alphabet".toUpperCase()); // 'ALPHABET'
```

### Chuyển đổi giá trị `this` không phải chuỗi thành chuỗi

Phương thức này sẽ chuyển đổi bất kỳ giá trị không phải chuỗi nào thành chuỗi, khi bạn đặt `this` là một giá trị không phải chuỗi:

```js
const a = String.prototype.toUpperCase.call({
  toString() {
    return "abcdef";
  },
});

const b = String.prototype.toUpperCase.call(true);

// prints out 'ABCDEF TRUE'.
console.log(a, b);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.toLocaleLowerCase()")}}
- {{jsxref("String.prototype.toLocaleUpperCase()")}}
- {{jsxref("String.prototype.toLowerCase()")}}
