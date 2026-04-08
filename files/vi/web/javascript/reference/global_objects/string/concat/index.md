---
title: String.prototype.concat()
short-title: concat()
slug: Web/JavaScript/Reference/Global_Objects/String/concat
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.concat
sidebar: jsref
---

Phương thức **`concat()`** của các giá trị {{jsxref("String")}} nối các đối số string vào string này và trả về một string mới.

{{InteractiveExample("JavaScript Demo: String.prototype.concat()")}}

```js interactive-example
const str1 = "Hello";
const str2 = "World";

console.log(str1.concat(" ", str2));
// Expected output: "Hello World"

console.log(str2.concat(", ", str1));
// Expected output: "World, Hello"
```

## Cú pháp

```js-nolint
concat(str1)
concat(str1, str2)
concat(str1, str2, /* …, */ strN)
```

### Tham số

- `str1`, …, `strN`
  - : Một hoặc nhiều string để nối vào `str`. Mặc dù về mặt kỹ thuật được phép, gọi `String.prototype.concat()` mà không có đối số là một thao tác vô ích, vì nó không dẫn đến việc sao chép có thể quan sát được (như {{jsxref("Array.prototype.concat()")}}), vì string là bất biến. Nó chỉ nên xảy ra nếu bạn đang [trải rộng](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) một mảng string như đối số, và mảng đó xảy ra rỗng.

### Giá trị trả về

Một string mới chứa văn bản kết hợp của các string được cung cấp.

## Mô tả

Hàm `concat()` nối các đối số string vào string gọi và trả về một string mới.

Nếu các đối số không phải là kiểu string, chúng được chuyển đổi thành giá trị string trước khi nối.

Phương thức `concat()` rất giống với [toán tử cộng/nối string](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) (`+`, `+=`), ngoại trừ việc `concat()` [ép kiểu đối số trực tiếp thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), trong khi phép cộng ép kiểu toán hạng thành primitive trước. Để biết thêm thông tin, xem trang tham chiếu cho [toán tử `+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition).

## Ví dụ

### Sử dụng concat()

Ví dụ sau kết hợp các string thành một string mới.

```js
const hello = "Hello, ";
console.log(hello.concat("Kevin", ". Have a nice day."));
// Hello, Kevin. Have a nice day.

const greetList = ["Hello", " ", "Venkat", "!"];
"".concat(...greetList); // "Hello Venkat!"

"".concat({}); // "[object Object]"
"".concat([]); // ""
"".concat(null); // "null"
"".concat(true); // "true"
"".concat(4, 5); // "45"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Array.prototype.concat()")}}
- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
