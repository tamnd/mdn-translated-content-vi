---
title: DisposableStack.prototype.defer()
short-title: defer()
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/defer
page-type: javascript-instance-method
browser-compat: javascript.builtins.DisposableStack.defer
sidebar: jsref
---

Phương thức **`defer()`** của các instance {{jsxref("DisposableStack")}} nhận một hàm callback để gọi khi ngăn xếp bị hủy.

## Cú pháp

```js-nolint
defer(onDispose)
```

### Tham số

- `onDispose`
  - : Một hàm sẽ được gọi khi ngăn xếp bị hủy. Hàm không nhận đối số nào.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `onDispose` không phải là một hàm.
- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Mô tả

Mục đích chính của `defer()` là đăng ký một callback dọn dẹp không gắn với việc hủy một tài nguyên cụ thể nào. Nếu callback gắn với một tài nguyên cụ thể, bạn nên dùng {{jsxref("DisposableStack/use", "use()")}} hoặc {{jsxref("DisposableStack/adopt", "adopt()")}} thay thế. Bạn cũng có thể dùng `defer` khi tài nguyên không được khai báo trong code của bạn:

```js
function consumeReader(reader) {
  using disposer = new DisposableStack();
  disposer.defer(() => reader.releaseLock());
  // Do something with reader
}
```

## Ví dụ

### Sử dụng defer()

Hàm này thiết lập một khóa đơn giản để ngăn nhiều thao tác bất đồng bộ chạy cùng lúc. Khóa được giải phóng khi hàm hoàn thành.

```js
let isLocked = false;

async function requestWithLock(url, options) {
  if (isLocked) {
    return undefined;
  }
  using disposer = new DisposableStack();
  isLocked = true;
  disposer.defer(() => (isLocked = false));
  const data = await fetch(url, options).then((res) => res.json());
  return data;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("DisposableStack")}}
- {{jsxref("DisposableStack.prototype.adopt()")}}
- {{jsxref("DisposableStack.prototype.use()")}}
