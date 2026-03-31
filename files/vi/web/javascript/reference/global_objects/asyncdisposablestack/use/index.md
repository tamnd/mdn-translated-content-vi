---
title: AsyncDisposableStack.prototype.use()
short-title: use()
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/use
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncDisposableStack.use
sidebar: jsref
---

Phương thức **`use()`** của các instance {{jsxref("AsyncDisposableStack")}} đăng ký một giá trị triển khai [giao thức async disposable](/en-US/docs/Web/JavaScript/Guide/Resource_management) vào ngăn xếp.

Xem {{jsxref("DisposableStack.prototype.use()")}} để biết thông tin chung về phương thức `use()`.

## Cú pháp

```js-nolint
use(value)
```

### Tham số

- `value`
  - : Giá trị cần đăng ký vào ngăn xếp. Phải chứa phương thức `[Symbol.asyncDispose]()` hoặc `[Symbol.dispose]()`, hoặc là `null` hoặc `undefined`.

### Giá trị trả về

Cùng `value` đã được truyền vào.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `value` không phải là `null` hoặc `undefined`, và không chứa phương thức `[Symbol.asyncDispose]()` hoặc `[Symbol.dispose]()`.
- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Ví dụ

### Sử dụng use()

Hàm này đọc một file (là một Node.js [`FileHandle`](https://nodejs.org/api/fs.html#class-filehandle)) và trả về nội dung của nó. File handle được tự động đóng khi hàm hoàn thành, vì class `FileHandle` triển khai phương thức `[Symbol.asyncDispose]()` để đóng file một cách bất đồng bộ.

```js
async function readFileContents(path) {
  await using disposer = new AsyncDisposableStack();
  const handle = disposer.use(await fs.open(path));
  const data = await handle.read();
  return data;
  // The disposer is disposed here, which causes handle to be closed too
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("AsyncDisposableStack")}}
- {{jsxref("AsyncDisposableStack.prototype.adopt()")}}
- {{jsxref("AsyncDisposableStack.prototype.defer()")}}
