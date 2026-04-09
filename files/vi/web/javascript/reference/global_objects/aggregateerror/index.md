---
title: AggregateError
slug: Web/JavaScript/Reference/Global_Objects/AggregateError
page-type: javascript-class
browser-compat: javascript.builtins.AggregateError
sidebar: jsref
---

Đối tượng **`AggregateError`** đại diện cho một lỗi khi nhiều lỗi cần được gói trong một lỗi duy nhất. Nó được ném ra khi nhiều lỗi cần được báo cáo bởi một hoạt động, ví dụ như bởi {{jsxref("Promise.any()")}}, khi tất cả các promise truyền vào nó đều bị từ chối.

So với {{jsxref("SuppressedError")}}, `AggregateError` đại diện cho danh sách các lỗi không liên quan, trong khi `SuppressedError` đại diện cho một lỗi xảy ra trong quá trình xử lý một lỗi khác.

`AggregateError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("AggregateError/AggregateError", "AggregateError()")}}
  - : Tạo đối tượng `AggregateError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `AggregateError.prototype` và được chia sẻ bởi tất cả các instance `AggregateError`.

- {{jsxref("Object/constructor", "AggregateError.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `AggregateError`, giá trị khởi tạo là constructor {{jsxref("AggregateError/AggregateError", "AggregateError")}}.
- {{jsxref("Error/name", "AggregateError.prototype.name")}}
  - : Đại diện cho tên của kiểu lỗi. Đối với `AggregateError.prototype.name`, giá trị khởi tạo là `"AggregateError"`.

Các thuộc tính này là thuộc tính riêng của mỗi instance `AggregateError`.

- {{jsxref("AggregateError/errors", "errors")}}
  - : Một mảng đại diện cho các lỗi đã được tổng hợp.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Bắt AggregateError

```js
Promise.any([Promise.reject(new Error("some error"))]).catch((e) => {
  console.log(e instanceof AggregateError); // true
  console.log(e.message); // "All Promises rejected"
  console.log(e.name); // "AggregateError"
  console.log(e.errors); // [ Error: "some error" ]
});
```

### Tạo AggregateError

```js
try {
  throw new AggregateError([new Error("some error")], "Hello");
} catch (e) {
  console.log(e instanceof AggregateError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "AggregateError"
  console.log(e.errors); // [ Error: "some error" ]
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `AggregateError` in `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- [es-shims polyfill of `AggregateError`](https://www.npmjs.com/package/es-aggregate-error)
- {{jsxref("Error")}}
- {{jsxref("Promise.any")}}
