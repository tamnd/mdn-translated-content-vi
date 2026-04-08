---
title: DisposableStack.prototype.dispose()
short-title: dispose()
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/dispose
page-type: javascript-instance-method
browser-compat: javascript.builtins.DisposableStack.dispose
sidebar: jsref
---

Phương thức **`dispose()`** của các instance {{jsxref("DisposableStack")}} hủy ngăn xếp này bằng cách gọi tất cả các disposer đã đăng ký theo thứ tự ngược lại với thứ tự đăng ký. Nếu ngăn xếp đã bị hủy, phương thức này không làm gì cả.

Nó thực hiện hành động tương tự như `using disposer = new DisposableStack()` khi thoát khỏi phạm vi. Có thể sử dụng nếu bạn cần dọn dẹp tại một thời điểm khác ngoài lúc thoát phạm vi.

## Cú pháp

```js-nolint
dispose()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("SuppressedError")}}
  - : Ném ra nếu nhiều disposer trong ngăn xếp cùng ném lỗi. Nếu chỉ một lỗi được ném, lỗi đó sẽ được ném lại nguyên vẹn. Nếu không, với mỗi lỗi phát sinh thêm, một {{jsxref("SuppressedError")}} mới sẽ được tạo, với lỗi gốc là thuộc tính `suppressed` và lỗi mới là thuộc tính `error`.

## Ví dụ

### Hủy một ngăn xếp

Ở đây chúng ta đẩy ba disposer vào ngăn xếp, sử dụng các phương thức {{jsxref("DisposableStack/use", "use()")}}, {{jsxref("DisposableStack/adopt", "adopt()")}}, và {{jsxref("DisposableStack/defer", "defer()")}}. Khi `dispose()` được gọi, các disposer sẽ được gọi theo thứ tự ngược lại với thứ tự đăng ký.

Lưu ý rằng thông thường bạn không cần gọi `dispose()` thủ công. Hãy khai báo ngăn xếp với {{jsxref("Statements/using", "using")}}, và phương thức [`[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/DisposableStack/Symbol.dispose) của nó sẽ tự động được gọi khi ngăn xếp ra khỏi phạm vi.

```js
class Resource {
  dispose() {
    console.log("Resource disposed");
  }
  [Symbol.dispose]() {
    console.log("Resource disposed via Symbol.dispose");
  }
}

{
  const disposer = new DisposableStack();
  const resource = disposer.use(new Resource());
  const resource2 = disposer.adopt(new Resource(), (resource) =>
    resource.dispose(),
  );
  disposer.defer(() => console.log("Deferred disposer"));
  disposer.dispose();
  // Logs in order:
  // Deferred disposer
  // Resource disposed
  // Resource disposed via Symbol.dispose
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
- {{jsxref("DisposableStack.prototype.use()")}}
- [`DisposableStack.prototype[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/DisposableStack/Symbol.dispose)
