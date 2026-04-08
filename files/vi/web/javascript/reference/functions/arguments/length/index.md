---
title: arguments.length
short-title: length
slug: Web/JavaScript/Reference/Functions/arguments/length
page-type: javascript-instance-data-property
browser-compat: javascript.functions.arguments.length
sidebar: jssidebar
---

Thuộc tính dữ liệu **`arguments.length`** chứa số lượng đối số được truyền cho hàm.

## Giá trị

Một số nguyên không âm.

{{js_property_attributes(1, 0, 1)}}

## Mô tả

Thuộc tính `arguments.length` cung cấp số lượng đối số thực sự được truyền cho hàm. Điều này có thể nhiều hơn hoặc ít hơn số lượng tham số được định nghĩa (xem {{jsxref("Function.prototype.length")}}). Ví dụ, đối với hàm dưới đây:

```js
function func1(a, b, c) {
  console.log(arguments.length);
}
```

`func1.length` trả về `3`, vì `func1` khai báo ba tham số hình thức. Tuy nhiên, `func1(1, 2, 3, 4, 5)` in ra `5`, vì `func1` được gọi với năm đối số. Tương tự, `func1(1)` in ra `1`, vì `func1` được gọi với một đối số.

## Ví dụ

### Sử dụng arguments.length

Trong ví dụ này, chúng ta định nghĩa một hàm có thể cộng hai hoặc nhiều số lại với nhau.

```js
function adder(base /*, num1, …, numN */) {
  base = Number(base);
  for (let i = 1; i < arguments.length; i++) {
    base += Number(arguments[i]);
  }
  return base;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Functions/arguments", "arguments")}}
- [`Function`: `length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length)
