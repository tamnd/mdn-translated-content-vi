---
title: InternalError
slug: Web/JavaScript/Reference/Global_Objects/InternalError
page-type: javascript-class
status:
  - non-standard
browser-compat: javascript.builtins.InternalError
sidebar: jsref
---

{{Non-standard_Header}}

Đối tượng **`InternalError`** chỉ ra một lỗi xảy ra bên trong JavaScript engine.

Các trường hợp ví dụ thường xảy ra khi điều gì đó quá lớn, chẳng hạn:

- "too many switch cases" (quá nhiều case trong switch),
- "too many parentheses in regular expression" (quá nhiều dấu ngoặc đơn trong biểu thức chính quy),
- "array initializer too large" (bộ khởi tạo mảng quá lớn),
- "too much recursion" (quá nhiều đệ quy).

`InternalError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("InternalError/InternalError", "InternalError()")}} {{non-standard_inline}}
  - : Tạo một đối tượng `InternalError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `InternalError.prototype` và được chia sẻ bởi tất cả các instance `InternalError`.

- {{jsxref("Object/constructor", "InternalError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `InternalError`, giá trị khởi tạo là constructor {{jsxref("InternalError/InternalError", "InternalError")}}.
- {{jsxref("Error/name", "InternalError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `InternalError.prototype.name`, giá trị khởi tạo là `"InternalError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Quá nhiều đệ quy

Hàm đệ quy này chạy 10 lần, theo điều kiện thoát.

```js
function loop(x) {
  // "x >= 10" is the exit condition
  if (x >= 10) return;

  // do stuff
  loop(x + 1); // the recursive call
}
loop(0);
```

Đặt điều kiện này thành một giá trị cực kỳ lớn có thể không hoạt động:

```js example-bad
function loop(x) {
  if (x >= 1000000000000) return;

  // do stuff
  loop(x + 1);
}
loop(0);

// InternalError: too much recursion
```

Để biết thêm thông tin, xem [InternalError: too much recursion.](/en-US/docs/Web/JavaScript/Reference/Errors/Too_much_recursion)

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- [InternalError: too much recursion](/en-US/docs/Web/JavaScript/Reference/Errors/Too_much_recursion)
