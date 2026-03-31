---
title: "SyntaxError: functions cannot be labelled"
slug: Web/JavaScript/Reference/Errors/Function_label
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "functions cannot be labelled" xảy ra khi một khai báo {{jsxref("Statements/function", "function")}} có một [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) đứng trước nó.

## Thông báo

```plain
SyntaxError: In non-strict mode code, functions can only be declared at top level, inside a block, or as the body of an if statement. (V8-based)
SyntaxError: In strict mode code, functions can only be declared at top level or inside a block. (V8-based)
SyntaxError: Generators can only be declared at the top level or inside a block. (V8-based)
SyntaxError: Async functions can only be declared at the top level or inside a block. (V8-based)

SyntaxError: functions can only be labelled inside blocks (Firefox)
SyntaxError: functions cannot be labelled (Firefox)
SyntaxError: generator functions cannot be labelled (Firefox)
SyntaxError: async function declarations can't appear in single-statement context (Firefox)

SyntaxError: Unexpected keyword 'function'. Function declarations are only allowed inside block statements or at the top level of a program. (Safari)
SyntaxError: Function declarations are only allowed inside blocks or switch statements in strict mode. (Safari)
SyntaxError: Unexpected token '*'. Cannot use generator function declaration in single-statement context. (Safari)
SyntaxError: Unexpected keyword 'function'. Cannot use async function declaration in single-statement context. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Khai báo hàm không bao giờ được gắn nhãn, vì nhãn chỉ áp dụng cho các câu lệnh, không phải khai báo. Không có cách nào để thực sự nhảy đến nhãn này. Tuy nhiên, do một số quy tắc cú pháp JavaScript cũ, điều kiện lỗi phức tạp hơn mức cần thiết:

- Trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode), khai báo hàm không bao giờ được phép gắn nhãn.
- Trong chế độ không nghiêm ngặt, khai báo hàm được phép gắn nhãn, nhưng không được phép khi hàm là câu lệnh duy nhất của một câu lệnh `if` (bản thân điều này cũng là tính năng đã bị loại bỏ).
- Hàm bất đồng bộ (async), hàm generator và hàm generator bất đồng bộ không bao giờ được phép gắn nhãn.

Thông báo lỗi có thể nói đại ý "vị trí không hợp lệ để khai báo hàm xuất hiện", vì khi trình phân tích cú pháp thấy một nhãn, nó mong đợi một câu lệnh tiếp theo, và khai báo hàm không phải là một câu lệnh. Điều này phụ thuộc vào việc lỗi nhìn nhận theo góc độ một nhãn không thể đứng trước hàm, hay một hàm không thể đứng sau nhãn.

## Ví dụ

### Nhầm lẫn với object literal

Mặc dù có thể bạn thực sự muốn nhãn thực hiện _điều gì đó_ như là đích nhảy tới, nhưng thông thường bạn không có ý định đó. Trường hợp phổ biến nhất là bạn thực sự muốn nó là một khóa thuộc tính trong một object literal:

```js-nolint example-bad
const createObj = () => {
  greet: function greet() { // SyntaxError: functions cannot be labelled
    console.log("Hello");
  }
};
```

Ở đây, `{...}` thực ra không phải là một object literal, mà là thân khối của [hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), vì vậy `greet:` trở thành một nhãn. Để sửa lỗi này, bạn cần bọc object literal trong dấu ngoặc đơn:

```js-nolint example-good
const createObj = () => ({
  greet: function greet() {
    console.log("Hello");
  },
});
```

Bạn cũng có thể muốn sử dụng [cú pháp phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) cho object literal, cách này tránh được vấn đề trên:

```js example-good
const createObj = () => ({
  greet() {
    console.log("Hello");
  },
});
```

## Xem thêm

- [Câu lệnh có nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label)
- {{jsxref("Statements/function", "function")}}
- [Chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- [Các tính năng đã bị loại bỏ và lỗi thời](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features)
