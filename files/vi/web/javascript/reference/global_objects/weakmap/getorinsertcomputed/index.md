---
title: WeakMap.prototype.getOrInsertComputed()
short-title: getOrInsertComputed()
slug: Web/JavaScript/Reference/Global_Objects/WeakMap/getOrInsertComputed
page-type: javascript-instance-method
browser-compat: javascript.builtins.WeakMap.getOrInsertComputed
sidebar: jsref
---

Phương thức **`getOrInsertComputed()`** của các thực thể {{jsxref("WeakMap")}} trả về giá trị tương ứng với khóa được chỉ định trong `WeakMap` này. Nếu khóa không có mặt, nó chèn một mục mới với khóa và giá trị mặc định được tính toán từ callback đã cho, và trả về giá trị được chèn vào.

Hãy sử dụng phương thức này thay vì {{jsxref("WeakMap.prototype.getOrInsert()")}} khi giá trị mặc định tốn kém để tính toán, và bạn muốn tránh tính toán nó trừ khi thực sự cần thiết.

{{InteractiveExample("JavaScript Demo: WeakMap.prototype.getOrInsertComputed()")}}

```js interactive-example
const alan = { name: "Alan" };
const map = new WeakMap([[alan, 35]]);
const defaultCreator = (obj) => `${obj.name}'s age is unknown`;

console.log(map.getOrInsertComputed(alan, defaultCreator));
// Expected output: 35

const brett = { name: "Brett" };
console.log(map.getOrInsertComputed(brett, defaultCreator));
// Expected output: "Brett's age is unknown"
```

## Cú pháp

```js-nolint
getOrInsertComputed(key, callback)
```

### Tham số

- `key`
  - : Khóa của phần tử cần trả về từ đối tượng `Map`. Phải là một đối tượng hoặc một [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Các khóa đối tượng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.
- `callback`
  - : Một hàm trả về giá trị cần chèn và trả về nếu khóa chưa có trong đối tượng `Map`. Hàm được gọi với đối số sau:
    - `key`
      - : Cùng khóa được truyền vào `getOrInsertComputed()`.

### Giá trị trả về

Giá trị được liên kết với khóa được chỉ định trong đối tượng `WeakMap`. Nếu không tìm thấy khóa, kết quả của `callback(key)` được chèn và trả về.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `key` không phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry).
    - `callback` không thể gọi được.

## Ví dụ

### Lưu vào bộ nhớ cache

Bộ nhớ cache liên quan đến việc xây dựng ánh xạ từ tham số của một hàm tốn kém đến giá trị trả về của nó, để các lần gọi trong tương lai với cùng tham số có thể trả về giá trị được lưu trong bộ nhớ cache thay vì tính toán lại. Khi không có giá trị được lưu trong bộ nhớ cache, nó cần được tính toán và chèn vào cache.

Chúng ta sử dụng `WeakMap` ở đây thay vì `Map`, để các giá trị đối số được lưu trong bộ nhớ cache không ngăn chúng bị thu gom rác nếu chúng không còn cần thiết ở nơi khác trong chương trình. Nếu hàm được lưu trong bộ nhớ cache của bạn nhận các đối số không phải đối tượng, bạn có thể sử dụng `Map` thay thế.

```js
// Any expensive function you want to cache
function computeExpensiveValue(requestOptions) {
  // Imagine expensive computation, like fetching data or complex calculations
  console.log(`Fetching from ${requestOptions.url}`);
  return new Response("Fake response");
}

// A higher-order function that adds caching to any function
function withCache(fn) {
  const cache = new WeakMap();
  return (param) => cache.getOrInsertComputed(param, fn);
}

const computeWithCache = withCache(computeExpensiveValue);
const options = { url: "https://example.com/a", method: "GET" };
const value1 = computeWithCache(options); // Logs "Fetching from https://example.com/a"
const value2 = computeWithCache(options); // No log
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `WeakMap.prototype.getOrInsertComputed` trong `core-js`](https://github.com/zloirock/core-js#map-upsert)
- [Polyfill es-shims của `WeakMap.prototype.getOrInsertComputed`](https://www.npmjs.com/package/weakmap.prototype.getorinsertcomputed)
- {{jsxref("WeakMap")}}
- {{jsxref("WeakMap.prototype.get()")}}
- {{jsxref("WeakMap.prototype.set()")}}
- {{jsxref("WeakMap.prototype.has()")}}
- {{jsxref("WeakMap.prototype.getOrInsert()")}}
