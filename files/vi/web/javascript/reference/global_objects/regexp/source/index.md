---
title: RegExp.prototype.source
short-title: source
slug: Web/JavaScript/Reference/Global_Objects/RegExp/source
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.source
sidebar: jsref
---

Thuộc tính accessor **`source`** của các instance {{jsxref("RegExp")}} trả về một chuỗi chứa văn bản nguồn của biểu thức chính quy này, không có hai dấu gạch chéo ở cả hai phía hoặc bất kỳ cờ nào.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.source")}}

```js interactive-example
const regex = /fooBar/gi;

console.log(regex.source);
// Expected output: "fooBar"

console.log(new RegExp().source);
// Expected output: "(?:)"

console.log(new RegExp("\n").source === "\\n");
// Expected output: true (starting with ES5)
// Due to escaping
```

## Mô tả

Về mặt khái niệm, thuộc tính `source` là văn bản giữa hai dấu gạch chéo trong literal biểu thức chính quy. Ngôn ngữ yêu cầu chuỗi trả về phải được escape đúng cách, để khi `source` được nối với một dấu gạch chéo ở cả hai đầu, nó sẽ tạo thành một literal regex có thể phân tích cú pháp được. Ví dụ, đối với `new RegExp("/")`, `source` là `\\/`, vì nếu nó tạo ra `/`, literal kết quả sẽ trở thành `///`, đây là chú thích dòng. Tương tự, tất cả [ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators) sẽ được escape vì các _ký tự_ kết thúc dòng sẽ phá vỡ literal regex. Không có yêu cầu nào đối với các ký tự khác, miễn là kết quả có thể phân tích cú pháp được. Đối với biểu thức chính quy rỗng, chuỗi `(?:)` được trả về.

## Ví dụ

### Sử dụng source

```js
const regex = /fooBar/gi;

console.log(regex.source); // "fooBar", doesn't contain /.../ and "gi".
```

### Biểu thức chính quy rỗng và escape

```js
new RegExp().source; // "(?:)"

new RegExp("\n").source === "\\n"; // true, starting with ES5
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp.prototype.flags")}}
