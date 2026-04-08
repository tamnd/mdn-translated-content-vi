---
title: DisposableStack.prototype.disposed
short-title: disposed
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/disposed
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.DisposableStack.disposed
sidebar: jsref
---

Thuộc tính accessor **`disposed`** của các instance {{jsxref("DisposableStack")}} trả về một boolean cho biết liệu `DisposableStack` này đã bị hủy hoặc chuyển hay chưa bằng cách thực hiện một trong những hành động sau:

- Gọi phương thức {{jsxref("DisposableStack/dispose", "dispose()")}} của nó
- Gọi phương thức {{jsxref("DisposableStack/move", "move()")}} của nó
- Khai báo nó với {{jsxref("Statements/using", "using")}} và để biến ra khỏi phạm vi, điều này tự động gọi phương thức [`[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/DisposableStack/Symbol.dispose).

## Ví dụ

### Kiểm tra xem ngăn xếp đã bị hủy chưa

```js
const disposer = new DisposableStack();
console.log(disposer.disposed); // false
disposer.dispose();
console.log(disposer.disposed); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
