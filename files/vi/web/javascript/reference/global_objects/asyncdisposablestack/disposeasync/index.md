---
title: AsyncDisposableStack.prototype.disposeAsync()
short-title: disposeAsync()
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/disposeAsync
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncDisposableStack.disposeAsync
sidebar: jsref
---

Phương thức **`disposeAsync()`** của các instance {{jsxref("AsyncDisposableStack")}} hủy ngăn xếp này bằng cách gọi tất cả các disposer đã đăng ký theo thứ tự ngược lại với thứ tự đăng ký, chờ (await) mỗi cái hoàn thành trước khi gọi cái tiếp theo. Nếu ngăn xếp đã bị hủy, phương thức này không làm gì cả.

Nó thực hiện hành động tương tự như `await using disposer = new AsyncDisposableStack()` khi thoát khỏi phạm vi. Có thể sử dụng nếu bạn cần dọn dẹp tại một thời điểm khác ngoài lúc thoát phạm vi.

## Cú pháp

```js-nolint
disposeAsync()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} mới phân giải thành `undefined` khi tất cả các disposer đã đăng ký hoàn thành theo trình tự.

### Ngoại lệ

`disposeAsync()` không bao giờ ném lỗi đồng bộ. Promise trả về có thể bị từ chối (reject) với một trong các lỗi sau:

- {{jsxref("SuppressedError")}}
  - : Ném ra nếu nhiều disposer trong ngăn xếp cùng ném lỗi. Nếu chỉ một lỗi được ném, lỗi đó sẽ được ném lại nguyên vẹn. Nếu không, với mỗi lỗi phát sinh thêm, một {{jsxref("SuppressedError")}} mới sẽ được tạo, với lỗi gốc là thuộc tính `suppressed` và lỗi mới là thuộc tính `error`.

## Ví dụ

### Hủy một ngăn xếp

Ở đây chúng ta đẩy ba disposer vào ngăn xếp, sử dụng các phương thức {{jsxref("AsyncDisposableStack/use", "use()")}}, {{jsxref("AsyncDisposableStack/adopt", "adopt()")}}, và {{jsxref("AsyncDisposableStack/defer", "defer()")}}. Khi `disposeAsync()` được gọi, các disposer sẽ được gọi theo thứ tự ngược lại với thứ tự đăng ký.

Lưu ý rằng thông thường bạn không cần gọi `disposeAsync()` thủ công. Hãy khai báo ngăn xếp với {{jsxref("Statements/await_using", "await using")}}, và phương thức [`[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/Symbol.asyncDispose) của nó sẽ tự động được gọi khi ngăn xếp ra khỏi phạm vi.

```js
class Resource {
  #doDisposal() {
    // Imagine more meaningful disposal logic here
    return new Promise((resolve) => {
      setTimeout(resolve, 1000);
    });
  }
  async dispose() {
    await this.#doDisposal();
    console.log("Resource disposed");
  }
  async [Symbol.asyncDispose]() {
    await this.#doDisposal();
    console.log("Resource disposed via Symbol.asyncDispose");
  }
}

async function doSomething() {
  const disposer = new AsyncDisposableStack();
  const resource = disposer.use(new Resource());
  const resource2 = disposer.adopt(new Resource(), (resource) =>
    resource.dispose(),
  );
  disposer.defer(() => console.log("Deferred disposer"));
  disposer.disposeAsync();
  // Logs in order:
  // Deferred disposer
  // Resource disposed
  // Resource disposed via Symbol.dispose
}

doSomething();
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
- {{jsxref("AsyncDisposableStack.prototype.use()")}}
- [`AsyncDisposableStack.prototype[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/Symbol.asyncDispose)
