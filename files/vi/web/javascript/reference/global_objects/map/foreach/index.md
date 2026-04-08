---
title: Map.prototype.forEach()
short-title: forEach()
slug: Web/JavaScript/Reference/Global_Objects/Map/forEach
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.forEach
sidebar: jsref
---

Phương thức **`forEach()`** của các instance {{jsxref("Map")}} thực thi một hàm được cung cấp một lần cho mỗi cặp key/value trong map này, theo thứ tự chèn.

{{InteractiveExample("JavaScript Demo: Map.prototype.forEach()")}}

```js interactive-example
function logMapElements(value, key, map) {
  console.log(`m[${key}] = ${value}`);
}

new Map([
  ["foo", 3],
  ["bar", {}],
  ["baz", undefined],
]).forEach(logMapElements);

// Expected output: "m[foo] = 3"
// Expected output: "m[bar] = [object Object]"
// Expected output: "m[baz] = undefined"
```

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm được thực thi cho mỗi mục trong map. Hàm được gọi với các đối số sau:
    - `value`
      - : Giá trị của mỗi lần lặp.
    - `key`
      - : Key của mỗi lần lặp.
    - `map`
      - : Map đang được duyệt.
- `thisArg` {{optional_inline}}
  - : Giá trị được dùng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Phương thức `forEach` thực thi `callback` được cung cấp một lần cho mỗi key của map thực sự tồn tại. Nó không được gọi cho các key đã bị xóa. Tuy nhiên, nó được thực thi cho các value hiện diện nhưng có giá trị `undefined`.

`callback` được gọi với **ba đối số**:

- `value` của mục
- `key` của mục
- **đối tượng `Map`** đang được duyệt

Nếu tham số `thisArg` được cung cấp cho `forEach`, nó sẽ được truyền tới `callback` khi được gọi, để dùng làm giá trị `this` của nó. Ngược lại, giá trị `undefined` sẽ được truyền để dùng làm giá trị `this`. Giá trị `this` cuối cùng có thể quan sát được bởi `callback` được xác định theo [các quy tắc thông thường để xác định `this` mà một hàm nhìn thấy](/en-US/docs/Web/JavaScript/Reference/Operators/this).

Mỗi value được truy cập một lần, ngoại trừ trường hợp nó bị xóa và được thêm lại trước khi `forEach` kết thúc. `callback` không được gọi cho các value bị xóa trước khi được truy cập. Các value mới được thêm trước khi `forEach` kết thúc sẽ được truy cập.

## Ví dụ

### In nội dung của đối tượng Map

Đoạn code sau ghi một dòng cho mỗi phần tử trong đối tượng `Map`:

```js
function logMapElements(value, key, map) {
  console.log(`map.get('${key}') = ${value}`);
}
new Map([
  ["foo", 3],
  ["bar", {}],
  ["baz", undefined],
]).forEach(logMapElements);
// Logs:
// "map.get('foo') = 3"
// "map.get('bar') = [object Object]"
// "map.get('baz') = undefined"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Set.prototype.forEach()")}}
