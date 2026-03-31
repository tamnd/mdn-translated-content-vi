---
title: Reflect.set()
short-title: set()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/set
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.set
sidebar: jsref
---

Phương thức tĩnh **`Reflect.set()`** giống như cú pháp [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) và [gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment), nhưng dưới dạng hàm.

{{InteractiveExample("JavaScript Demo: Reflect.set()")}}

```js interactive-example
const object = {};
Reflect.set(object, "foo", 42);

console.log(object.foo);
// Expected output: 42

const array = ["duck", "duck", "duck"];
Reflect.set(array, 2, "goose");

console.log(array[2]);
// Expected output: "goose"
```

## Cú pháp

```js-nolint
Reflect.set(target, propertyKey, value)
Reflect.set(target, propertyKey, value, receiver)
```

### Tham số

- `target`
  - : Đối tượng target trên đó thiết lập thuộc tính.
- `propertyKey`
  - : Tên của thuộc tính cần thiết lập.
- `value`
  - : Giá trị cần thiết lập.
- `receiver` {{optional_inline}}
  - : Giá trị của `this` được cung cấp cho lời gọi đến setter cho `propertyKey` trên `target`. Nếu được cung cấp và `target` không có setter cho `propertyKey`, thuộc tính sẽ được thiết lập trên `receiver` thay thế.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết việc thiết lập thuộc tính có thành công hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là đối tượng.

## Mô tả

`Reflect.set()` cung cấp ngữ nghĩa phản chiếu của một [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Tức là, `Reflect.set(target, propertyKey, value, receiver)` tương đương về mặt ngữ nghĩa với:

```js
target[propertyKey] = value;
```

Lưu ý rằng trong một truy cập thuộc tính thông thường, `target` và `receiver` sẽ quan sát thấy là cùng một đối tượng.

`Reflect.set()` gọi phương thức nội tại `[[Set]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.set()

```js
// Object
const obj = {};
Reflect.set(obj, "prop", "value"); // true
obj.prop; // "value"

// Array
const arr = ["duck", "duck", "duck"];
Reflect.set(arr, 2, "goose"); // true
arr[2]; // "goose"

// It can truncate an array.
Reflect.set(arr, "length", 1); // true
arr; // ["duck"]

// With just one argument, propertyKey and value are "undefined".
Reflect.set(obj); // true
Reflect.getOwnPropertyDescriptor(obj, "undefined");
// { value: undefined, writable: true, enumerable: true, configurable: true }
```

### target và receiver khác nhau

Khi `target` và `receiver` khác nhau, `Reflect.set` sẽ dùng property descriptor của `target` (để tìm setter hoặc xác định xem thuộc tính có thể ghi được không), nhưng thiết lập thuộc tính trên `receiver`.

```js
const target = {};
const receiver = {};
Reflect.set(target, "a", 2, receiver); // true
// target is {}; receiver is { a: 2 }

const target = { a: 1 };
const receiver = {};
Reflect.set(target, "a", 2, receiver); // true
// target is { a: 1 }; receiver is { a: 2 }

const target = {
  set a(v) {
    this.b = v;
  },
};
const receiver = {};
Reflect.set(target, "a", 2, receiver); // true
// target is { a: [Setter] }; receiver is { b: 2 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.set` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
- [`handler.set()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/set)
