---
title: WeakMap.prototype.getOrInsert()
short-title: getOrInsert()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/getOrInsert
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakMap.getOrInsert
sidebar: jsref
---

Phương thức **`getOrInsert()`** của các thực thể {{jsxref("WeakMap")}} trả về giá trị tương ứng với khóa được chỉ định trong `WeakMap` này. Nếu khóa không có mặt, nó chèn một mục mới với khóa và giá trị mặc định đã cho, và trả về giá trị được chèn vào.

Nếu việc tính toán giá trị mặc định tốn kém, hãy cân nhắc sử dụng {{jsxref("WeakMap.prototype.getOrInsertComputed()")}} thay thế, vì nó nhận một callback để tính giá trị mặc định chỉ khi thực sự cần thiết.

{{InteractiveExample("JavaScript Demo: WeakMap.prototype.getOrInsert()")}}

```js interactive-example
const map = new WeakMap([[window, "foo"]]);
console.log(map.getOrInsert(window, "default"));
// Expected output: "foo"

console.log(map.getOrInsert({}, "default"));
// Expected output: "default"
```

## Cú pháp

```js-nolint
getOrInsert(key, defaultValue)
```

### Tham số

- `key`
  - : Khóa của giá trị cần trả về từ đối tượng `WeakMap`. Phải là một đối tượng hoặc một [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Các khóa đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.
- `defaultValue`
  - : Giá trị cần chèn và trả về nếu khóa chưa có trong đối tượng `WeakMap`.

### Giá trị trả về

Giá trị được liên kết với khóa được chỉ định trong đối tượng `WeakMap`. Nếu không tìm thấy khóa, `defaultValue` được chèn và trả về.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `key` không phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).

## Ví dụ

### Sử dụng getOrInsert()

```js
const wm = new WeakMap();
const obj = {};

console.log(wm.get(obj)); // undefined
console.log(wm.getOrInsert(obj, "default")); // "default"
console.log(wm.get(obj)); // "default"
console.log(wm.getOrInsert(obj, "another default")); // "default"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `WeakMap.prototype.getOrInsert` trong `core-js`](https://github.com/zloirock/core-js#map-upsert)
- [Polyfill es-shims của `WeakMap.prototype.getOrInsert`](https://www.npmjs.com/package/weakmap.prototype.getorinsert)
- {{jsxref("WeakMap")}}
- {{jsxref("WeakMap.prototype.get()")}}
- {{jsxref("WeakMap.prototype.set()")}}
- {{jsxref("WeakMap.prototype.has()")}}
- {{jsxref("WeakMap.prototype.getOrInsertComputed()")}}
