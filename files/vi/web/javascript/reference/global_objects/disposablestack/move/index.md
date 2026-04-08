---
title: DisposableStack.prototype.move()
short-title: move()
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack/move
page-type: javascript-instance-method
browser-compat: javascript.builtins.DisposableStack.move
sidebar: jsref
---

Phương thức **`move()`** của các instance {{jsxref("DisposableStack")}} tạo một instance `DisposableStack` mới chứa các disposer giống ngăn xếp này, sau đó đánh dấu ngăn xếp này là đã hủy mà không gọi bất kỳ disposer nào.

## Cú pháp

```js-nolint
move()
```

### Tham số

Không có.

### Giá trị trả về

Một instance {{jsxref("DisposableStack")}} mới.

### Ngoại lệ

- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Mô tả

Mục đích chính của `move()` là cho phép chuyển trách nhiệm hủy ra khỏi phạm vi hiện tại. Ví dụ, hàm của bạn có thể giành quyền sở hữu một số tài nguyên và hủy chúng nếu xảy ra lỗi; nếu mọi thứ hoàn thành thành công, bạn trả về các tài nguyên này và chuyển quyền sở hữu cho người gọi.

Khi dùng `move()` để chuyển quyền sở hữu, gọi `move()` phải là bước cuối cùng trong luồng điều khiển của bạn, bởi vì sẽ không có chủ sở hữu nào trong khoảng thời gian giữa lúc code của bạn từ bỏ quyền sở hữu qua `move()` và lúc người gọi nhận lấy quyền sở hữu từ giá trị trả về.

```js example-good
let resource1;

function init() {
  using disposer = new DisposableStack();
  resource1 = disposer.use(getResource1());
  // ...
  // Drop ownership immediately before returning
  return disposer.move();
}

// Pick up ownership immediately after returning
using disposer = init();
```

```js example-bad
let resource1;

function init() {
  using disposer = new DisposableStack();
  resource1 = disposer.use(getResource1());
  // ...
  const newDisposer = disposer.move();
  // If someone adds code in between these lines and an error occurs,
  // there would be no owner to free resource1
  return newDisposer;
}

using disposer = init();
```

Cũng cần thận trọng với pattern sau, mặc dù việc dùng pattern "tốt" có thể rất bất tiện trong nhiều trường hợp:

```js
function init() {
  using disposer = new DisposableStack();
  const resource1 = disposer.use(getResource1());
  // ...
  return { disposer: disposer.move(), resource1 };
}

const { resource1, ...rest } = init();
// If someone adds code in between these lines and an error occurs,
// there would be no owner to free resource1
using disposer = rest.disposer;
```

`move()` cũng có thể được dùng để hủy có điều kiện trong các trường hợp đôi khi bạn không muốn hủy tài nguyên nào cả. Ví dụ:

```js
using disposer = new DisposableStack();
const server = disposer.use(makeServer());
await server.init();
if (server.ready) {
  // Successfully initialized server; it now should live through the rest
  // of the program. Drop its disposer and don't pick it up. It will no
  // longer be disposed at all.
  disposer.move();
}
// If we reach the end of the scope without running disposer.move(),
// then server isn't ready for any reason, and we dispose its resources
// by disposing the disposer.
```

## Ví dụ

### Nhận quyền sở hữu một ngăn xếp

```js
function consumeStack(stack) {
  using newStack = stack.move(); // newStack now owns the disposers
  console.log(stack.disposed); // true
  console.log(newStack.disposed); // false
  // newStack is disposed here immediately before the function exits
}

const stack = new DisposableStack();
console.log(stack.disposed); // false
consumeStack(stack);
console.log(stack.disposed); // true
```

### Cho phép tài nguyên bị hủy trong hai luồng code

Trường hợp sử dụng chính của `move()` là khi bạn có một hoặc nhiều tài nguyên có thể bị hủy ngay tại đây hoặc được giữ lại để dùng sau. Trong trường hợp này, bạn có thể đặt các tài nguyên vào một `DisposableStack` và sau đó gọi `move()` khi cần giữ lại tài nguyên để dùng sau.

```js
class PluginHost {
  #disposed = false;
  #disposables;
  #channel;
  #socket;

  constructor() {
    // Create a DisposableStack that is disposed when the constructor exits.
    // If construction succeeds, we move everything out of `disposer` and into
    // `#disposables` to be disposed later.
    using disposer = new DisposableStack();

    // Create an IPC adapter around process.send/process.on("message").
    // When disposed, it unsubscribes from process.on("message").
    this.#channel = disposer.use(new NodeProcessIpcChannelAdapter(process));

    // Create a pseudo-websocket that sends and receives messages over
    // a NodeJS IPC channel.
    this.#socket = disposer.use(new NodePluginHostIpcSocket(this.#channel));

    // If we made it here, then there were no errors during construction and
    // we can safely move the disposables out of `disposer` and into `#disposables`.
    this.#disposables = disposer.move();

    // If construction failed, then `disposer` would be disposed before reaching
    // the line above. Event handlers would be removed, allowing `#channel` and
    // `#socket` to be GC'd.
  }

  [Symbol.dispose]() {
    if (this.#disposed) {
      return;
    }
    this.#disposed = true;
    // Put `this.#disposables` into a `using` variable, so it is automatically
    // disposed when the function exits.
    using disposables = this.#disposables;

    // NOTE: we can free `#socket` and `#channel` here since they will be
    // disposed by the call to `disposables[Symbol.dispose]()`, below.
    // This isn't strictly a requirement for every disposable, but is
    // good housekeeping since these objects will no longer be useable.
    this.#socket = undefined;
    this.#channel = undefined;
    this.#disposables = undefined;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("DisposableStack")}}
- {{jsxref("DisposableStack.prototype.dispose()")}}
