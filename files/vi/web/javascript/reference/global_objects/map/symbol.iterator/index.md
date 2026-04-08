---
title: Map.prototype[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.@@iterator
sidebar: jsref
---

Phương thức **`[Symbol.iterator]()`** của các instance {{jsxref("Map")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép các đối tượng `Map` được sử dụng bởi hầu hết các cú pháp mong đợi iterable, chẳng hạn như [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về một [đối tượng map iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) cung cấp các cặp key-value của map theo thứ tự chèn.

Giá trị ban đầu của thuộc tính này là cùng đối tượng hàm với giá trị ban đầu của thuộc tính {{jsxref("Map.prototype.entries")}}.

{{InteractiveExample("JavaScript Demo: Map.prototype[Symbol.iterator]()")}}

```js interactive-example
const map = new Map();

map.set("0", "foo");
map.set(1, "bar");

const iterator = map[Symbol.iterator]();

for (const item of iterator) {
  console.log(item);
}
// Expected output: Array ["0", "foo"]
// Expected output: Array [1, "bar"]
```

## Cú pháp

```js-nolint
map[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị trả về giống như {{jsxref("Map.prototype.entries()")}}: một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới cung cấp các cặp key-value của map.

## Ví dụ

### Duyệt bằng vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` làm cho các đối tượng `Map` trở thành [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp duyệt như vòng lặp `for...of` tự động gọi phương thức này để lấy iterator để duyệt.

```js
const myMap = new Map();
myMap.set("0", "foo");
myMap.set(1, "bar");
myMap.set({}, "baz");

for (const entry of myMap) {
  console.log(entry);
}
// ["0", "foo"]
// [1, "bar"]
// [{}, "baz"]

for (const [key, value] of myMap) {
  console.log(`${key}: ${value}`);
}
// 0: foo
// 1: bar
// [Object]: baz
```

### Gọi iterator thủ công

Bạn vẫn có thể gọi thủ công phương thức `next()` của đối tượng iterator được trả về để đạt được tối đa quyền kiểm soát quá trình duyệt.

```js
const myMap = new Map();
myMap.set("0", "foo");
myMap.set(1, "bar");
myMap.set({}, "baz");

const mapIter = myMap[Symbol.iterator]();

console.log(mapIter.next().value); // ["0", "foo"]
console.log(mapIter.next().value); // [1, "bar"]
console.log(mapIter.next().value); // [Object, "baz"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Map.prototype.entries()")}}
- {{jsxref("Map.prototype.keys()")}}
- {{jsxref("Map.prototype.values()")}}
- {{jsxref("Symbol.iterator")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
