---
title: Set.prototype[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.@@iterator
sidebar: jsref
---

Phương thức **`[Symbol.iterator]()`** của các instance {{jsxref("Set")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép các đối tượng `Set` được sử dụng bởi hầu hết các cú pháp mong đợi iterable, chẳng hạn như [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về một [đối tượng set iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) cung cấp các value của set theo thứ tự chèn.

Giá trị ban đầu của thuộc tính này là cùng đối tượng hàm với giá trị ban đầu của thuộc tính {{jsxref("Set.prototype.values")}}.

{{InteractiveExample("JavaScript Demo: Set.prototype[Symbol.iterator]()")}}

```js interactive-example
const set = new Set();

set.add(42);
set.add("forty two");

const iterator = set[Symbol.iterator]();

console.log(iterator.next().value);
// Expected output: 42

console.log(iterator.next().value);
// Expected output: "forty two"
```

## Cú pháp

```js-nolint
set[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị trả về giống như {{jsxref("Set.prototype.values()")}}: một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới cung cấp các value của set.

## Ví dụ

### Duyệt bằng vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` làm cho các đối tượng `Set` trở thành [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp duyệt như vòng lặp `for...of` tự động gọi phương thức này để lấy iterator để duyệt.

```js
const mySet = new Set();
mySet.add("0");
mySet.add(1);
mySet.add({});

for (const v of mySet) {
  console.log(v);
}
```

### Gọi iterator thủ công

Bạn vẫn có thể gọi thủ công phương thức `next()` của đối tượng iterator được trả về để đạt được tối đa quyền kiểm soát quá trình duyệt.

```js
const mySet = new Set();
mySet.add("0");
mySet.add(1);
mySet.add({});

const setIter = mySet[Symbol.iterator]();

console.log(setIter.next().value); // "0"
console.log(setIter.next().value); // 1
console.log(setIter.next().value); // {}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
- {{jsxref("Set.prototype.entries()")}}
- {{jsxref("Set.prototype.keys()")}}
- {{jsxref("Set.prototype.values()")}}
- {{jsxref("Symbol.iterator")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
