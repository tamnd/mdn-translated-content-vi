---
title: DisposableStack.prototype.use()
short-title: use()
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/use
page-type: javascript-instance-method
browser-compat: javascript.builtins.DisposableStack.use
sidebar: jsref
---

Phương thức **`use()`** của các instance {{jsxref("DisposableStack")}} đăng ký một giá trị triển khai [giao thức disposable](/en-US/docs/Web/JavaScript/Guide/Resource_management) vào ngăn xếp.

## Cú pháp

```js-nolint
use(value)
```

### Tham số

- `value`
  - : Giá trị cần đăng ký vào ngăn xếp. Phải chứa phương thức `[Symbol.dispose]()`, hoặc là `null` hoặc `undefined`.

### Giá trị trả về

Cùng `value` đã được truyền vào.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `value` không phải là `null` hoặc `undefined`, và không chứa phương thức `[Symbol.dispose]()`.
- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Mô tả

Mục đích chính của `use()` là đăng ký một giá trị triển khai giao thức disposable vào ngăn xếp, tương đương với khai báo {{jsxref("Statements/using", "using")}}. Nếu giá trị không triển khai giao thức disposable (tức là không có phương thức `[Symbol.dispose]()`), hãy dùng {{jsxref("DisposableStack/adopt", "adopt()")}} thay thế, truyền vào một callback gọi phương thức dọn dẹp của tài nguyên.

Bạn nên đăng ký tài nguyên ngay khi khai báo. Điều này có nghĩa là bạn nên luôn bọc biểu thức khởi tạo tài nguyên trong `use()`, thay vì tách nó ra thành một câu lệnh riêng.

```js example-bad
using disposer = new DisposableStack();
const reader = stream.getReader();
disposer.use(reader);
```

## Ví dụ

### Sử dụng use()

Đoạn code này đọc dữ liệu từ một {{domxref("ReadableStream")}} qua một {{domxref("ReadableStreamDefaultReader")}}. Reader được tự động đóng khi hàm hoàn thành, giả sử nó triển khai phương thức `[Symbol.dispose]()` để đồng bộ giải phóng khóa trên luồng.

```js
{
  using disposer = new DisposableStack();
  const reader = disposer.use(stream.getReader());
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
- {{jsxref("DisposableStack.prototype.adopt()")}}
- {{jsxref("DisposableStack.prototype.defer()")}}
