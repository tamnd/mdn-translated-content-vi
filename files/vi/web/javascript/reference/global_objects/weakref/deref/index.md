---
title: WeakRef.prototype.deref()
short-title: deref()
slug: Web/JavaScript/Reference/Global_Objects/WeakRef/deref
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakRef.deref
sidebar: jsref
---

Phương thức **`deref()`** của các instance {{jsxref("WeakRef")}} trả về giá trị target của `WeakRef` này, hoặc `undefined` nếu giá trị target đã được thu gom rác.

## Cú pháp

```js-nolint
deref()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị target của WeakRef, là một đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Trả về `undefined` nếu giá trị đã được thu gom rác.

## Mô tả

Xem phần [Ghi chú về WeakRef](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef#notes_on_weakrefs) trên trang {{jsxref("WeakRef")}} để biết một số ghi chú quan trọng.

## Ví dụ

### Sử dụng deref()

Xem phần [Ví dụ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef#examples) trên trang {{jsxref("WeakRef")}} để có ví dụ đầy đủ.

```js
const tick = () => {
  // Get the element from the weak reference, if it still exists
  const element = this.ref.deref();
  if (element) {
    element.textContent = ++this.count;
  } else {
    // The element doesn't exist anymore
    console.log("The element is gone.");
    this.stop();
    this.ref = null;
  }
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakRef")}}
