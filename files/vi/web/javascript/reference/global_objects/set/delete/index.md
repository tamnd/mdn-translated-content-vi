---
title: Set.prototype.delete()
short-title: delete()
slug: Web/JavaScript/Reference/Global_Objects/Set/delete
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.delete
sidebar: jsref
---

Phương thức **`delete()`** của các instance {{jsxref("Set")}} xóa giá trị được chỉ định khỏi set này, nếu giá trị đó có trong set.

{{InteractiveExample("JavaScript Demo: Set.prototype.delete()")}}

```js interactive-example
const set = new Set();
set.add({ x: 10, y: 20 }).add({ x: 20, y: 30 });

// Delete any point with `x > 10`.
set.forEach((point) => {
  if (point.x > 10) {
    set.delete(point);
  }
});

console.log(set.size);
// Expected output: 1
```

## Cú pháp

```js-nolint
setInstance.delete(value)
```

### Tham số

- `value`
  - : Giá trị cần xóa khỏi đối tượng `Set`. Các đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Giá trị trả về

`true` nếu một value trong đối tượng `Set` đã được xóa thành công. `false` nếu value không tìm thấy trong `Set`.

## Ví dụ

### Sử dụng delete()

```js
const mySet = new Set();
mySet.add("foo");

console.log(mySet.delete("bar")); // false; no "bar" element found to be deleted.
console.log(mySet.delete("foo")); // true; successfully removed.

console.log(mySet.has("foo")); // false; the "foo" element is no longer present.
```

### Xóa một đối tượng khỏi set

Vì các đối tượng được so sánh theo tham chiếu, bạn phải xóa chúng bằng cách kiểm tra từng thuộc tính nếu bạn không có tham chiếu đến đối tượng gốc.

```js
const setObj = new Set(); // Create a new set.

setObj.add({ x: 10, y: 20 }); // Add object in the set.

setObj.add({ x: 20, y: 30 }); // Add object in the set.

// Delete any point with `x > 10`.
setObj.forEach((point) => {
  if (point.x > 10) {
    setObj.delete(point);
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
- {{jsxref("Set.prototype.add()")}}
- {{jsxref("Set.prototype.clear()")}}
- {{jsxref("Set.prototype.has()")}}
