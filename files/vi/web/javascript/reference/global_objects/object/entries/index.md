---
title: Object.entries()
short-title: entries()
slug: Web/JavaScript/Reference/Global_Objects/Object/entries
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.entries
sidebar: jsref
---

Phương thức tĩnh **`Object.entries()`** trả về một mảng các cặp khóa-giá trị của các thuộc tính chuỗi-khóa có thể đếm của chính đối tượng đã cho.

{{InteractiveExample("JavaScript Demo: Object.entries()")}}

```js interactive-example
const object = {
  a: "some string",
  b: 42,
};

for (const [key, value] of Object.entries(object)) {
  console.log(`${key}: ${value}`);
}

// Expected output:
// "a: some string"
// "b: 42"
```

## Cú pháp

```js-nolint
Object.entries(obj)
```

### Tham số

- `obj`
  - : Một đối tượng.

### Giá trị trả về

Một mảng các cặp khóa-giá trị của thuộc tính chuỗi-khóa có thể đếm của chính đối tượng đã cho. Mỗi cặp khóa-giá trị là một mảng gồm hai phần tử: phần tử đầu tiên là khóa thuộc tính (luôn là chuỗi), và phần tử thứ hai là giá trị thuộc tính.

## Mô tả

`Object.entries()` trả về một mảng mà các phần tử là các mảng tương ứng với các cặp khóa-giá trị của thuộc tính chuỗi-khóa có thể đếm được tìm thấy trực tiếp trên `object`. Điều này giống với việc lặp qua vòng lặp {{jsxref("Statements/for...in", "for...in")}}, ngoại trừ vòng lặp `for...in` cũng liệt kê các thuộc tính trong chuỗi prototype. Thứ tự của mảng được trả về bởi `Object.entries()` giống với thứ tự được cung cấp bởi vòng lặp {{jsxref("Statements/for...in", "for...in")}}.

Nếu bạn chỉ cần các khóa thuộc tính, hãy sử dụng {{jsxref("Object.keys()")}} thay thế. Nếu bạn chỉ cần các giá trị thuộc tính, hãy sử dụng {{jsxref("Object.values()")}} thay thế.

## Ví dụ

### Sử dụng Object.entries()

```js
const obj = { foo: "bar", baz: 42 };
console.log(Object.entries(obj)); // [ ['foo', 'bar'], ['baz', 42] ]

const arrayLike = { 0: "a", 1: "b", 2: "c" };
console.log(Object.entries(arrayLike)); // [ ['0', 'a'], ['1', 'b'], ['2', 'c'] ]

const randomKeyOrder = { 100: "a", 2: "b", 7: "c" };
console.log(Object.entries(randomKeyOrder)); // [ ['2', 'b'], ['7', 'c'], ['100', 'a'] ]

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
console.log(Object.entries(myObj)); // [ ['foo', 'bar'] ]
```

### Sử dụng Object.entries() trên các giá trị nguyên thủy

Các đối số không phải đối tượng được [chuyển đổi thành đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion). [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) và [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) không thể chuyển đổi thành đối tượng và ném {{jsxref("TypeError")}} ngay lập tức. Chỉ chuỗi mới có thể có các thuộc tính có thể đếm của chính đối tượng, trong khi tất cả các giá trị nguyên thủy khác trả về một mảng rỗng.

```js
// Chuỗi có chỉ số là các thuộc tính có thể đếm của chính đối tượng
console.log(Object.entries("foo")); // [ ['0', 'f'], ['1', 'o'], ['2', 'o'] ]

// Các giá trị nguyên thủy khác ngoại trừ undefined và null không có thuộc tính riêng
console.log(Object.entries(100)); // []
```

### Chuyển đổi Object sang Map

Hàm tạo {{jsxref("Map/Map", "Map()")}} chấp nhận một iterable của `entries`. Với `Object.entries`, bạn có thể dễ dàng chuyển đổi từ {{jsxref("Object")}} sang {{jsxref("Map")}}:

```js
const obj = { foo: "bar", baz: 42 };
const map = new Map(Object.entries(obj));
console.log(map); // Map(2) {"foo" => "bar", "baz" => 42}
```

### Lặp qua một Object

Sử dụng [array destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#array_destructuring), bạn có thể dễ dàng lặp qua các đối tượng.

```js
// Sử dụng vòng lặp for...of
const obj = { a: 5, b: 7, c: 9 };
for (const [key, value] of Object.entries(obj)) {
  console.log(`${key} ${value}`); // "a 5", "b 7", "c 9"
}

// Sử dụng các phương thức mảng
Object.entries(obj).forEach(([key, value]) => {
  console.log(`${key} ${value}`); // "a 5", "b 7", "c 9"
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.entries` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.entries`](https://www.npmjs.com/package/object.entries)
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.keys()")}}
- {{jsxref("Object.values()")}}
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
- {{jsxref("Object.create()")}}
- {{jsxref("Object.fromEntries()")}}
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Map.prototype.entries()")}}
