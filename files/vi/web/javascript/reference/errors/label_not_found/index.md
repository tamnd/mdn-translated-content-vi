---
title: "SyntaxError: label not found"
slug: Web/JavaScript/Reference/Errors/Label_not_found
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "label not found" xảy ra khi câu lệnh {{jsxref("Statements/break", "break")}} hoặc {{jsxref("Statements/continue", "continue")}} tham chiếu đến một nhãn không tồn tại trên bất kỳ câu lệnh nào chứa câu lệnh `break` hoặc `continue` đó.

## Thông báo

```plain
SyntaxError: Undefined label 'label' (V8-based)
SyntaxError: label not found (Firefox)
SyntaxError: Cannot use the undeclared label 'label'. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Điều gì đã xảy ra?

Trong JavaScript, [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) rất hạn chế: bạn chỉ có thể sử dụng chúng với câu lệnh {{jsxref("Statements/break", "break")}} và {{jsxref("Statements/continue", "continue")}}, và bạn chỉ có thể nhảy đến chúng từ một câu lệnh được chứa trong câu lệnh có nhãn đó. Bạn không thể nhảy đến nhãn này từ bất kỳ đâu trong chương trình.

## Ví dụ

### Bước nhảy không hợp lệ về cú pháp

Bạn không thể sử dụng nhãn như thể chúng là `goto`.

```js-nolint example-bad
start: console.log("Hello, world!");
console.log("Do it again");
break start;
```

Thay vào đó, bạn chỉ có thể sử dụng nhãn để nâng cao ngữ nghĩa thông thường của câu lệnh `break` và `continue`.

```js example-good
start: {
  console.log("Hello, world!");
  if (Math.random() > 0.5) {
    break start;
  }
  console.log("Maybe I'm logged");
}
```

## Xem thêm

- [Câu lệnh có nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label)
