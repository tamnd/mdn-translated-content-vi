---
title: DisposableStack() constructor
short-title: DisposableStack()
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/DisposableStack
page-type: javascript-constructor
browser-compat: javascript.builtins.DisposableStack.DisposableStack
sidebar: jsref
---

Constructor **`DisposableStack()`** tạo các đối tượng {{jsxref("DisposableStack")}}.

## Cú pháp

```js-nolint
new DisposableStack()
```

> [!NOTE]
> `DisposableStack()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `DisposableStack` mới.

## Ví dụ

### Tạo một DisposableStack

```js
const disposer = new DisposableStack();
disposer.defer(() => console.log("Disposed!"));
disposer.dispose();
// Logs: Disposed!
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
