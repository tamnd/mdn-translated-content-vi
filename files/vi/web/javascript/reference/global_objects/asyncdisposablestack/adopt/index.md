---
title: AsyncDisposableStack.prototype.adopt()
short-title: adopt()
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/adopt
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncDisposableStack.adopt
sidebar: jsref
---

Phương thức **`adopt()`** của các instance {{jsxref("AsyncDisposableStack")}} đăng ký một giá trị không triển khai giao thức async disposable vào ngăn xếp bằng cách cung cấp một hàm disposer tùy chỉnh.

Xem {{jsxref("DisposableStack.prototype.adopt()")}} để biết thông tin chung về phương thức `adopt()`.

## Cú pháp

```js-nolint
adopt(value, onDispose)
```

### Tham số

- `value`
  - : Bất kỳ giá trị nào cần đăng ký vào ngăn xếp.
- `onDispose`
  - : Một hàm sẽ được gọi khi ngăn xếp bị hủy. Hàm nhận `value` là đối số duy nhất của nó, và có thể trả về một promise sẽ được chờ (await).

### Giá trị trả về

Cùng `value` đã được truyền vào.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `onDispose` không phải là một hàm.
- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Ví dụ

### Sử dụng adopt()

Hàm này tạo một file handle (là một Node.js [`FileHandle`](https://nodejs.org/api/fs.html#class-filehandle)), sẽ được đóng khi hàm hoàn thành. Giả sử file handle không triển khai giao thức async disposable (thực tế thì có), vì vậy chúng ta dùng `adopt()` để đăng ký nó vào ngăn xếp. Vì phương thức `handle.close()` trả về một promise, chúng ta cần dùng `AsyncDisposableStack` để việc hủy được chờ (await).

```js
async function readFile(path) {
  await using disposer = new AsyncDisposableStack();
  const handle = disposer.adopt(
    await fs.open(path),
    async (handle) => await handle.close(),
  );
  const data = await handle.read();
  // The handle.close() method is called and awaited here before exiting
  return data;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("AsyncDisposableStack")}}
- {{jsxref("AsyncDisposableStack.prototype.defer()")}}
- {{jsxref("AsyncDisposableStack.prototype.use()")}}
