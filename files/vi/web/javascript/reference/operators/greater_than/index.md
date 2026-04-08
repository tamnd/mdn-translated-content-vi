---
title: Greater than (>)
slug: Web/JavaScript/Reference/Operators/Greater_than
page-type: javascript-operator
browser-compat: javascript.operators.greater_than
sidebar: jssidebar
---

Toán tử **greater than (`>`)** trả về `true` nếu toán hạng bên trái lớn hơn toán hạng bên phải, và `false` trong các trường hợp còn lại.

{{InteractiveExample("JavaScript Demo: Greater than (>) operator")}}

```js interactive-example
console.log(5 > 3);
// Expected output: true

console.log(3 > 3);
// Expected output: false

// Compare bigint to number
console.log(3n > 5);
// Expected output: false

console.log("ab" > "aa");
// Expected output: true
```

## Cú pháp

```js-nolint
x > y
```

## Mô tả

Các toán hạng được so sánh bằng cùng thuật toán như toán tử [Less than](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than), ngoại trừ hai toán hạng được hoán đổi cho nhau. `x > y` nhìn chung tương đương với `y < x`, ngoại trừ `x > y` ép kiểu `x` sang kiểu primitive trước `y`, trong khi `y < x` ép kiểu `y` sang kiểu primitive trước `x`. Vì việc ép kiểu có thể có tác dụng phụ, thứ tự của các toán hạng có thể quan trọng.

## Ví dụ

### So sánh string với string

```js
"a" > "b"; // false
"a" > "a"; // false
"a" > "3"; // true
```

### So sánh string với number

```js
"5" > 3; // true
"3" > 3; // false
"3" > 5; // false

"hello" > 5; // false
5 > "hello"; // false

"5" > 3n; // true
"3" > 5n; // false
```

### So sánh number với number

```js
5 > 3; // true
3 > 3; // false
3 > 5; // false
```

### So sánh number với BigInt

```js
5n > 3; // true
3 > 5n; // false
```

### So sánh Boolean, null, undefined, NaN

```js
true > false; // true
false > true; // false

true > 0; // true
true > 1; // false

null > 0; // false
1 > null; // true

undefined > 3; // false
3 > undefined; // false

3 > NaN; // false
NaN > 3; // false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Greater than or equal (`>=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than_or_equal)
- [Less than (`<`)](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than)
- [Less than or equal (`<=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than_or_equal)
