---
title: AsyncDisposableStack.prototype.defer()
short-title: defer()
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/defer
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncDisposableStack.defer
sidebar: jsref
---

Phương thức **`defer()`** của các instance {{jsxref("AsyncDisposableStack")}} nhận một hàm callback để gọi và chờ (await) khi ngăn xếp bị hủy.

Xem {{jsxref("DisposableStack.prototype.defer()")}} để biết thông tin chung về phương thức `defer()`.

## Cú pháp

```js-nolint
defer(onDispose)
```

### Tham số

- `onDispose`
  - : Một hàm sẽ được gọi khi ngăn xếp bị hủy. Hàm không nhận đối số nào và có thể trả về một promise sẽ được chờ (await).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `onDispose` không phải là một hàm.
- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Ví dụ

### Sử dụng defer()

Một trường hợp sử dụng của `defer()` là thực hiện điều gì đó không liên quan đến việc giải phóng tài nguyên khi thoát phạm vi, chẳng hạn như ghi một thông báo log.

```js
async function doSomething() {
  await using disposer = new AsyncDisposableStack();
  disposer.defer(async () => {
    await fs.writeFile("log.txt", "All resources freed successfully");
  });
  // Other code that claims and frees more data
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
- {{jsxref("AsyncDisposableStack.prototype.use()")}}
