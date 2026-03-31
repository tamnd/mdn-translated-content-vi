---
title: FinalizationRegistry.prototype.unregister()
short-title: unregister()
slug: Web/JavaScript/Reference/Global_Objects/FinalizationRegistry/unregister
page-type: javascript-instance-method
browser-compat: javascript.builtins.FinalizationRegistry.unregister
sidebar: jsref
---

Phương thức **`unregister()`** của các instance {{jsxref("FinalizationRegistry")}} hủy đăng ký một giá trị target khỏi `FinalizationRegistry` này.

## Cú pháp

```js-nolint
unregister(unregisterToken)
```

### Tham số

- `unregisterToken`
  - : Token đã được dùng với phương thức {{jsxref("FinalizationRegistry/register", "register()")}} khi đăng ký giá trị target. Nhiều ô đăng ký cùng `unregisterToken` sẽ bị hủy đăng ký cùng nhau.

### Giá trị trả về

Một giá trị boolean là `true` nếu ít nhất một ô đã bị hủy đăng ký và `false` nếu không có ô nào bị hủy đăng ký.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `unregisterToken` không phải là đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Mô tả

Khi một giá trị target đã được thu hồi, nó không còn được đăng ký trong registry nữa. Không cần gọi `unregister` trong cleanup callback của bạn. Chỉ gọi `unregister` nếu bạn chưa nhận được cleanup callback và không còn cần nhận nữa.

## Ví dụ

### Sử dụng unregister

Ví dụ này cho thấy việc đăng ký một đối tượng target dùng chính đối tượng đó làm unregister token, sau đó hủy đăng ký nó qua `unregister`:

```js
class Thingy {
  static #cleanup = (label) => {
    //               ^^^^^−−−−− held value
    console.error(
      `The "release" method was never called for the object with the label "${label}"`,
    );
  };
  #registry = new FinalizationRegistry(Thingy.#cleanup);

  /**
   * Constructs a `Thingy` instance.
   * Be sure to call `release` when you're done with it.
   *
   * @param label A label for the `Thingy`.
   */
  constructor(label) {
    //                            vvvvv−−−−− held value
    this.#registry.register(this, label, this);
    //          target −−−−−^^^^         ^^^^−−−−− unregister token
  }

  /**
   * Releases resources held by this `Thingy` instance.
   */
  release() {
    this.#registry.unregister(this);
    //                        ^^^^−−−−− unregister token
  }
}
```

Ví dụ này cho thấy việc đăng ký một đối tượng target dùng một đối tượng khác làm unregister token:

```js
class Thingy {
  static #cleanup = (file) => {
    //               ^^^^−−−−− held value
    console.error(
      `The "release" method was never called for the "Thingy" for the file "${file.name}"`,
    );
  };
  #registry = new FinalizationRegistry(Thingy.#cleanup);
  #file;

  /**
   * Constructs a `Thingy` instance for the given file.
   * Be sure to call `release` when you're done with it.
   *
   * @param filename The name of the file.
   */
  constructor(filename) {
    this.#file = File.open(filename);
    //                            vvvvv−−−−− held value
    this.#registry.register(this, label, this.#file);
    //          target −−−−−^^^^         ^^^^^^^^^^−−−−− unregister token
  }

  /**
   * Releases resources held by this `Thingy` instance.
   */
  release() {
    if (this.#file) {
      this.#registry.unregister(this.#file);
      //                        ^^^^^^^^^^−−−−− unregister token
      File.close(this.#file);
      this.#file = null;
    }
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("FinalizationRegistry")}}
