---
title: AsyncDisposableStack() constructor
short-title: AsyncDisposableStack()
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/AsyncDisposableStack
page-type: javascript-constructor
browser-compat: javascript.builtins.AsyncDisposableStack.AsyncDisposableStack
sidebar: jsref
---

Constructor **`AsyncDisposableStack()`** tạo các đối tượng {{jsxref("AsyncDisposableStack")}}.

## Cú pháp

```js-nolint
new AsyncDisposableStack()
```

> [!NOTE]
> `AsyncDisposableStack()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `AsyncDisposableStack` mới.

## Ví dụ

### Tạo một AsyncDisposableStack

```js
const disposer = new AsyncDisposableStack();
disposer.defer(() => console.log("Disposed!"));
await disposer.disposeAsync();
// Logs: Disposed!
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
