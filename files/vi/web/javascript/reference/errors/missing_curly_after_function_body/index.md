---
title: "SyntaxError: missing } after function body"
slug: Web/JavaScript/Reference/Errors/Missing_curly_after_function_body
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing } after function body" xảy ra khi có lỗi cú pháp khi tạo hàm ở đâu đó. Kiểm tra xem các dấu ngoặc nhọn đóng hoặc dấu ngoặc đơn có đúng thứ tự không.

## Thông báo

```plain
SyntaxError: missing } after function body (Firefox)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Có lỗi cú pháp khi tạo hàm ở đâu đó. Đồng thời hãy kiểm tra xem các dấu ngoặc nhọn đóng hoặc dấu ngoặc đơn có đúng thứ tự không. Thụt lề hoặc định dạng code gọn gàng hơn cũng có thể giúp bạn tìm ra vấn đề.

## Ví dụ

### Thiếu dấu ngoặc nhọn đóng

Thường gặp nhất là thiếu dấu ngoặc nhọn trong code hàm của bạn:

```js-nolint example-bad
function charge() {
  if (sunny) {
    useSolarCells();
  } else {
    promptBikeRide();
}
```

Cách đúng là:

```js example-good
function charge() {
  if (sunny) {
    useSolarCells();
  } else {
    promptBikeRide();
  }
}
```

Nó có thể khó phát hiện hơn khi sử dụng [IIFE](/en-US/docs/Glossary/IIFE) hoặc các cấu trúc khác sử dụng nhiều dấu ngoặc đơn và ngoặc nhọn khác nhau.

```js-nolint example-bad
(function () {
  if (Math.random() < 0.01) {
    doSomething();
  }
)();
```

Thường thì thụt lề khác đi hoặc kiểm tra lại thụt lề sẽ giúp phát hiện những lỗi này.

```js example-good
(function () {
  if (Math.random() < 0.01) {
    doSomething();
  }
})();
```

## Xem thêm

- [Hướng dẫn Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
