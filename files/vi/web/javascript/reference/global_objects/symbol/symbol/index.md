---
title: Symbol() constructor
short-title: Symbol()
slug: Web/JavaScript/Reference/Global_Objects/Symbol/Symbol
page-type: javascript-constructor
browser-compat: javascript.builtins.Symbol.Symbol
sidebar: jsref
---

Hàm **`Symbol()`** trả về các giá trị nguyên thủy kiểu Symbol.

{{InteractiveExample("JavaScript Demo: Symbol() constructor", "taller")}}

```js interactive-example
const symbol1 = Symbol();
const symbol2 = Symbol(42);
const symbol3 = Symbol("foo");

console.log(typeof symbol1);
// Expected output: "symbol"

console.log(symbol2 === 42);
// Expected output: false

console.log(symbol3.toString());
// Expected output: "Symbol(foo)"

console.log(Symbol("foo") === Symbol("foo"));
// Expected output: false
```

## Cú pháp

```js-nolint
Symbol()
Symbol(description)
```

> [!NOTE]
> `Symbol()` chỉ có thể được gọi mà không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng khởi tạo nó với `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `description` {{optional_inline}}
  - : Một chuỗi. Mô tả về symbol có thể được dùng để debug nhưng không thể dùng để truy cập bản thân symbol.

## Ví dụ

### Tạo symbol

Để tạo một symbol nguyên thủy mới, bạn viết `Symbol()` với một chuỗi tùy chọn làm mô tả:

```js
const sym1 = Symbol();
const sym2 = Symbol("foo");
const sym3 = Symbol("foo");
```

Đoạn mã trên tạo ra ba symbol mới. Lưu ý rằng `Symbol("foo")` không ép kiểu chuỗi `"foo"` thành một symbol. Nó tạo một symbol mới mỗi lần:

```js
Symbol("foo") === Symbol("foo"); // false
```

### new Symbol()

Cú pháp sau với toán tử {{jsxref("Operators/new", "new")}} sẽ ném ra {{jsxref("TypeError")}}:

```js example-bad
const sym = new Symbol(); // TypeError
```

Điều này ngăn các tác giả tạo một đối tượng bao bọc `Symbol` rõ ràng thay vì một symbol value mới và có thể gây bất ngờ vì việc tạo các đối tượng bao bọc rõ ràng xung quanh các kiểu dữ liệu nguyên thủy thường là có thể (ví dụ: `new Boolean`, `new String` và `new Number`).

Nếu bạn thực sự muốn tạo một đối tượng bao bọc `Symbol`, bạn có thể dùng hàm `Object()`:

```js
const sym = Symbol("foo");
const symObj = Object(sym);
typeof sym; // "symbol"
typeof symObj; // "object"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
