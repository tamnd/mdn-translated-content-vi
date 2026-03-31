---
title: Symbol.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Symbol/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Symbol.toString
sidebar: jsref
---

Phương thức **`toString()`** của các giá trị {{jsxref("Symbol")}} trả về một chuỗi đại diện cho giá trị symbol này.

{{InteractiveExample("JavaScript Demo: Symbol.prototype.toString()")}}

```js interactive-example
console.log(Symbol("desc").toString());
// Expected output: "Symbol(desc)"

console.log(Symbol.iterator.toString());
// Expected output: "Symbol(Symbol.iterator)

console.log(Symbol.for("foo").toString());
// Expected output: "Symbol(foo)"

// console.log(Symbol('foo') + 'bar');
// Expected output: Error: Can't convert symbol to string
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho giá trị symbol đã chỉ định.

## Mô tả

Đối tượng {{jsxref("Symbol")}} ghi đè phương thức `toString` của {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString()")}}. Đối với các giá trị `Symbol`, phương thức `toString` trả về chuỗi mô tả có dạng `"Symbol(description)"`, trong đó `description` là [mô tả](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/description) của symbol.

Phương thức `toString()` yêu cầu giá trị `this` của nó là một nguyên thủy `Symbol` hoặc đối tượng bao bọc. Nó ném {{jsxref("TypeError")}} cho các giá trị `this` khác mà không cố gắng ép kiểu chúng thành giá trị symbol.

Vì `Symbol` có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive), phương thức đó luôn có độ ưu tiên cao hơn `toString()` khi một đối tượng `Symbol` được [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Tuy nhiên, vì `Symbol.prototype[Symbol.toPrimitive]()` trả về một nguyên thủy symbol, và các nguyên thủy symbol ném {{jsxref("TypeError")}} khi được chuyển đổi ngầm định thành chuỗi, phương thức `toString()` không bao giờ được ngôn ngữ gọi ngầm định. Để stringify một symbol, bạn phải gọi rõ ràng phương thức `toString()` của nó hoặc dùng hàm [`String()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String#using_string_to_stringify_a_symbol).

## Ví dụ

### Sử dụng toString()

```js
Symbol("desc").toString(); // "Symbol(desc)"

// well-known symbols
Symbol.iterator.toString(); // "Symbol(Symbol.iterator)"

// global symbols
Symbol.for("foo").toString(); // "Symbol(foo)"
```

### Gọi toString() ngầm định

Cách duy nhất để JavaScript gọi ngầm định `toString()` thay vì [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive) trên một đối tượng bao bọc symbol là bằng cách [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete) phương thức `[Symbol.toPrimitive]()` trước.

> [!WARNING]
> Bạn không nên làm điều này trong thực tế. Đừng bao giờ thay đổi các đối tượng tích hợp sẵn trừ khi bạn biết chính xác mình đang làm gì.

```js
delete Symbol.prototype[Symbol.toPrimitive];
console.log(`${Object(Symbol("foo"))}`); // "Symbol(foo)"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}
