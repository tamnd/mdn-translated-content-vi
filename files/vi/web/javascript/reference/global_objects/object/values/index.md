---
title: Object.values()
short-title: values()
slug: Web/JavaScript/Reference/Global_Objects/Object/values
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.values
sidebar: jsref
---

Phương thức tĩnh **`Object.values()`** trả về một mảng các giá trị thuộc tính chuỗi-khóa có thể đếm của chính đối tượng đã cho.

{{InteractiveExample("JavaScript Demo: Object.values()")}}

```js interactive-example
const object = {
  a: "some string",
  b: 42,
  c: false,
};

console.log(Object.values(object));
// Expected output: Array ["some string", 42, false]
```

## Cú pháp

```js-nolint
Object.values(obj)
```

### Tham số

- `obj`
  - : Một đối tượng.

### Giá trị trả về

Một mảng chứa các giá trị thuộc tính chuỗi-khóa có thể đếm của chính đối tượng đã cho.

## Mô tả

`Object.values()` trả về một mảng mà các phần tử là giá trị của các thuộc tính chuỗi-khóa có thể đếm được tìm thấy trực tiếp trên `object`. Điều này giống với việc lặp qua vòng lặp {{jsxref("Statements/for...in", "for...in")}}, ngoại trừ vòng lặp `for...in` cũng liệt kê các thuộc tính trong chuỗi prototype. Thứ tự của mảng được trả về bởi `Object.values()` giống với thứ tự được cung cấp bởi vòng lặp {{jsxref("Statements/for...in", "for...in")}}.

Nếu bạn cần các khóa thuộc tính, hãy sử dụng {{jsxref("Object.keys()")}} thay thế. Nếu bạn cần cả khóa lẫn giá trị thuộc tính, hãy sử dụng {{jsxref("Object.entries()")}} thay thế.

## Ví dụ

### Sử dụng Object.values()

```js
const obj = { foo: "bar", baz: 42 };
console.log(Object.values(obj)); // ['bar', 42]

// Array-like object
const arrayLikeObj1 = { 0: "a", 1: "b", 2: "c" };
console.log(Object.values(arrayLikeObj1)); // ['a', 'b', 'c']

// Array-like object with random key ordering
// When using numeric keys, the values are returned in the keys' numerical order
const arrayLikeObj2 = { 100: "a", 2: "b", 7: "c" };
console.log(Object.values(arrayLikeObj2)); // ['b', 'c', 'a']

// getFoo là thuộc tính không đếm được
const myObj = Object.create(
  {},
  {
    getFoo: {
      value() {
        return this.foo;
      },
    },
  },
);
myObj.foo = "bar";
console.log(Object.values(myObj)); // ['bar']
```

### Sử dụng Object.values() trên các giá trị nguyên thủy

Các đối số không phải đối tượng được [chuyển đổi thành đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion). [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) và [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) không thể chuyển đổi thành đối tượng và ném ra {{jsxref("TypeError")}} ngay lập tức. Chỉ chuỗi mới có thể có các thuộc tính có thể đếm của chính đối tượng, trong khi tất cả các giá trị nguyên thủy khác trả về một mảng rỗng.

```js
// Chuỗi có chỉ số là các thuộc tính có thể đếm của chính đối tượng
console.log(Object.values("foo")); // ['f', 'o', 'o']

// Các giá trị nguyên thủy khác ngoại trừ undefined và null không có thuộc tính riêng
console.log(Object.values(100)); // []
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.values` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.values`](https://www.npmjs.com/package/object.values)
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.keys()")}}
- {{jsxref("Object.entries()")}}
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
- {{jsxref("Object.create()")}}
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Map.prototype.values()")}}
