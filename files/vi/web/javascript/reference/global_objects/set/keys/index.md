---
title: Set.prototype.keys()
short-title: keys()
slug: Web/JavaScript/Reference/Global_Objects/Set/keys
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.keys
sidebar: jsref
---

Phương thức **`keys()`** của các instance {{jsxref("Set")}} là bí danh cho phương thức [`values()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/values).

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

### Sử dụng keys()

Phương thức `keys()` hoàn toàn tương đương với phương thức {{jsxref("Set/values", "values()")}}.

```js
const mySet = new Set();
mySet.add("foo");
mySet.add("bar");
mySet.add("baz");

const setIter = mySet.keys();

console.log(setIter.next().value); // "foo"
console.log(setIter.next().value); // "bar"
console.log(setIter.next().value); // "baz"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set.prototype.entries()")}}
- {{jsxref("Set.prototype.values()")}}
