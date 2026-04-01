---
title: Set.prototype.entries()
short-title: entries()
slug: Web/JavaScript/Reference/Global_Objects/Set/entries
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.entries
sidebar: jsref
---

Phương thức **`entries()`** của các instance {{jsxref("Set")}} trả về một đối tượng _[set iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa **một mảng `[value, value]`** cho mỗi phần tử trong set này, theo thứ tự chèn. Đối với các đối tượng `Set` không có `key` như trong đối tượng `Map`. Tuy nhiên, để giữ API tương tự với đối tượng `Map`, mỗi _entry_ có cùng giá trị cho cả _key_ và _value_ ở đây, vì vậy một mảng `[value, value]` được trả về.

{{InteractiveExample("JavaScript Demo: Set.prototype.entries()")}}

```js interactive-example
const set = new Set();
set.add(42);
set.add("forty two");

const iterator = set.entries();

for (const entry of iterator) {
  console.log(entry);
  // Expected output: Array [42, 42]
  // Expected output: Array ["forty two", "forty two"]
}
```

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

### Sử dụng entries()

```js
const mySet = new Set();
mySet.add("foobar");
mySet.add(1);
mySet.add("baz");

const setIter = mySet.entries();

console.log(setIter.next().value); // ["foobar", "foobar"]
console.log(setIter.next().value); // [1, 1]
console.log(setIter.next().value); // ["baz", "baz"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set.prototype.keys()")}}
- {{jsxref("Set.prototype.values()")}}
