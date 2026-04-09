---
title: Object.prototype.propertyIsEnumerable()
short-title: propertyIsEnumerable()
slug: Web/JavaScript/Reference/Global_Objects/Object/propertyIsEnumerable
page-type: javascript-instance-method
browser-compat: javascript.builtins.Object.propertyIsEnumerable
sidebar: jsref
---

Phương thức **`propertyIsEnumerable()`** của các instance {{jsxref("Object")}} trả về một boolean cho biết liệu thuộc tính được chỉ định có phải là thuộc tính [enumerable của chính đối tượng](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) hay không.

{{InteractiveExample("JavaScript Demo: Object.prototype.propertyIsEnumerable()", "taller")}}

```js interactive-example
const object = {};
const array = [];
object.foo = 42;
array[0] = 42;

console.log(object.propertyIsEnumerable("foo"));
// Expected output: true

console.log(array.propertyIsEnumerable(0));
// Expected output: true

console.log(array.propertyIsEnumerable("length"));
// Expected output: false
```

## Cú pháp

```js-nolint
propertyIsEnumerable(prop)
```

### Tham số

- `prop`
  - : Tên thuộc tính cần kiểm tra. Có thể là chuỗi hoặc {{jsxref("Symbol")}}.

### Giá trị trả về

Giá trị boolean cho biết liệu thuộc tính được chỉ định có phải là enumerable và là thuộc tính của chính đối tượng hay không.

## Mô tả

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả trừ [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `propertyIsEnumerable()`. Phương thức này xác định xem thuộc tính được chỉ định, là chuỗi hoặc symbol, có phải là thuộc tính enumerable của chính đối tượng đó hay không. Nếu đối tượng không có thuộc tính được chỉ định, phương thức này trả về `false`.

Phương thức này tương đương với [`Object.getOwnPropertyDescriptor(obj, prop)?.enumerable ?? false`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor).

## Ví dụ

### Sử dụng propertyIsEnumerable()

Ví dụ sau minh họa cách sử dụng `propertyIsEnumerable()` trên đối tượng và mảng.

```js
const o = {};
const a = [];
o.prop = "is enumerable";
a[0] = "is enumerable";

o.propertyIsEnumerable("prop"); // true
a.propertyIsEnumerable(0); // true
```

### Đối tượng người dùng định nghĩa so với đối tượng dựng sẵn

Hầu hết các thuộc tính dựng sẵn mặc định không phải là enumerable, trong khi các thuộc tính của đối tượng do người dùng tạo thường là enumerable, trừ khi được chỉ định rõ ràng là không phải.

```js
const a = ["is enumerable"];

a.propertyIsEnumerable(0); // true
a.propertyIsEnumerable("length"); // false

Math.propertyIsEnumerable("random"); // false
globalThis.propertyIsEnumerable("Math"); // false
```

### Thuộc tính trực tiếp so với thuộc tính kế thừa

Chỉ các thuộc tính enumerable của chính đối tượng mới khiến `propertyIsEnumerable()` trả về `true`, mặc dù tất cả các thuộc tính enumerable, kể cả kế thừa, đều được duyệt bởi vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in).

```js
const o1 = {
  enumerableInherited: "is enumerable",
};
Object.defineProperty(o1, "nonEnumerableInherited", {
  value: "is non-enumerable",
  enumerable: false,
});
const o2 = {
  // o1 là prototype của o2
  __proto__: o1,
  enumerableOwn: "is enumerable",
};
Object.defineProperty(o2, "nonEnumerableOwn", {
  value: "is non-enumerable",
  enumerable: false,
});

o2.propertyIsEnumerable("enumerableInherited"); // false
o2.propertyIsEnumerable("nonEnumerableInherited"); // false
o2.propertyIsEnumerable("enumerableOwn"); // true
o2.propertyIsEnumerable("nonEnumerableOwn"); // false
```

### Kiểm tra thuộc tính symbol

Thuộc tính {{jsxref("Symbol")}} cũng được hỗ trợ bởi `propertyIsEnumerable()`. Lưu ý rằng hầu hết các phương thức đếm chỉ duyệt thuộc tính chuỗi; khả năng enumerable của thuộc tính symbol chỉ hữu ích khi sử dụng {{jsxref("Object.assign()")}} hoặc [spread syntax](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax). Để biết thêm thông tin, xem [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties).

```js
const sym = Symbol("enumerable");
const sym2 = Symbol("non-enumerable");
const o = {
  [sym]: "is enumerable",
};
Object.defineProperty(o, sym2, {
  value: "is non-enumerable",
  enumerable: false,
});

o.propertyIsEnumerable(sym); // true
o.propertyIsEnumerable(sym2); // false
```

### Sử dụng với đối tượng có prototype null

Vì các đối tượng có prototype `null` không kế thừa từ `Object.prototype`, chúng không kế thừa phương thức `propertyIsEnumerable()`. Bạn phải gọi `Object.prototype.propertyIsEnumerable` với đối tượng làm `this` thay thế.

```js
const o = {
  __proto__: null,
  enumerableOwn: "is enumerable",
};

o.propertyIsEnumerable("enumerableOwn"); // TypeError: o.propertyIsEnumerable is not a function
Object.prototype.propertyIsEnumerable.call(o, "enumerableOwn"); // true
```

Ngoài ra, bạn có thể dùng {{jsxref("Object.getOwnPropertyDescriptor()")}} thay thế, giúp phân biệt giữa thuộc tính không tồn tại và thuộc tính thực sự không enumerable.

```js
const o = {
  __proto__: null,
  enumerableOwn: "is enumerable",
};

Object.getOwnPropertyDescriptor(o, "enumerableOwn")?.enumerable; // true
Object.getOwnPropertyDescriptor(o, "nonExistent")?.enumerable; // undefined
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Statements/for...in", "for...in")}}
- {{jsxref("Object.keys()")}}
- {{jsxref("Object.defineProperty()")}}
