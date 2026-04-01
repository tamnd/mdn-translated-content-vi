---
title: Set.prototype.forEach()
short-title: forEach()
slug: Web/JavaScript/Reference/Global_Objects/Set/forEach
page-type: javascript-instance-method
browser-compat: javascript.builtins.Set.forEach
sidebar: jsref
---

Phương thức **`forEach()`** của các instance {{jsxref("Set")}} thực thi một hàm được cung cấp một lần cho mỗi value trong set này, theo thứ tự chèn.

{{InteractiveExample("JavaScript Demo: Set.prototype.forEach()")}}

```js interactive-example
function logSetElements(value1, value2, set) {
  console.log(`s[${value1}] = ${value2}`);
}

new Set(["foo", "bar", undefined]).forEach(logSetElements);

// Expected output: "s[foo] = foo"
// Expected output: "s[bar] = bar"
// Expected output: "s[undefined] = undefined"
```

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callback`
  - : Hàm được thực thi cho mỗi mục trong set. Hàm được gọi với các đối số sau:
    - `value`
      - : Giá trị của mỗi lần lặp.
    - `key`
      - : Key của mỗi lần lặp. Luôn luôn giống như `value`.
    - `set`
      - : Set đang được duyệt.
- `thisArg` {{optional_inline}}
  - : Giá trị được dùng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Phương thức `forEach()` thực thi `callback` được cung cấp một lần cho mỗi value thực sự tồn tại trong đối tượng `Set`. Nó không được gọi cho các value đã bị xóa. Tuy nhiên, nó được thực thi cho các value hiện diện nhưng có giá trị `undefined`.

`callback` được gọi với **ba đối số**:

- **giá trị phần tử**
- **key phần tử**
- **đối tượng `Set` đang được duyệt**

Không có key trong các đối tượng `Set`, tuy nhiên, vì vậy hai đối số đầu tiên đều là **các value** có trong {{jsxref("Set")}}. Điều này giúp nó nhất quán với các phương thức `forEach()` khác cho {{jsxref("Map/foreach", "Map")}} và {{jsxref("Array/forEach", "Array")}}.

Nếu tham số `thisArg` được cung cấp cho `forEach()`, nó sẽ được truyền tới `callback` khi được gọi, để dùng làm giá trị `this`. Ngược lại, giá trị `undefined` sẽ được truyền để dùng làm giá trị `this`. Giá trị `this` cuối cùng có thể quan sát được bởi `callback` được xác định theo [các quy tắc thông thường để xác định `this` mà một hàm nhìn thấy](/en-US/docs/Web/JavaScript/Reference/Operators/this).

Mỗi value được truy cập một lần, ngoại trừ trường hợp nó bị xóa và được thêm lại trước khi `forEach()` kết thúc. `callback` không được gọi cho các value bị xóa trước khi được truy cập. Các value mới được thêm trước khi `forEach()` kết thúc sẽ được truy cập.

`forEach()` thực thi hàm `callback` một lần cho mỗi phần tử trong đối tượng `Set`; nó không trả về giá trị.

## Ví dụ

### Ghi nội dung của đối tượng Set

Đoạn code sau ghi một dòng cho mỗi phần tử trong đối tượng `Set`:

```js
function logSetElements(value1, value2, set) {
  console.log(`s[${value1}] = ${value2}`);
}

new Set(["foo", "bar", undefined]).forEach(logSetElements);

// Logs:
// "s[foo] = foo"
// "s[bar] = bar"
// "s[undefined] = undefined"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Map.prototype.forEach()")}}
