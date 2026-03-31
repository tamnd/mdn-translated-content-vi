---
title: AsyncDisposableStack.prototype.move()
short-title: move()
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/move
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncDisposableStack.move
sidebar: jsref
---

Phương thức **`move()`** của các instance {{jsxref("AsyncDisposableStack")}} tạo một instance `AsyncDisposableStack` mới chứa các disposer giống ngăn xếp này, sau đó đánh dấu ngăn xếp này là đã hủy mà không gọi bất kỳ disposer nào.

## Cú pháp

```js-nolint
move()
```

### Tham số

Không có.

### Giá trị trả về

Một instance {{jsxref("AsyncDisposableStack")}} mới.

### Ngoại lệ

- {{jsxref("ReferenceError")}}
  - : Ném ra nếu ngăn xếp đã bị hủy.

## Ví dụ

### Nhận quyền sở hữu một ngăn xếp

```js
async function consumeStack(stack) {
  await using newStack = stack.move(); // newStack now owns the disposers
  console.log(stack.disposed); // true
  console.log(newStack.disposed); // false
  // newStack is disposed here immediately before the function exits
}

const stack = new AsyncDisposableStack();
console.log(stack.disposed); // false
await consumeStack(stack);
console.log(stack.disposed); // true
```

### Cho phép tài nguyên bị hủy trong hai luồng code

Trường hợp sử dụng chính của `move()` là khi bạn có một hoặc nhiều tài nguyên có thể bị hủy ngay tại đây hoặc được giữ lại để dùng sau. Trong trường hợp này, bạn có thể đặt các tài nguyên vào một `AsyncDisposableStack` và sau đó gọi `move()` khi cần giữ lại tài nguyên để dùng sau.

```js
class PluginHost {
  #disposed = false;
  #disposables;
  #channel;
  #socket;

  static async init() {
    // Create an AsyncDisposableStack that is disposed when init exits.
    // If construction succeeds, we move everything out of `stack` and into
    // `#disposables` to be disposed later.
    await using stack = new AsyncDisposableStack();

    const channel = stack.use(await getChannel());

    const socket = stack.use(await getSocket());

    // If we made it here, then there were no errors during construction and
    // we can safely move the disposables out of `stack`.
    return new PluginHost(channel, socket, stack.move());

    // If construction failed, then `stack` would be disposed before reaching
    // the line above, which would dispose `channel` and `socket` in turn.
  }

  constructor(channel, socket, disposables) {
    this.#channel = channel;
    this.#socket = socket;
    this.#disposables = disposables;
  }

  [Symbol.asyncDispose]() {
    if (this.#disposed) {
      return;
    }
    this.#disposed = true;
    // Put `this.#disposables` into a `using` variable, so it is automatically
    // disposed when the function exits.
    await using disposables = this.#disposables;

    // NOTE: we can free `#socket` and `#channel` here since they will be
    // disposed by the call to `disposables[Symbol.asyncDispose]()`, below.
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
- {{jsxref("AsyncDisposableStack")}}
- {{jsxref("AsyncDisposableStack.prototype.disposeAsync()")}}
