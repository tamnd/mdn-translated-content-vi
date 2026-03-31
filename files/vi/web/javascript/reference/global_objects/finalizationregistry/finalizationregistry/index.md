---
title: FinalizationRegistry() constructor
short-title: FinalizationRegistry()
slug: Web/JavaScript/Reference/Global_Objects/FinalizationRegistry/FinalizationRegistry
page-type: javascript-constructor
browser-compat: javascript.builtins.FinalizationRegistry.FinalizationRegistry
sidebar: jsref
---

Constructor **`FinalizationRegistry()`** tạo các đối tượng {{jsxref("FinalizationRegistry")}}.

## Cú pháp

```js-nolint
new FinalizationRegistry(callbackFn)
```

> [!NOTE]
> `FinalizationRegistry()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `callback`
  - : Một hàm sẽ được gọi mỗi khi một giá trị target đã đăng ký bị thu gom rác. Giá trị trả về của nó bị bỏ qua. Hàm được gọi với đối số sau:
    - `heldValue`
      - : Giá trị được truyền vào tham số thứ hai của phương thức {{jsxref("FinalizationRegistry/register", "register()")}} khi đối tượng `target` được đăng ký.

## Ví dụ

### Tạo registry mới

Bạn tạo registry bằng cách truyền callback vào:

```js
const registry = new FinalizationRegistry((heldValue) => {
  // …
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("FinalizationRegistry")}}
