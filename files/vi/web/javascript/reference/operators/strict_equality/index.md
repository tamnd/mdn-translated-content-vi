---
title: Strict equality (===)
slug: Web/JavaScript/Reference/Operators/Strict_equality
page-type: javascript-operator
browser-compat: javascript.operators.strict_equality
sidebar: jssidebar
---

Operator **strict equality (`===`)** kiểm tra xem hai toán hạng của nó có bằng nhau không, trả về kết quả Boolean. Không giống như operator [equality](/en-US/docs/Web/JavaScript/Reference/Operators/Equality), operator strict equality luôn coi các toán hạng có kiểu khác nhau là khác nhau.

{{InteractiveExample("JavaScript Demo: Strict equality (===) operator")}}

```js interactive-example
console.log(1 === 1);
// Expected output: true

console.log("hello" === "hello");
// Expected output: true

console.log("1" === 1);
// Expected output: false

console.log(0 === false);
// Expected output: false
```

## Cú pháp

```js-nolint
x === y
```

## Mô tả

Các operator strict equality (`===` và `!==`) cung cấp ngữ nghĩa [IsStrictlyEqual](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#strict_equality_using).

- Nếu các toán hạng có kiểu khác nhau, trả về `false`.
- Nếu cả hai toán hạng là object, trả về `true` chỉ khi chúng tham chiếu đến cùng một object.
- Nếu cả hai toán hạng là `null` hoặc cả hai toán hạng là `undefined`, trả về `true`.
- Nếu một trong các toán hạng là `NaN`, trả về `false`.
- Nếu không, so sánh giá trị của hai toán hạng:
  - Các số phải có cùng giá trị số. `+0` và `-0` được coi là cùng giá trị.
  - Các string phải có cùng ký tự theo cùng thứ tự.
  - Các Boolean phải đều là `true` hoặc đều là `false`.

Sự khác biệt đáng chú ý nhất giữa operator này và operator [equality](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) (`==`) là nếu các toán hạng có kiểu khác nhau, operator `==` cố gắng chuyển đổi chúng về cùng kiểu trước khi so sánh.

## Ví dụ

### So sánh các toán hạng cùng kiểu

```js
"hello" === "hello"; // true
"hello" === "hola"; // false

3 === 3; // true
3 === 4; // false

true === true; // true
true === false; // false

null === null; // true
```

### So sánh các toán hạng khác kiểu

```js
"3" === 3; // false
true === 1; // false
null === undefined; // false
3 === new Number(3); // false
```

### So sánh các object

```js
const object1 = {
  key: "value",
};

const object2 = {
  key: "value",
};

console.log(object1 === object2); // false
console.log(object1 === object1); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Equality (`==`)](/en-US/docs/Web/JavaScript/Reference/Operators/Equality)
- [Inequality (`!=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Inequality)
- [Strict inequality (`!==`)](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality)
