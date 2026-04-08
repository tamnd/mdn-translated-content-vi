---
title: Number.MIN_VALUE
short-title: MIN_VALUE
slug: Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Number.MIN_VALUE
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Number.MIN_VALUE`** biểu diễn giá trị số dương nhỏ nhất có thể biểu diễn trong JavaScript.

{{InteractiveExample("JavaScript Demo: Number.MIN_VALUE")}}

```js interactive-example
function divide(x, y) {
  if (x / y < Number.MIN_VALUE) {
    return "Process as 0";
  }
  return x / y;
}

console.log(divide(5e-324, 1));
// Expected output: 5e-324

console.log(divide(5e-324, 2));
// Expected output: "Process as 0"
```

## Giá trị

2<sup>-1074</sup>, hay `5E-324`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`Number.MIN_VALUE` là số dương nhỏ nhất (không phải số âm lớn nhất) có thể biểu diễn trong độ chính xác dấu phẩy động — nói cách khác, số gần nhất với 0. Đặc tả ECMAScript không định nghĩa một giá trị chính xác mà các triển khai phải hỗ trợ — thay vào đó đặc tả nói, _"phải là giá trị dương khác không nhỏ nhất có thể thực sự được biểu diễn bởi triển khai"_. Điều này là do các số dấu phẩy động IEEE-754 nhỏ là [dưới chuẩn](https://en.wikipedia.org/wiki/Subnormal_number), nhưng các triển khai không bắt buộc phải hỗ trợ biểu diễn này, trong trường hợp đó `Number.MIN_VALUE` có thể lớn hơn.

Trong thực tế, giá trị chính xác của nó trong các engine phổ biến như V8 (dùng bởi Chrome, Edge, Node.js), SpiderMonkey (dùng bởi Firefox), và JavaScriptCore (dùng bởi Safari) là 2<sup>-1074</sup>, hay `5E-324`.

Vì `MIN_VALUE` là thuộc tính tĩnh của {{jsxref("Number")}}, bạn luôn sử dụng nó là `Number.MIN_VALUE`, thay vì là thuộc tính của một giá trị số.

## Ví dụ

### Sử dụng MIN_VALUE

Đoạn mã sau chia hai giá trị số. Nếu kết quả lớn hơn hoặc bằng `MIN_VALUE`, hàm `func1` được gọi; ngược lại, hàm `func2` được gọi.

```js
if (num1 / num2 >= Number.MIN_VALUE) {
  func1();
} else {
  func2();
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.MAX_VALUE")}}
