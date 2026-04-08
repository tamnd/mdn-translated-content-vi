---
title: "TypeError: cannot use 'in' operator to search for 'x' in 'y'"
slug: Web/JavaScript/Reference/Errors/in_operator_no_object
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "right-hand side of 'in' should be an object" xảy ra khi toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) được sử dụng để tìm kiếm trong chuỗi, hoặc trong số, hoặc các kiểu nguyên thủy khác. Nó chỉ có thể được sử dụng để kiểm tra xem một thuộc tính có trong một đối tượng không.

## Thông báo

```plain
TypeError: Cannot use 'in' operator to search for 'x' in 'y' (V8-based & Firefox)
TypeError: right-hand side of 'in' should be an object, got null (Firefox)
TypeError: "y" is not an Object. (evaluating '"x" in "y"') (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) chỉ có thể được sử dụng để kiểm tra xem một thuộc tính có trong một đối tượng không. Bạn không thể tìm kiếm trong chuỗi, hoặc trong số, hoặc các kiểu nguyên thủy khác.

## Ví dụ

### Tìm kiếm trong chuỗi

Không giống như trong các ngôn ngữ lập trình khác (ví dụ: Python), bạn không thể tìm kiếm trong chuỗi bằng toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in).

```js example-bad
"Hello" in "Hello World";
// TypeError: cannot use 'in' operator to search for 'Hello' in 'Hello World'
```

Thay vào đó bạn cần sử dụng {{jsxref("String.prototype.includes()")}}, ví dụ.

```js example-good
"Hello World".includes("Hello");
// true
```

### Toán hạng không thể là null hoặc undefined

Đảm bảo đối tượng bạn đang kiểm tra thực sự không phải là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}.

```js example-bad
const foo = null;
"bar" in foo;
// TypeError: cannot use 'in' operator to search for 'bar' in 'foo' (Chrome)
// TypeError: right-hand side of 'in' should be an object, got null (Firefox)
```

Toán tử `in` luôn mong đợi một đối tượng.

```js example-good
const foo = { baz: "bar" };
"bar" in foo; // false

"PI" in Math; // true
"pi" in Math; // false
```

### Tìm kiếm trong mảng

Hãy cẩn thận khi sử dụng toán tử `in` để tìm kiếm trong các đối tượng {{jsxref("Array")}}. Toán tử `in` kiểm tra số chỉ mục, không phải giá trị tại chỉ mục đó.

```js
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
3 in trees; // true
"oak" in trees; // false
```

## Xem thêm

- [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in)
