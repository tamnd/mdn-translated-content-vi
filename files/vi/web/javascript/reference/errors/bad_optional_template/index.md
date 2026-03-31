---
title: "SyntaxError: tagged template cannot be used with optional chain"
slug: Web/JavaScript/Reference/Errors/Bad_optional_template
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "tagged template cannot be used with optional chain" xảy ra khi biểu thức tag của một [tagged template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates) là một [optional chain](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining), hoặc nếu có optional chain giữa tag và template.

## Thông báo

```plain
SyntaxError: Invalid tagged template on optional chain (V8-based)
SyntaxError: tagged template cannot be used with optional chain (Firefox)
SyntaxError: Cannot use tagged templates in an optional chain. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Có hai cách để gặp lỗi này. Cách thứ nhất là khi biểu thức tag là một biểu thức optional chain, như sau:

```js-nolint example-bad
String?.raw`Hello, world!`;
console.log?.()`Hello, world!`;
Number?.[parseMethod]`Hello, world!`;
```

Cách thứ hai là khi `?.` xuất hiện giữa tag và template, như sau:

```js-nolint example-bad
String.raw?.`Hello, world!`;
```

Optional chaining trong tag bị cấm cụ thể vì không có trường hợp sử dụng tốt cho nó, và kết quả mong đợi là không rõ ràng (nên là `undefined` hay giá trị của template như khi không có tag?). Bạn cần dịch optional chaining sang điều kiện cơ bản (xem [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) để biết thêm thông tin).

```js example-good
const result =
  String.raw === null || String.raw === undefined
    ? undefined
    : String.raw`Hello, world!`;
```

Hãy nhớ rằng optional chaining chỉ short-circuit trong một đơn vị có ngoặc. Nếu bạn đặt biểu thức tag trong ngoặc, optional chaining sẽ không gây ra lỗi, vì bây giờ tag không short-circuit và kết quả là rõ ràng (tag sẽ tạo ra `undefined` và sau đó khiến tagged template ném lỗi).

```js-nolint
(console?.log)`Hello, world!`; // Throws if console?.log is undefined
```

Tuy nhiên điều này có phần vô nghĩa vì optional chaining ngăn các lỗi bên trong chuỗi truy cập thuộc tính, nhưng sau đó được đảm bảo tạo ra lỗi khi gọi template tag. Bạn có thể vẫn muốn sử dụng kiểm tra điều kiện.

Lưu ý rằng optional chaining chỉ bị cấm như biểu thức tag. Bạn có thể sử dụng optional chaining bên trong các biểu thức nhúng, hoặc sử dụng optional chaining trên toàn bộ biểu thức tagged template.

```js example-good
console.log`Hello, ${true.constructor?.name}!`; // ['Hello, ', '!', raw: Array(2)] 'Boolean'
console.log`Hello`?.toString(); // undefined
```

## Xem thêm

- [Template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals)
- [Optional chaining (`?.`)](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)
- [Original discussion on whether optional chaining should be allowed in tagged template literals](https://github.com/tc39/proposal-optional-chaining/issues/54)
