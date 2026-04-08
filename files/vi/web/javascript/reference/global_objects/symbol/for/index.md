---
title: Symbol.for()
short-title: for()
slug: Web/JavaScript/Reference/Global_Objects/Symbol/for
page-type: javascript-static-method
browser-compat: javascript.builtins.Symbol.for
sidebar: jsref
---

Phương thức tĩnh **`Symbol.for()`** tìm kiếm các symbol hiện có trong global symbol registry với key đã cho và trả về nó nếu tìm thấy. Nếu không, một symbol mới được tạo trong global symbol registry với key này.

{{InteractiveExample("JavaScript Demo: Symbol.for()")}}

```js interactive-example
console.log(Symbol.for("bar") === Symbol.for("bar"));
// Expected output: true

console.log(Symbol("bar") === Symbol("bar"));
// Expected output: false

const symbol1 = Symbol.for("foo");

console.log(symbol1.toString());
// Expected output: "Symbol(foo)"
```

## Cú pháp

```js-nolint
Symbol.for(key)
```

### Tham số

- `key`
  - : Chuỗi, bắt buộc. Key cho symbol (cũng được dùng làm mô tả của symbol).

### Giá trị trả về

Một symbol hiện có với key đã cho nếu tìm thấy; nếu không, một symbol mới được tạo và trả về.

## Mô tả

Trái ngược với `Symbol()`, hàm `Symbol.for()` tạo một symbol có thể dùng trong [global symbol registry](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). `Symbol.for()` cũng không nhất thiết tạo một symbol mới mỗi lần gọi, mà trước tiên kiểm tra xem một symbol với `key` đã cho đã có trong registry chưa. Nếu có, symbol đó được trả về. Nếu không tìm thấy symbol nào với key đã cho, `Symbol.for()` sẽ tạo một symbol global mới.

## Ví dụ

### Sử dụng Symbol.for()

```js
Symbol.for("foo"); // tạo một global symbol mới
Symbol.for("foo"); // lấy symbol đã tạo

// Cùng một global symbol, nhưng không phải local
Symbol.for("bar") === Symbol.for("bar"); // true
Symbol("bar") === Symbol("bar"); // false

// Key cũng được dùng làm mô tả
const sym = Symbol.for("mario");
sym.toString(); // "Symbol(mario)"
```

Để tránh xung đột tên với các key global symbol của bạn và các global symbol khác (mã thư viện), có thể là một ý hay để đặt tiền tố cho các symbol của bạn:

```js
Symbol.for("mdn.foo");
Symbol.for("mdn.bar");
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Symbol.keyFor()")}}
