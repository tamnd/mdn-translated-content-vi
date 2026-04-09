---
title: String.prototype[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.@@iterator
sidebar: jsref
---

Phương thức **`[Symbol.iterator]()`** của các giá trị {{jsxref("String")}} triển khai [iterable protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép chuỗi được sử dụng bởi hầu hết các cú pháp kỳ vọng iterable, chẳng hạn như [spread syntax](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và các vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về một [string iterator object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) cung cấp các Unicode code points của giá trị chuỗi như các chuỗi riêng lẻ.

{{InteractiveExample("JavaScript Demo: String.prototype[Symbol.iterator]()")}}

```js interactive-example
const str = "The quick red fox jumped over the lazy dog's back.";

const iterator = str[Symbol.iterator]();
let theChar = iterator.next();

while (!theChar.done && theChar.value !== " ") {
  console.log(theChar.value);
  theChar = iterator.next();
  // Expected output: "T"
  //                  "h"
  //                  "e"
}
```

## Cú pháp

```js-nolint
string[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Một [iterable iterator object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới cung cấp các Unicode code points của giá trị chuỗi như các chuỗi riêng lẻ.

## Mô tả

Chuỗi được lặp qua theo các Unicode code points. Điều này có nghĩa là các grapheme clusters sẽ bị tách, nhưng các surrogate pairs sẽ được giữ nguyên.

```js
// "Backhand Index Pointing Right: Dark Skin Tone"
[..."👉🏿"]; // ['👉', '🏿']
// tách thành emoji "Backhand Index Pointing Right" cơ bản và
// emoji "Dark skin tone"

// "Family: Man, Boy"
[..."👨‍👦"]; // [ '👨', '‍', '👦' ]
// tách thành emoji "Man" và "Boy", nối bằng ZWJ
```

## Ví dụ

### Lặp qua bằng vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` làm cho chuỗi [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp lặp như vòng lặp `for...of` tự động gọi phương thức này để lấy iterator để lặp qua.

```js
const str = "A\uD835\uDC68B\uD835\uDC69C\uD835\uDC6A";

for (const v of str) {
  console.log(v);
}
// "A"
// "\uD835\uDC68"
// "B"
// "\uD835\uDC69"
// "C"
// "\uD835\uDC6A"
```

### Tự điều khiển iterator thủ công

Bạn vẫn có thể gọi thủ công phương thức `next()` của đối tượng iterator được trả về để đạt được kiểm soát tối đa quá trình lặp.

```js
const str = "A\uD835\uDC68";

const strIter = str[Symbol.iterator]();

console.log(strIter.next().value); // "A"
console.log(strIter.next().value); // "\uD835\uDC68"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype[Symbol.iterator]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- Hướng dẫn [Numbers and strings](/en-US/docs/Web/JavaScript/Guide/Numbers_and_strings)
- {{jsxref("Symbol.iterator")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
