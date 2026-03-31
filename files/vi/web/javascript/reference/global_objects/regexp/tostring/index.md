---
title: RegExp.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/RegExp/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("RegExp")}} trả về một chuỗi biểu diễn biểu thức chính quy này.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.toString()", "taller")}}

```js interactive-example
console.log(new RegExp("a+b+c"));
// Expected output: /a+b+c/

console.log(new RegExp("a+b+c").toString());
// Expected output: "/a+b+c/"

console.log(new RegExp("bar", "g").toString());
// Expected output: "/bar/g"

console.log(new RegExp("\n", "g").toString());
// Expected output: "/\n/g"

console.log(new RegExp("\\n", "g").toString());
// Expected output: "/\n/g"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn đối tượng đã cho.

## Mô tả

Đối tượng {{jsxref("RegExp")}} ghi đè phương thức `toString()` của đối tượng {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString()")}}. Đối với các đối tượng {{jsxref("RegExp")}}, phương thức `toString()` trả về biểu diễn chuỗi của biểu thức chính quy.

Trong thực tế, nó đọc các thuộc tính [`source`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) và [`flags`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/flags) của regex và trả về chuỗi theo dạng `/source/flags`. Giá trị trả về của `toString()` được đảm bảo là một literal regex có thể phân tích cú pháp được, mặc dù nó có thể không phải là đúng cùng văn bản với những gì ban đầu được chỉ định cho regex (ví dụ: các cờ có thể được sắp xếp lại).

## Ví dụ

### Sử dụng toString()

Ví dụ sau hiển thị giá trị chuỗi của đối tượng {{jsxref("RegExp")}}:

```js
const myExp = new RegExp("a+b+c");
console.log(myExp.toString()); // '/a+b+c/'

const foo = new RegExp("bar", "g");
console.log(foo.toString()); // '/bar/g'
```

### Biểu thức chính quy rỗng và escape

Vì `toString()` truy cập thuộc tính [`source`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source), một biểu thức chính quy rỗng trả về chuỗi `"/(?:)/"`, và các ký tự kết thúc dòng như `\n` được escape. Điều này làm cho giá trị trả về luôn là một literal regex hợp lệ.

```js
new RegExp().toString(); // "/(?:)/"

new RegExp("\n").toString() === "/\\n/"; // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}
