---
title: Map.prototype.getOrInsertComputed()
short-title: getOrInsertComputed()
slug: Web/JavaScript/Reference/Global_Objects/Map/getOrInsertComputed
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.getOrInsertComputed
sidebar: jsref
---

Phương thức **`getOrInsertComputed()`** của các instance {{jsxref("Map")}} trả về giá trị tương ứng với khóa được chỉ định trong `Map` này. Nếu khóa không có mặt, nó chèn một entry mới với khóa và giá trị mặc định được tính toán từ một callback đã cho, rồi trả về giá trị được chèn.

Dùng phương thức này thay vì {{jsxref("Map.prototype.getOrInsert()")}} khi giá trị mặc định tốn kém để tính toán, và bạn muốn tránh tính toán nó trừ khi thực sự cần.

{{InteractiveExample("JavaScript Demo: Map.prototype.getOrInsertComputed()")}}

```js interactive-example
const map = new Map([["bar", "foo"]]);
const defaultCreator = (key) => `default for ${key}`;

console.log(map.getOrInsertComputed("bar", defaultCreator));
// Expected output: "foo"

console.log(map.getOrInsertComputed("baz", defaultCreator));
// Expected output: "default for baz"
```

## Cú pháp

```js-nolint
getOrInsertComputed(key, callback)
```

### Tham số

- `key`
  - : Khóa của phần tử cần trả về từ đối tượng `Map`. Các khóa object được so sánh theo [reference](/en-US/docs/Glossary/Object_reference), không theo giá trị.
- `callback`
  - : Một hàm trả về giá trị cần chèn và trả về nếu khóa chưa có trong đối tượng `Map`. Hàm được gọi với đối số sau:
    - `key`
      - : Cùng khóa đã được truyền vào `getOrInsertComputed()`.

### Giá trị trả về

Giá trị được liên kết với khóa được chỉ định trong đối tượng `Map`. Nếu không tìm thấy khóa, kết quả của `callback(key)` được chèn vào và trả về.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `callback` không thể gọi được.

## Ví dụ

### Tránh tính toán giá trị mặc định không cần thiết

Khi dùng {{jsxref("Map.prototype.getOrInsert()")}}, giá trị mặc định được tính toán mỗi lần, ngay cả khi không cần thiết. Với `getOrInsertComputed()`, giá trị mặc định chỉ được tính toán khi cần.

```js
const map = new Map([["bar", "foo"]]);
const defaultCreator = (key) => {
  console.log(`Creating default for ${key}`);
  return `default for ${key}`;
};

map.getOrInsert("bar", defaultCreator("bar")); // Logs "Creating default for bar"
map.getOrInsertComputed("bar", defaultCreator); // No log
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Map.prototype.getOrInsertComputed` trong `core-js`](https://github.com/zloirock/core-js#map-upsert)
- [es-shims polyfill của `Map.prototype.getOrInsertComputed`](https://www.npmjs.com/package/map.prototype.getorinsertcomputed)
- {{jsxref("Map")}}
- {{jsxref("Map.prototype.get()")}}
- {{jsxref("Map.prototype.set()")}}
- {{jsxref("Map.prototype.has()")}}
- {{jsxref("Map.prototype.getOrInsert()")}}
