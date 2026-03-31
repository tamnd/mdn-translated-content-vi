---
title: Symbol.prototype[Symbol.toPrimitive]()
short-title: "[Symbol.toPrimitive]()"
slug: Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive
page-type: javascript-instance-method
browser-compat: javascript.builtins.Symbol.@@toPrimitive
sidebar: jsref
---

Phương thức **`[Symbol.toPrimitive]()`** của các giá trị {{jsxref("Symbol")}} trả về giá trị symbol này.

## Cú pháp

```js-nolint
symbolValue[Symbol.toPrimitive](hint)
```

### Tham số

- `hint`
  - : Giá trị chuỗi cho biết giá trị nguyên thủy cần trả về. Giá trị này bị bỏ qua.

### Giá trị trả về

Giá trị nguyên thủy của đối tượng {{jsxref("Symbol")}} đã chỉ định.

## Mô tả

Phương thức `[Symbol.toPrimitive]()` của {{jsxref("Symbol")}} trả về giá trị nguyên thủy của một đối tượng Symbol dưới dạng kiểu dữ liệu Symbol. Đối số `hint` không được dùng.

JavaScript gọi phương thức `[Symbol.toPrimitive]()` để chuyển đổi một đối tượng thành giá trị nguyên thủy. Bạn hiếm khi cần tự gọi phương thức `[Symbol.toPrimitive]()`; JavaScript tự động gọi nó khi gặp một đối tượng mà một giá trị nguyên thủy được mong đợi.

## Ví dụ

### Sử dụng `[Symbol.toPrimitive]()`

```js
const sym = Symbol("example");
sym === sym[Symbol.toPrimitive](); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Symbol.toPrimitive")}}
