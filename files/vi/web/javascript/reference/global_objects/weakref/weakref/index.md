---
title: WeakRef() constructor
short-title: WeakRef()
slug: Web/JavaScript/Reference/Global_Objects/WeakRef/WeakRef
page-type: javascript-constructor
browser-compat: javascript.builtins.WeakRef.WeakRef
sidebar: jsref
---

Constructor **`WeakRef()`** tạo các đối tượng {{jsxref("WeakRef")}}.

## Cú pháp

```js-nolint
new WeakRef(target)
```

> [!NOTE]
> `WeakRef()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `target`
  - : Giá trị target mà WeakRef sẽ tham chiếu đến (còn được gọi là _referent_). Phải là một đối tượng hoặc một [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

### Giá trị trả về

Một đối tượng `WeakRef` mới tham chiếu đến giá trị target đã cho.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Tạo đối tượng WeakRef mới

Xem trang [`WeakRef`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef#examples) chính để có ví dụ đầy đủ.

```js
class Counter {
  constructor(element) {
    // Remember a weak reference to a DOM element
    this.ref = new WeakRef(element);
    this.start();
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakRef")}}
