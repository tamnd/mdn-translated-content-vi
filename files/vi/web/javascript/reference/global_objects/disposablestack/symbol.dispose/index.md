---
title: DisposableStack.prototype[Symbol.dispose]()
short-title: "[Symbol.dispose]()"
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/Symbol.dispose
page-type: javascript-instance-method
browser-compat: javascript.builtins.DisposableStack.@@dispose
sidebar: jsref
---

Phương thức **`[Symbol.dispose]()`** của các instance {{jsxref("DisposableStack")}} triển khai _giao thức disposable_ và cho phép nó bị hủy khi dùng với {{jsxref("Statements/using", "using")}} hoặc {{jsxref("Statements/await_using", "await using")}}. Đây là bí danh của phương thức {{jsxref("DisposableStack/dispose", "dispose()")}}.

## Cú pháp

```js-nolint
disposableStack[Symbol.dispose]()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Khai báo một ngăn xếp với `using`

Phương thức `Symbol.dispose` được thiết kế để tự động được gọi trong khai báo `using`.

```js
{
  using disposer = new DisposableStack();
  const resource = disposer.use(new Resource());
  resource.doSomething();
  // stack is disposed here immediately before the function exits
  // which causes the resource to be disposed
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("DisposableStack")}}
- {{jsxref("DisposableStack.prototype.dispose()")}}
