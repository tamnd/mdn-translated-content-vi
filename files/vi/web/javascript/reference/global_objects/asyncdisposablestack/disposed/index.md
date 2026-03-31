---
title: AsyncDisposableStack.prototype.disposed
short-title: disposed
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/disposed
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.AsyncDisposableStack.disposed
sidebar: jsref
---

Thuộc tính accessor **`disposed`** của các instance {{jsxref("AsyncDisposableStack")}} trả về một boolean cho biết liệu `AsyncDisposableStack` này đã bị hủy hoặc chuyển hay chưa bằng cách thực hiện một trong những hành động sau:

- Gọi phương thức {{jsxref("AsyncDisposableStack/disposeAsync", "disposeAsync()")}} của nó
- Gọi phương thức {{jsxref("AsyncDisposableStack/move", "move()")}} của nó
- Khai báo nó với {{jsxref("Statements/await_using", "await using")}} và để biến ra khỏi phạm vi, điều này tự động gọi phương thức [`[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/Symbol.asyncDispose).

## Ví dụ

### Kiểm tra xem ngăn xếp đã bị hủy chưa

```js
const disposer = new AsyncDisposableStack();
console.log(disposer.disposed); // false
await disposer.disposeAsync();
console.log(disposer.disposed); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
