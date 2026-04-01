---
title: Object.fromEntries()
short-title: fromEntries()
slug: Web/JavaScript/Reference/Global_Objects/Object/fromEntries
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.fromEntries
sidebar: jsref
---

Phương thức tĩnh **`Object.fromEntries()`** chuyển đổi một danh sách các cặp khóa-giá trị thành một đối tượng.

{{InteractiveExample("JavaScript Demo: Object.fromEntries()")}}

```js interactive-example
const entries = new Map([
  ["foo", "bar"],
  ["baz", 42],
]);

const obj = Object.fromEntries(entries);

console.log(obj);
// Expected output: Object { foo: "bar", baz: 42 }
```

## Cú pháp

```js-nolint
Object.fromEntries(iterable)
```

### Tham số

- `iterable`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), chẳng hạn như {{jsxref("Array")}} hoặc {{jsxref("Map")}}, chứa danh sách các đối tượng. Mỗi đối tượng nên có hai thuộc tính:
    - `0`
      - : Một chuỗi hoặc [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) đại diện cho khóa thuộc tính.
    - `1`
      - : Giá trị thuộc tính.

    Thông thường, đối tượng này được triển khai như một mảng gồm hai phần tử, với phần tử đầu tiên là khóa thuộc tính và phần tử thứ hai là giá trị thuộc tính.

### Giá trị trả về

Một đối tượng mới có các thuộc tính được cho bởi các entry của iterable.

## Mô tả

Phương thức `Object.fromEntries()` nhận một danh sách các cặp khóa-giá trị và trả về một đối tượng mới có các thuộc tính được cho bởi các entry đó. Đối số `iterable` được kỳ vọng là một đối tượng triển khai phương thức `[Symbol.iterator]()`. Phương thức này trả về một đối tượng iterator tạo ra các đối tượng giống mảng gồm hai phần tử. Phần tử đầu tiên là giá trị sẽ được dùng làm khóa thuộc tính, và phần tử thứ hai là giá trị để liên kết với khóa thuộc tính đó.

`Object.fromEntries()` thực hiện nghịch đảo của {{jsxref("Object.entries()")}}, ngoại trừ `Object.entries()` chỉ trả về các thuộc tính chuỗi-khóa, trong khi `Object.fromEntries()` cũng có thể tạo các thuộc tính symbol-khóa.

> [!NOTE]
> Không giống {{jsxref("Array.from()")}}, `Object.fromEntries()` không sử dụng giá trị của `this`, vì vậy việc gọi nó trên một hàm tạo khác sẽ không tạo ra các đối tượng của kiểu đó.

## Ví dụ

### Chuyển đổi Map thành Object

Với `Object.fromEntries`, bạn có thể chuyển đổi từ {{jsxref("Map")}} sang {{jsxref("Object")}}:

```js
const map = new Map([
  ["foo", "bar"],
  ["baz", 42],
]);
const obj = Object.fromEntries(map);
console.log(obj); // { foo: "bar", baz: 42 }
```

### Chuyển đổi Array thành Object

Với `Object.fromEntries`, bạn có thể chuyển đổi từ {{jsxref("Array")}} sang {{jsxref("Object")}}:

```js
const arr = [
  ["0", "a"],
  ["1", "b"],
  ["2", "c"],
];
const obj = Object.fromEntries(arr);
console.log(obj); // { 0: "a", 1: "b", 2: "c" }
```

### Biến đổi đối tượng

Với `Object.fromEntries`, phương thức nghịch đảo {{jsxref("Object.entries()")}} và [các phương thức thao tác mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#instance_methods), bạn có thể biến đổi các đối tượng như sau:

```js
const object1 = { a: 1, b: 2, c: 3 };

const object2 = Object.fromEntries(
  Object.entries(object1).map(([key, val]) => [key, val * 2]),
);

console.log(object2);
// { a: 2, b: 4, c: 6 }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.fromEntries` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.fromEntries`](https://www.npmjs.com/package/object.fromentries)
- {{jsxref("Object.entries()")}}
- {{jsxref("Object.keys()")}}
- {{jsxref("Object.values()")}}
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
- {{jsxref("Object.create()")}}
- {{jsxref("Map.prototype.entries()")}}
- {{jsxref("Map.prototype.keys()")}}
- {{jsxref("Map.prototype.values()")}}
