---
title: Less than or equal (<=)
slug: Web/JavaScript/Reference/Operators/Less_than_or_equal
page-type: javascript-operator
browser-compat: javascript.operators.less_than_or_equal
sidebar: jssidebar
---

Toán tử **less than or equal (`<=`)** trả về `true` nếu toán hạng bên trái nhỏ hơn hoặc bằng toán hạng bên phải, và `false` trong các trường hợp còn lại.

{{InteractiveExample("JavaScript Demo: Less than or equal (<=) operator")}}

```js interactive-example
console.log(5 <= 3);
// Expected output: false

console.log(3 <= 3);
// Expected output: true

// Compare bigint to number
console.log(3n <= 5);
// Expected output: true

console.log("aa" <= "ab");
// Expected output: true
```

## Cú pháp

```js-nolint
x <= y
```

## Mô tả

Các toán hạng được so sánh bằng cùng thuật toán như toán tử [Less than](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than), với các toán hạng được hoán đổi và kết quả bị phủ định. `x <= y` nhìn chung tương đương với `!(y < x)`, ngoại trừ hai trường hợp mà cả `x <= y` và `x > y` đều là `false`:

- Nếu một trong các toán hạng được chuyển đổi thành BigInt, trong khi toán hạng kia được chuyển đổi thành một string không thể chuyển đổi thành giá trị BigInt (nó ném ra [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_BigInt_syntax) khi truyền vào [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt)).
- Nếu một trong các toán hạng được chuyển đổi thành `NaN`. (Ví dụ: string không thể chuyển đổi thành số, hoặc `undefined`.)

Ngoài ra, `x <= y` ép kiểu `x` sang kiểu primitive trước `y`, trong khi `y < x` ép kiểu `y` sang kiểu primitive trước `x`. Vì việc ép kiểu có thể có tác dụng phụ, thứ tự của các toán hạng có thể quan trọng.

`x <= y` nhìn chung tương đương với `x < y || x == y`, ngoại trừ một vài trường hợp:

- Khi một trong `x` hoặc `y` là `null`, và giá trị kia là thứ gì đó không phải `null` và trở thành 0 khi [ép kiểu sang numeric](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) (bao gồm `0`, `0n`, `false`, `""`, `"0"`, `new Date(0)`, v.v.): `x <= y` là `true`, trong khi `x < y || x == y` là `false`.
- Khi một trong `x` hoặc `y` là `undefined`, và giá trị kia là một trong `null` hoặc `undefined`: `x <= y` là `false`, trong khi `x == y` là `true`.
- Khi `x` và `y` là cùng một object trở thành `NaN` sau bước đầu tiên của [Less than](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than) (chẳng hạn như `new Date(NaN)`): `x <= y` là `false`, trong khi `x == y` là `true`.
- Khi `x` và `y` là các object khác nhau trở thành cùng một giá trị sau bước đầu tiên của [Less than](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than): `x <= y` là `true`, trong khi `x < y || x == y` là `false`.

## Ví dụ

### So sánh string với string

```js
"a" <= "b"; // true
"a" <= "a"; // true
"a" <= "3"; // false
```

### So sánh string với number

```js
"5" <= 3; // false
"3" <= 3; // true
"3" <= 5; // true

"hello" <= 5; // false
5 <= "hello"; // false
```

### So sánh number với number

```js
5 <= 3; // false
3 <= 3; // true
3 <= 5; // true
```

### So sánh number với BigInt

```js
5n <= 3; // false
3 <= 3n; // true
3 <= 5n; // true
```

### So sánh Boolean, null, undefined, NaN

```js
true <= false; // false
true <= true; // true
false <= true; // true

true <= 0; // false
true <= 1; // true

null <= 0; // true
1 <= null; // false

undefined <= 3; // false
3 <= undefined; // false

3 <= NaN; // false
NaN <= 3; // false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Greater than (`>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than)
- [Greater than or equal (`>=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than_or_equal)
- [Less than (`<`)](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than)
