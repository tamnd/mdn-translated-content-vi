---
title: Object.is()
short-title: is()
slug: Web/JavaScript/Reference/Global_Objects/Object/is
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.is
sidebar: jsref
---

Phương thức tĩnh **`Object.is()`** xác định xem hai giá trị có phải là [cùng một giá trị](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value_equality_using_object.is) hay không.

{{InteractiveExample("JavaScript Demo: Object.is()")}}

```js interactive-example
console.log(Object.is("1", 1));
// Expected output: false

console.log(Object.is(NaN, NaN));
// Expected output: true

console.log(Object.is(-0, 0));
// Expected output: false

const obj = {};
console.log(Object.is(obj, {}));
// Expected output: false
```

## Cú pháp

```js-nolint
Object.is(value1, value2)
```

### Tham số

- `value1`
  - : Giá trị đầu tiên cần so sánh.
- `value2`
  - : Giá trị thứ hai cần so sánh.

### Giá trị trả về

Một boolean cho biết hai đối số có phải là cùng giá trị hay không.

## Mô tả

`Object.is()` xác định xem hai giá trị có phải là [cùng một giá trị](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value_equality_using_object.is) hay không. Hai giá trị là như nhau nếu một trong các điều kiện sau đúng:

- cả hai đều là {{jsxref("undefined")}}
- cả hai đều là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
- cả hai đều là `true` hoặc cả hai đều là `false`
- cả hai đều là chuỗi có cùng độ dài với cùng ký tự theo cùng thứ tự
- cả hai đều là cùng đối tượng (nghĩa là cả hai giá trị tham chiếu đến cùng đối tượng trong bộ nhớ)
- cả hai đều là [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) với cùng giá trị số
- cả hai đều là [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) tham chiếu đến cùng giá trị symbol
- cả hai đều là số và
  - cả hai đều là `+0`
  - cả hai đều là `-0`
  - cả hai đều là {{jsxref("NaN")}}
  - hoặc cả hai đều khác không, không phải {{jsxref("NaN")}}, và có cùng giá trị

`Object.is()` không tương đương với toán tử [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality). Toán tử `==` áp dụng các ép kiểu khác nhau cho cả hai phía (nếu chúng không cùng kiểu) trước khi kiểm tra bằng nhau (dẫn đến hành vi như `"" == false` là `true`), nhưng `Object.is()` không ép kiểu bất kỳ giá trị nào.

`Object.is()` cũng _không_ tương đương với toán tử [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality). Sự khác biệt duy nhất giữa `Object.is()` và `===` là trong cách xử lý zero có dấu và giá trị `NaN`. Toán tử `===` (và toán tử `==`) coi hai số `-0` và `+0` là bằng nhau, nhưng coi {{jsxref("NaN")}} là không bằng nhau.

## Ví dụ

### Sử dụng Object.is()

```js
// Trường hợp 1: Kết quả giống với sử dụng ===
Object.is(25, 25); // true
Object.is("foo", "foo"); // true
Object.is("foo", "bar"); // false
Object.is(null, null); // true
Object.is(undefined, undefined); // true
Object.is(window, window); // true
Object.is([], []); // false
const foo = { a: 1 };
const bar = { a: 1 };
const sameFoo = foo;
Object.is(foo, foo); // true
Object.is(foo, bar); // false
Object.is(foo, sameFoo); // true

// Trường hợp 2: Zero có dấu
Object.is(0, -0); // false
Object.is(+0, -0); // false
Object.is(-0, -0); // true

// Trường hợp 3: NaN
Object.is(NaN, 0 / 0); // true
Object.is(NaN, Number.NaN); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.is` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.is`](https://www.npmjs.com/package/object.is)
- [Equality comparisons and sameness](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness)
