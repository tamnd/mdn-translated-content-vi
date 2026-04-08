---
title: DisposableStack.prototype.adopt()
short-title: adopt()
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/adopt
page-type: javascript-instance-method
browser-compat: javascript.builtins.DisposableStack.adopt
sidebar: jsref
---

Phương thức **`adopt()`** của các instance {{jsxref("DisposableStack")}} đăng ký một giá trị không triển khai giao thức disposable vào ngăn xếp bằng cách cung cấp một hàm disposer tùy chỉnh.

## Cú pháp

```js-nolint
adopt(value, onDispose)
```

### Tham số

- `value`
  - : Bất kỳ giá trị nào cần đăng ký vào ngăn xếp.
- `onDispose`
  - : Một hàm sẽ được gọi khi ngăn xếp bị hủy. Hàm nhận `value` là đối số duy nhất của nó.

### Giá trị trả về

Cùng `value` đã được truyền vào.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `onDispose` không phải là một hàm.
- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Mô tả

Mục đích chính của `adopt()` là đăng ký một giá trị không triển khai giao thức disposable vào ngăn xếp. Nếu giá trị đã có khả năng hủy (disposable), bạn có thể dùng {{jsxref("DisposableStack/use", "use()")}} thay thế, vì nó tự động sử dụng phương thức `[Symbol.dispose]()` của giá trị làm disposer.

`adopt(value, onDispose)` gần giống với `defer(() => onDispose(value))`, nhưng cho phép bạn khai báo tài nguyên và đăng ký nó trên cùng một dòng. Cách này giảm thiểu khả năng xảy ra lỗi giữa bước tạo tài nguyên và đăng ký, vốn có thể gây rò rỉ tài nguyên.

```js example-good
using disposer = new DisposableStack();
const reader = disposer.adopt(stream.getReader(), (reader) =>
  reader.releaseLock(),
);
```

```js example-bad
using disposer = new DisposableStack();
const reader = stream.getReader();
// Nếu ai đó thêm code giữa các dòng này và xảy ra lỗi,
// luồng sẽ bị khóa mãi mãi.
disposer.defer(() => reader.close());
```

Theo tinh thần "đăng ký tài nguyên ngay khi khai báo", bạn nên luôn bọc biểu thức khởi tạo tài nguyên trong `adopt()`, thay vì tách nó ra thành một câu lệnh riêng.

```js example-bad
using disposer = new DisposableStack();
const reader = stream.getReader();
disposer.adopt(reader, (reader) => reader.close());
```

## Ví dụ

### Sử dụng adopt()

Đoạn code này đọc dữ liệu từ một {{domxref("ReadableStream")}} qua một {{domxref("ReadableStreamDefaultReader")}}. Reader không triển khai giao thức disposable, vì vậy chúng ta dùng `adopt()` để đăng ký nó vào ngăn xếp.

```js
{
  using disposer = new DisposableStack();
  const reader = disposer.adopt(stream.getReader(), (reader) =>
    reader.releaseLock(),
  );
  const { value, done } = reader.read();
  if (!done) {
    // Process the value
  }
  // The reader.releaseLock() method is called here before exiting
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("DisposableStack")}}
- {{jsxref("DisposableStack.prototype.defer()")}}
- {{jsxref("DisposableStack.prototype.use()")}}
