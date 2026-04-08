---
title: Object() constructor
short-title: Object()
slug: Web/JavaScript/Reference/Global_Objects/Object/Object
page-type: javascript-constructor
browser-compat: javascript.builtins.Object.Object
sidebar: jsref
---

Hàm tạo **`Object()`** chuyển đổi đầu vào thành một đối tượng. Hành vi của nó phụ thuộc vào kiểu của đầu vào.

## Cú pháp

```js-nolint
new Object()
new Object(value)

Object()
Object(value)
```

> [!NOTE]
> `Object()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), nhưng đôi khi với các hiệu ứng khác nhau. Xem [Giá trị trả về](#return_value).

### Tham số

- `value` {{optional_inline}}
  - : Bất kỳ giá trị nào.

### Giá trị trả về

Khi chính hàm tạo `Object()` được gọi hoặc được khởi tạo, giá trị trả về của nó là một đối tượng:

- Nếu giá trị là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}, nó tạo và trả về một đối tượng rỗng.
- Nếu giá trị đã là một đối tượng, nó trả về giá trị đó.
- Nếu không, nó trả về một đối tượng có kiểu tương ứng với giá trị đã cho. Ví dụ, truyền một giá trị nguyên thủy {{jsxref("BigInt")}} sẽ trả về một đối tượng bọc `BigInt`.

Khi `Object()` được khởi tạo nhưng [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) không phải là chính hàm tạo `Object`, hành vi sẽ hơi khác — nó khởi tạo một đối tượng mới với `new.target.prototype` làm prototype. Bất kỳ giá trị đối số nào đều bị bỏ qua. Điều này có thể xảy ra, ví dụ, khi `Object()` được gọi ngầm thông qua [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super) trong hàm tạo của một lớp [kế thừa `Object`](/en-US/docs/Web/JavaScript/Reference/Classes/extends#extending_object). Trong trường hợp này, dù bạn truyền một số vào `super()`, giá trị `this` bên trong hàm tạo vẫn không trở thành một thực thể {{jsxref("Number")}}.

## Ví dụ

### Tạo một Object mới

```js
const o = new Object();
o.foo = 42;

console.log(o);
// { foo: 42 }
```

### Sử dụng Object với các kiểu undefined và null

Các ví dụ sau lưu trữ một đối tượng `Object` rỗng trong `o`:

```js
const o = new Object();
```

```js
const o = new Object(undefined);
```

```js
const o = new Object(null);
```

### Lấy đối tượng bọc cho BigInt và Symbol

Các hàm tạo {{jsxref("BigInt/BigInt", "BigInt()")}} và {{jsxref("Symbol/Symbol", "Symbol()")}} ném lỗi khi được gọi với `new`, để tránh lỗi phổ biến là tạo ra đối tượng bọc thay vì giá trị nguyên thủy. Cách duy nhất để tạo đối tượng bọc cho các kiểu này là gọi `Object()` với chúng:

```js
const numberObj = new Number(1);
console.log(typeof numberObj); // "object"

const bigintObj = Object(1n);
console.log(typeof bigintObj); // "object"

const symbolObj = Object(Symbol("foo"));
console.log(typeof symbolObj); // "object"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
