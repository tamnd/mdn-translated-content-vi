---
title: AsyncFunction
slug: Web/JavaScript/Reference/Global_Objects/AsyncFunction
page-type: javascript-class
browser-compat: javascript.builtins.AsyncFunction
sidebar: jsref
---

Đối tượng **`AsyncFunction`** cung cấp các phương thức cho [hàm async](/en-US/docs/Web/JavaScript/Reference/Statements/async_function). Trong JavaScript, mỗi hàm async thực ra là một đối tượng `AsyncFunction`.

Lưu ý rằng `AsyncFunction` _không_ phải là đối tượng toàn cục. Nó có thể được lấy bằng đoạn code sau:

```js
const AsyncFunction = async function () {}.constructor;
```

`AsyncFunction` là lớp con của {{jsxref("Function")}}.

## Constructor

- {{jsxref("AsyncFunction/AsyncFunction", "AsyncFunction()")}}
  - : Tạo đối tượng `AsyncFunction` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Function")}}_.

Các thuộc tính này được định nghĩa trên `AsyncFunction.prototype` và được chia sẻ bởi tất cả các instance `AsyncFunction`.

- {{jsxref("Object/constructor", "AsyncFunction.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `AsyncFunction`, giá trị khởi tạo là constructor {{jsxref("AsyncFunction/AsyncFunction", "AsyncFunction")}}.
- `AsyncFunction.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"AsyncFunction"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

> [!NOTE]
> Các instance `AsyncFunction` không có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype).

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Function")}}_.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function)
- [`async function` expression](/en-US/docs/Web/JavaScript/Reference/Operators/async_function)
- {{jsxref("Function")}}
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("GeneratorFunction")}}
- {{jsxref("Functions", "Functions", "", 1)}}
