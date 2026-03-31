---
title: Logical NOT (!)
slug: Web/JavaScript/Reference/Operators/Logical_NOT
page-type: javascript-operator
browser-compat: javascript.operators.logical_not
sidebar: jssidebar
---

Toán tử **logical NOT (`!`)** (bổ sung logic, phủ định) chuyển đổi true thành false và ngược lại. Thông thường nó được sử dụng với các giá trị boolean (logical). Khi được dùng với các giá trị không phải Boolean, nó trả về `false` nếu toán hạng đơn của nó có thể được chuyển đổi thành `true`; ngược lại, trả về `true`.

{{InteractiveExample("JavaScript Demo: Logical NOT (!) operator", "shorter")}}

```js interactive-example
const a = 3;
const b = -2;

console.log(!(a > 0 || b > 0));
// Expected output: false
```

## Cú pháp

```js-nolint
!x
```

## Mô tả

Trả về `false` nếu toán hạng đơn của nó có thể được chuyển đổi thành `true`; ngược lại, trả về `true`.

Nếu một giá trị có thể được chuyển đổi thành `true`, giá trị đó được gọi là {{Glossary("truthy")}}. Nếu một giá trị có thể được chuyển đổi thành `false`, giá trị đó được gọi là {{Glossary("falsy")}}.

Ví dụ về các biểu thức có thể được chuyển đổi thành false là:

- `null`;
- `NaN`;
- `0`;
- chuỗi rỗng (`""` hoặc `''` hoặc ` `` `);
- `undefined`.

Mặc dù toán tử `!` có thể được sử dụng với các toán hạng không phải giá trị Boolean, nó vẫn có thể được coi là toán tử boolean vì giá trị trả về của nó luôn có thể được chuyển đổi thành [boolean primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type). Để chuyển đổi tường minh giá trị trả về của nó (hoặc bất kỳ biểu thức nào nói chung) sang giá trị boolean tương ứng, hãy sử dụng toán tử NOT kép (`!!`) hoặc constructor {{jsxref("Boolean/Boolean", "Boolean")}}.

## Ví dụ

### Sử dụng NOT

Đoạn code sau đây hiển thị các ví dụ về toán tử `!` (logical NOT).

```js
!true; // !t returns false
!false; // !f returns true
!""; // !f returns true
!"Cat"; // !t returns false
```

### Double NOT (`!!`)

Có thể sử dụng một cặp toán tử NOT liên tiếp để chuyển đổi tường minh bất kỳ giá trị nào thành [boolean primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type) tương ứng. Việc chuyển đổi dựa trên "tính truthy" hoặc "tính falsy" của giá trị (xem {{Glossary("truthy")}} và {{Glossary("falsy")}}).

Cùng một việc chuyển đổi có thể được thực hiện thông qua hàm {{jsxref("Boolean/Boolean", "Boolean()")}}.

```js
!!true; // !!truthy returns true
!!{}; // !!truthy returns true: any object is truthy…
!!new Boolean(false); // … even Boolean objects with a false .valueOf()!
!!false; // !!falsy returns false
!!""; // !!falsy returns false
!!Boolean(false); // !!falsy returns false
```

### Chuyển đổi giữa các NOT

Phép toán sau liên quan đến **boolean**:

```js-nolint
!!bCondition
```

luôn bằng:

```js-nolint
bCondition
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Boolean")}}
- {{Glossary("Truthy")}}
- {{Glossary("Falsy")}}
