---
title: Symbol.toPrimitive
short-title: toPrimitive
slug: Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.toPrimitive
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.toPrimitive`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.toPrimitive`. Tất cả các thuật toán [ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion) tra cứu symbol này trên các đối tượng cho phương thức chấp nhận kiểu ưu tiên và trả về một biểu diễn nguyên thủy của đối tượng, trước khi quay lại dùng các phương thức `valueOf()` và `toString()` của đối tượng.

{{InteractiveExample("JavaScript Demo: Symbol.toPrimitive")}}

```js interactive-example
const object = {
  [Symbol.toPrimitive](hint) {
    if (hint === "number") {
      return 42;
    }
    return null;
  },
};

console.log(+object);
// Expected output: 42
```

## Giá trị

Well-known symbol `Symbol.toPrimitive`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Với sự trợ giúp của thuộc tính `Symbol.toPrimitive` (được dùng như giá trị hàm), một đối tượng có thể được chuyển đổi thành giá trị nguyên thủy. Hàm được gọi với đối số chuỗi `hint`, chỉ định kiểu ưu tiên của giá trị nguyên thủy kết quả. Đối số `hint` có thể là một trong số `"number"`, `"string"`, và `"default"`.

Gợi ý `"number"` được dùng bởi các thuật toán [ép kiểu số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion). Gợi ý `"string"` được dùng bởi thuật toán [ép kiểu chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Gợi ý `"default"` được dùng bởi thuật toán [ép kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion). `hint` chỉ là tín hiệu yếu về sở thích, và việc triển khai có thể bỏ qua nó (như [`Symbol.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive) làm). Ngôn ngữ không bắt buộc sự căn chỉnh giữa `hint` và kiểu kết quả, mặc dù `[Symbol.toPrimitive]()` phải trả về một nguyên thủy, hoặc {{jsxref("TypeError")}} sẽ được ném.

Các đối tượng không có thuộc tính `[Symbol.toPrimitive]` được chuyển đổi thành nguyên thủy bằng cách gọi các phương thức `valueOf()` và `toString()` theo các thứ tự khác nhau, điều này được giải thích chi tiết hơn trong phần [ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion). `[Symbol.toPrimitive]()` cho phép kiểm soát hoàn toàn quá trình chuyển đổi nguyên thủy. Ví dụ, [`Date.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive) coi `"default"` như `"string"` và gọi `toString()` thay vì `valueOf()`. [`Symbol.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive) bỏ qua gợi ý và luôn trả về một symbol, nghĩa là ngay cả trong ngữ cảnh chuỗi, {{jsxref("Symbol.prototype.toString()")}} sẽ không được gọi, và các đối tượng `Symbol` phải luôn được chuyển đổi rõ ràng thành chuỗi thông qua [`String()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String).

## Ví dụ

### Sửa đổi giá trị nguyên thủy được chuyển đổi từ một đối tượng

Ví dụ sau mô tả cách thuộc tính `Symbol.toPrimitive` có thể sửa đổi giá trị nguyên thủy được chuyển đổi từ một đối tượng.

```js
// Đối tượng không có thuộc tính Symbol.toPrimitive.
const obj1 = {};
console.log(+obj1); // NaN
console.log(`${obj1}`); // "[object Object]"
console.log(obj1 + ""); // "[object Object]"

// Đối tượng có thuộc tính Symbol.toPrimitive.
const obj2 = {
  [Symbol.toPrimitive](hint) {
    if (hint === "number") {
      return 10;
    }
    if (hint === "string") {
      return "hello";
    }
    return true;
  },
};
console.log(+obj2); // 10        — hint là "number"
console.log(`${obj2}`); // "hello"   — hint là "string"
console.log(obj2 + ""); // "true"    — hint là "default"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.toPrimitive` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- [`Date.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive)
- [`Symbol.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive)
- {{jsxref("Object.prototype.toString()")}}
- {{jsxref("Object.prototype.valueOf()")}}
