---
title: "Function: length"
short-title: length
slug: Web/JavaScript/Reference/Global_Objects/Function/length
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Function.length
sidebar: jsref
---

Thuộc tính dữ liệu **`length`** của một instance {{jsxref("Function")}} cho biết số lượng tham số mà hàm đó mong đợi.

{{InteractiveExample("JavaScript Demo: Function: length")}}

```js interactive-example
function func1() {}

function func2(a, b) {}

console.log(func1.length);
// Expected output: 0

console.log(func2.length);
// Expected output: 2
```

## Giá trị

Một số.

{{js_property_attributes(0, 0, 1)}}

## Mô tả

Thuộc tính `length` của một đối tượng {{jsxref("Function")}} cho biết hàm đó nhận bao nhiêu đối số, tức là số lượng tham số hình thức:

- Chỉ những tham số đứng trước tham số đầu tiên có [giá trị mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) mới được tính.
- Một [mẫu destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) được tính là một tham số đơn.
- [Tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) không được tính.

Ngược lại, {{jsxref("Functions/arguments/length", "arguments.length")}} là cục bộ của một hàm và cung cấp số lượng đối số thực sự được truyền vào hàm đó.

Bản thân constructor {{jsxref("Function")}} cũng là một đối tượng `Function`. Thuộc tính dữ liệu `length` của nó có giá trị là `1`.

Do các lý do lịch sử, `Function.prototype` tự thân có thể được gọi. Thuộc tính `length` của `Function.prototype` có giá trị là `0`.

## Ví dụ

### Sử dụng function length

```js
console.log(Function.length); // 1

console.log((() => {}).length); // 0
console.log(((a) => {}).length); // 1
console.log(((a, b) => {}).length); // 2 etc.

console.log(((...args) => {}).length);
// 0, rest parameter is not counted

console.log(((a, b = 1, c) => {}).length);
// 1, only parameters before the first one with
// a default value are counted

console.log((({ a, b }, [c, d]) => {}).length);
// 2, destructuring patterns each count as
// a single parameter
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Function")}}
