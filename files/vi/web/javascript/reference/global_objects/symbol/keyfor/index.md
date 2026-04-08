---
title: Symbol.keyFor()
short-title: keyFor()
slug: Web/JavaScript/Reference/Global_Objects/Symbol/keyFor
page-type: javascript-static-method
browser-compat: javascript.builtins.Symbol.keyFor
sidebar: jsref
---

Phương thức tĩnh **`Symbol.keyFor()`** lấy key symbol dùng chung từ global symbol registry cho symbol đã cho.

{{InteractiveExample("JavaScript Demo: Symbol.keyFor()")}}

```js interactive-example
const globalSym = Symbol.for("foo"); // Global symbol

console.log(Symbol.keyFor(globalSym));
// Expected output: "foo"

const localSym = Symbol(); // Local symbol

console.log(Symbol.keyFor(localSym));
// Expected output: undefined

console.log(Symbol.keyFor(Symbol.iterator));
// Expected output: undefined
```

## Cú pháp

```js-nolint
Symbol.keyFor(sym)
```

### Tham số

- `sym`
  - : Symbol, bắt buộc. Symbol cần tìm key.

### Giá trị trả về

Một chuỗi đại diện cho key của symbol đã cho nếu tìm thấy trong [global registry](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry); nếu không, {{jsxref("undefined")}}.

## Ví dụ

### Sử dụng keyFor()

```js
const globalSym = Symbol.for("foo"); // tạo một global symbol mới
Symbol.keyFor(globalSym); // "foo"

const localSym = Symbol();
Symbol.keyFor(localSym); // undefined

// well-known symbol không phải là symbol được đăng ký
// trong global symbol registry
Symbol.keyFor(Symbol.iterator); // undefined
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Symbol.for()")}}
