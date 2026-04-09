---
title: String.prototype.repeat()
short-title: repeat()
slug: Web/JavaScript/Reference/Global_Objects/String/repeat
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.repeat
sidebar: jsref
---

Phương thức **`repeat()`** của các giá trị {{jsxref("String")}} tạo và trả về một chuỗi mới chứa số lượng bản sao được chỉ định của chuỗi này, được nối lại với nhau.

{{InteractiveExample("JavaScript Demo: String.prototype.repeat()", "shorter")}}

```js interactive-example
const mood = "Happy! ";

console.log(`I feel ${mood.repeat(3)}`);
// Expected output: "I feel Happy! Happy! Happy! "
```

## Cú pháp

```js-nolint
repeat(count)
```

### Tham số

- `count`
  - : Một số nguyên trong khoảng từ `0` đến {{jsxref("Number/POSITIVE_INFINITY", "Infinity")}}, cho biết số lần lặp lại chuỗi.

### Giá trị trả về

Một chuỗi mới chứa số lượng bản sao được chỉ định của chuỗi đã cho.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `count` là số âm hoặc nếu `count` vượt quá độ dài chuỗi tối đa.

## Ví dụ

### Sử dụng repeat()

```js
"abc".repeat(-1); // RangeError
"abc".repeat(0); // ''
"abc".repeat(1); // 'abc'
"abc".repeat(2); // 'abcabc'
"abc".repeat(3.5); // 'abcabcabc' (count will be converted to integer)
"abc".repeat(1 / 0); // RangeError

({ toString: () => "abc", repeat: String.prototype.repeat }).repeat(2);
// 'abcabc' (repeat() is a generic method)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.repeat` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.repeat`](https://www.npmjs.com/package/string.prototype.repeat)
- {{jsxref("String.prototype.concat()")}}
