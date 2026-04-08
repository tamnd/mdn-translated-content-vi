---
title: Object.hasOwn()
short-title: hasOwn()
slug: Web/JavaScript/Reference/Global_Objects/Object/hasOwn
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.hasOwn
sidebar: jsref
---

Phương thức tĩnh **`Object.hasOwn()`** trả về `true` nếu đối tượng được chỉ định có thuộc tính được chỉ định là thuộc tính _riêng_ của nó. Nếu thuộc tính được kế thừa, hoặc không tồn tại, phương thức trả về `false`.

> [!NOTE]
> `Object.hasOwn()` được dự định là sự thay thế cho {{jsxref("Object.prototype.hasOwnProperty()")}}.

{{InteractiveExample("JavaScript Demo: Object.hasOwn()")}}

```js interactive-example
const object = {
  prop: "exists",
};

console.log(Object.hasOwn(object, "prop"));
// Expected output: true

console.log(Object.hasOwn(object, "toString"));
// Expected output: false

console.log(Object.hasOwn(object, "undeclaredPropertyValue"));
// Expected output: false
```

## Cú pháp

```js-nolint
Object.hasOwn(obj, prop)
```

### Tham số

- `obj`
  - : Instance đối tượng JavaScript cần kiểm tra.
- `prop`
  - : Tên {{jsxref("String")}} hoặc [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) của thuộc tính cần kiểm tra.

### Giá trị trả về

`true` nếu đối tượng được chỉ định đã định nghĩa trực tiếp thuộc tính được chỉ định. Nếu không thì `false`.

## Mô tả

Phương thức `Object.hasOwn()` trả về `true` nếu thuộc tính được chỉ định là thuộc tính trực tiếp của đối tượng — ngay cả khi giá trị thuộc tính là `null` hoặc `undefined`. Phương thức trả về `false` nếu thuộc tính được kế thừa, hoặc chưa được khai báo. Không giống toán tử {{jsxref("Operators/in", "in")}}, phương thức này không kiểm tra thuộc tính được chỉ định trong chuỗi prototype của đối tượng.

Nó được khuyến nghị thay cho {{jsxref("Object.prototype.hasOwnProperty()")}} vì nó hoạt động với các [đối tượng `null`-prototype](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) và với các đối tượng đã ghi đè phương thức `hasOwnProperty()` kế thừa. Mặc dù có thể giải quyết các vấn đề này bằng cách truy cập `Object.prototype.hasOwnProperty()` trên một đối tượng khác (như `Object.prototype.hasOwnProperty.call(obj, prop)`), `Object.hasOwn()` trực quan và súc tích hơn.

## Ví dụ

### Sử dụng Object.hasOwn() để kiểm tra sự tồn tại của thuộc tính

Đoạn code sau cho thấy cách xác định xem đối tượng `example` có chứa thuộc tính có tên `prop` hay không.

```js
const example = {};
Object.hasOwn(example, "prop"); // false - 'prop' chưa được định nghĩa

example.prop = "exists";
Object.hasOwn(example, "prop"); // true - 'prop' đã được định nghĩa

example.prop = null;
Object.hasOwn(example, "prop"); // true - thuộc tính riêng tồn tại với giá trị là null

example.prop = undefined;
Object.hasOwn(example, "prop"); // true - thuộc tính riêng tồn tại với giá trị là undefined
```

### Thuộc tính trực tiếp và kế thừa

Ví dụ sau phân biệt giữa thuộc tính trực tiếp và thuộc tính được kế thừa qua chuỗi prototype:

```js
const example = {};
example.prop = "exists";

// `hasOwn` chỉ trả về true cho thuộc tính trực tiếp:
Object.hasOwn(example, "prop"); // true
Object.hasOwn(example, "toString"); // false
Object.hasOwn(example, "hasOwnProperty"); // false

// Toán tử `in` sẽ trả về true cho thuộc tính trực tiếp hoặc kế thừa:
"prop" in example; // true
"toString" in example; // true
"hasOwnProperty" in example; // true
```

### Lặp qua các thuộc tính của một đối tượng

Để lặp qua các thuộc tính có thể đếm của đối tượng, bạn _nên_ sử dụng:

```js
const example = { foo: true, bar: true };
for (const name of Object.keys(example)) {
  // …
}
```

Nhưng nếu bạn cần sử dụng `for...in`, bạn có thể sử dụng `Object.hasOwn()` để bỏ qua các thuộc tính kế thừa:

```js
const example = { foo: true, bar: true };
for (const name in example) {
  if (Object.hasOwn(example, name)) {
    // …
  }
}
```

### Kiểm tra xem chỉ số mảng có tồn tại hay không

Các phần tử của {{jsxref("Array")}} được định nghĩa là thuộc tính trực tiếp, vì vậy bạn có thể sử dụng phương thức `hasOwn()` để kiểm tra xem một chỉ số cụ thể có tồn tại hay không:

```js
const fruits = ["Apple", "Banana", "Watermelon", "Orange"];
Object.hasOwn(fruits, 3); // true ('Orange')
Object.hasOwn(fruits, 4); // false - không được định nghĩa
```

### Các trường hợp có vấn đề với hasOwnProperty()

Phần này chứng minh rằng `Object.hasOwn()` miễn nhiễm với các vấn đề ảnh hưởng đến `hasOwnProperty()`. Đầu tiên, nó có thể được sử dụng với các đối tượng đã triển khai lại `hasOwnProperty()`. Trong ví dụ dưới đây, phương thức `hasOwnProperty()` được triển khai lại báo cáo false cho _mọi_ thuộc tính, nhưng hành vi của `Object.hasOwn()` vẫn không bị ảnh hưởng:

```js
const foo = {
  hasOwnProperty() {
    return false;
  },
  bar: "The dragons be out of office",
};

console.log(foo.hasOwnProperty("bar")); // false

console.log(Object.hasOwn(foo, "bar")); // true
```

Nó cũng có thể được sử dụng với các [đối tượng `null`-prototype](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects). Các đối tượng này không kế thừa từ `Object.prototype`, vì vậy `hasOwnProperty()` không thể truy cập.

```js
const foo = Object.create(null);
foo.prop = "exists";

console.log(foo.hasOwnProperty("prop"));
// Uncaught TypeError: foo.hasOwnProperty is not a function

console.log(Object.hasOwn(foo, "prop")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.hasOwn` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.hasOwn`](https://www.npmjs.com/package/object.hasown)
- {{jsxref("Object.prototype.hasOwnProperty()")}}
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Statements/for...in", "for...in")}}
- {{jsxref("Operators/in", "in")}}
- [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
