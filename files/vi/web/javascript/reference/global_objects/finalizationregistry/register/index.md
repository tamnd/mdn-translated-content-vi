---
title: FinalizationRegistry.prototype.register()
short-title: register()
slug: Web/JavaScript/Reference/Global_Objects/FinalizationRegistry/register
page-type: javascript-instance-method
browser-compat: javascript.builtins.FinalizationRegistry.register
sidebar: jsref
---

Phương thức **`register()`** của các instance {{jsxref("FinalizationRegistry")}} đăng ký một giá trị với `FinalizationRegistry` này để nếu giá trị bị thu gom rác, callback của registry có thể được gọi.

## Cú pháp

```js-nolint
register(target, heldValue)
register(target, heldValue, unregisterToken)
```

### Tham số

- `target`
  - : Giá trị target cần đăng ký.
- `heldValue`
  - : Giá trị cần truyền vào finalizer cho `target` này. Không thể là chính `target` nhưng có thể là bất cứ thứ gì khác, bao gồm hàm và các kiểu nguyên thủy.
- `unregisterToken` {{optional_inline}}
  - : Một token có thể được dùng với phương thức `unregister` sau này để hủy đăng ký giá trị target. Nếu được cung cấp (và không phải `undefined`), đây phải là một đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Nếu không được cung cấp, target không thể bị hủy đăng ký.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `target` không phải là đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) (đối tượng trái ngược với các kiểu nguyên thủy; hàm cũng là đối tượng)
    - `target` giống với `heldValue` (`target === heldValue`)
    - `unregisterToken` không phải là đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry)

## Mô tả

Xem các phần [Tránh sử dụng nếu có thể](/en-US/docs/Web/JavaScript/Reference/Global_Objects/FinalizationRegistry#avoid_where_possible) và [Ghi chú về cleanup callback](/en-US/docs/Web/JavaScript/Reference/Global_Objects/FinalizationRegistry#notes_on_cleanup_callbacks) trên trang {{jsxref("FinalizationRegistry")}} để biết các cảnh báo quan trọng.

## Ví dụ

### Sử dụng register

Đoạn code sau đăng ký giá trị được tham chiếu bởi `target`, truyền vào held value `"some value"` và truyền chính target làm unregistration token:

```js
registry.register(target, "some value", target);
```

Đoạn code sau đăng ký giá trị được tham chiếu bởi `target`, truyền vào một đối tượng khác làm held value, và không truyền vào bất kỳ unregistration token nào (nghĩa là `target` không thể bị hủy đăng ký):

```js
registry.register(target, { useful: "info about target" });
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("FinalizationRegistry")}}
