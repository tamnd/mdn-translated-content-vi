---
title: Object.keys()
short-title: keys()
slug: Web/JavaScript/Reference/Global_Objects/Object/keys
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.keys
sidebar: jsref
---

Phương thức tĩnh **`Object.keys()`** trả về một mảng các tên thuộc tính string-keyed enumerable của chính đối tượng đã cho.

{{InteractiveExample("JavaScript Demo: Object.keys()")}}

```js interactive-example
const object = {
  a: "some string",
  b: 42,
  c: false,
};

console.log(Object.keys(object));
// Expected output: Array ["a", "b", "c"]
```

## Cú pháp

```js-nolint
Object.keys(obj)
```

### Tham số

- `obj`
  - : Một đối tượng.

### Giá trị trả về

Một mảng các chuỗi đại diện cho các key thuộc tính string-keyed enumerable của chính đối tượng đã cho.

## Mô tả

`Object.keys()` trả về một mảng mà các phần tử là các chuỗi tương ứng với các tên thuộc tính string-keyed enumerable được tìm thấy trực tiếp trên `object`. Điều này giống như việc duyệt bằng vòng lặp {{jsxref("Statements/for...in", "for...in")}}, ngoại trừ vòng lặp `for...in` còn duyệt các thuộc tính trên chuỗi prototype. Thứ tự của mảng được trả về bởi `Object.keys()` giống với thứ tự được cung cấp bởi vòng lặp {{jsxref("Statements/for...in", "for...in")}}.

Nếu bạn cần các giá trị thuộc tính, hãy dùng {{jsxref("Object.values()")}} thay thế. Nếu bạn cần cả key lẫn giá trị, hãy dùng {{jsxref("Object.entries()")}} thay thế.

## Ví dụ

### Sử dụng Object.keys()

```js
// Mảng cơ bản
const arr = ["a", "b", "c"];
console.log(Object.keys(arr)); // ['0', '1', '2']

// Đối tượng giống mảng
const obj = { 0: "a", 1: "b", 2: "c" };
console.log(Object.keys(obj)); // ['0', '1', '2']

// Đối tượng giống mảng với thứ tự key ngẫu nhiên
const anObj = { 100: "a", 2: "b", 7: "c" };
console.log(Object.keys(anObj)); // ['2', '7', '100']

// getFoo là thuộc tính không enumerable
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
myObj.foo = 1;
console.log(Object.keys(myObj)); // ['foo']
```

Nếu bạn muốn _tất cả_ các thuộc tính string-keyed của chính đối tượng, kể cả các thuộc tính không enumerable, xem {{jsxref("Object.getOwnPropertyNames()")}}.

### Sử dụng Object.keys() với kiểu nguyên thủy

Các đối số không phải đối tượng sẽ được [ép kiểu thành đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion). [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) và [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) không thể ép kiểu thành đối tượng và sẽ ném {{jsxref("TypeError")}} ngay lập tức. Chỉ chuỗi có thể có thuộc tính enumerable của chính nó, trong khi tất cả các kiểu nguyên thủy khác đều trả về mảng rỗng.

```js
// Chuỗi có các chỉ số là thuộc tính enumerable của chính nó
console.log(Object.keys("foo")); // ['0', '1', '2']

// Các kiểu nguyên thủy khác ngoài undefined và null không có thuộc tính riêng
console.log(Object.keys(100)); // []
```

> [!NOTE]
> Trong ES5, việc truyền một giá trị không phải đối tượng vào `Object.keys()` sẽ ném {{jsxref("TypeError")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Object.keys` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill của `Object.keys`](https://www.npmjs.com/package/object-key)
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.entries()")}}
- {{jsxref("Object.values()")}}
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
- {{jsxref("Object.create()")}}
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Map.prototype.keys()")}}
