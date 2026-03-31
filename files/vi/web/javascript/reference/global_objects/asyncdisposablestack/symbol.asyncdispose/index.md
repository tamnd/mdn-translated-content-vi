---
title: AsyncDisposableStack.prototype[Symbol.asyncDispose]()
short-title: "[Symbol.asyncDispose]()"
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/Symbol.asyncDispose
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncDisposableStack.@@asyncDispose
sidebar: jsref
---

Phương thức **`[Symbol.asyncDispose]()`** của các instance {{jsxref("AsyncDisposableStack")}} triển khai _giao thức async disposable_ và cho phép nó bị hủy khi dùng với {{jsxref("Statements/await_using", "await using")}}. Đây là bí danh của phương thức {{jsxref("AsyncDisposableStack/disposeAsync", "disposeAsync()")}}.

## Cú pháp

```js-nolint
asyncDisposableStack[Symbol.asyncDispose]()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Khai báo một ngăn xếp với `await using`

Phương thức `Symbol.asyncDispose` được thiết kế để tự động được gọi trong khai báo `await using`.

```js
async function doSomething() {
  await using disposer = new AsyncDisposableStack();
  const resource = disposer.use(new Resource());
  resource.doSomething();
  // disposer is disposed here immediately before the function exits
  // which causes the resource to be disposed
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("AsyncDisposableStack")}}
- {{jsxref("AsyncDisposableStack.prototype.disposeAsync()")}}
