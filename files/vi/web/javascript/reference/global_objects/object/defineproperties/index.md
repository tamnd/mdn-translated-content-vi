---
title: Object.defineProperties()
short-title: defineProperties()
slug: Web/JavaScript/Reference/Global_Objects/Object/defineProperties
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.defineProperties
sidebar: jsref
---

Phương thức tĩnh **`Object.defineProperties()`** định nghĩa các thuộc tính mới hoặc sửa đổi các thuộc tính hiện có trực tiếp trên một đối tượng, trả về đối tượng đó.

{{InteractiveExample("JavaScript Demo: Object.defineProperties()")}}

```js interactive-example
const object = {};

Object.defineProperties(object, {
  property1: {
    value: 42,
    writable: true,
  },
  property2: {},
});

console.log(object.property1);
// Expected output: 42
```

## Cú pháp

```js-nolint
Object.defineProperties(obj, props)
```

### Tham số

- `obj`
  - : Đối tượng mà các thuộc tính cần được định nghĩa hoặc sửa đổi.
- `props`
  - : Một đối tượng mà các khóa đại diện cho tên của các thuộc tính cần được định nghĩa hoặc sửa đổi, và các giá trị là các đối tượng mô tả các thuộc tính đó. Mỗi giá trị trong `props` phải là data descriptor hoặc accessor descriptor; nó không thể là cả hai (xem {{jsxref("Object.defineProperty()")}} để biết thêm chi tiết).

    Data descriptor và accessor descriptor có thể tùy chọn chứa các khóa sau:
    - `configurable`
      - : `true` khi và chỉ khi kiểu của property descriptor này có thể được thay đổi và thuộc tính có thể bị xóa khỏi đối tượng tương ứng.
        **Mặc định là `false`.**
    - `enumerable`
      - : `true` khi và chỉ khi thuộc tính này xuất hiện trong quá trình liệt kê các thuộc tính trên đối tượng tương ứng.
        **Mặc định là `false`.**

    Data descriptor cũng có các khóa tùy chọn sau:
    - `value`
      - : Giá trị liên kết với thuộc tính. Có thể là bất kỳ giá trị JavaScript hợp lệ nào (số, đối tượng, hàm, v.v.).
        **Mặc định là {{jsxref("undefined")}}.**
    - `writable`
      - : `true` khi và chỉ khi giá trị liên kết với thuộc tính có thể được thay đổi bằng {{jsxref("Operators", "toán tử gán", "assignment_operators", 1)}}.
        **Mặc định là `false`.**

    Accessor descriptor cũng có các khóa tùy chọn sau:
    - `get`
      - : Một hàm đóng vai trò getter cho thuộc tính, hoặc {{jsxref("undefined")}} nếu không có getter. Giá trị trả về của hàm sẽ được sử dụng làm giá trị của thuộc tính.
        **Mặc định là {{jsxref("undefined")}}.**
    - `set`
      - : Một hàm đóng vai trò setter cho thuộc tính, hoặc {{jsxref("undefined")}} nếu không có setter. Hàm sẽ nhận giá trị mới đang được gán cho thuộc tính là đối số duy nhất.
        **Mặc định là {{jsxref("undefined")}}.**

    Nếu một descriptor không có bất kỳ khóa `value`, `writable`, `get` và `set` nào, nó được coi là data descriptor. Nếu một descriptor có cả `value` hoặc `writable` và `get` hoặc `set`, một ngoại lệ sẽ được ném ra.

### Giá trị trả về

Đối tượng đã được truyền vào hàm.

## Ví dụ

### Sử dụng Object.defineProperties

```js
const obj = {};
Object.defineProperties(obj, {
  property1: {
    value: true,
    writable: true,
  },
  property2: {
    value: "Hello",
    writable: false,
  },
  // v.v. v.v.
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.defineProperties` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.defineProperties`](https://www.npmjs.com/package/object.defineproperties)
- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.keys()")}}
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
