---
title: "SyntaxError: invalid assignment left-hand side"
slug: Web/JavaScript/Reference/Errors/Invalid_assignment_left-hand_side
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid assignment left-hand side" xảy ra khi có một phép gán không mong đợi ở đâu đó. Lỗi này có thể xảy ra khi dùng dấu `=` thay vì `==` hoặc `===`.

## Thông báo

```plain
SyntaxError: Invalid left-hand side in assignment (V8-based)
SyntaxError: invalid assignment left-hand side (Firefox)
SyntaxError: Left side of assignment is not a reference. (Safari)

ReferenceError: Invalid left-hand side in assignment (V8-based)
ReferenceError: cannot assign to function call (Firefox)
ReferenceError: Left side of assignment is not a reference. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}} hoặc {{jsxref("ReferenceError")}}, tùy thuộc vào cú pháp.

## Nguyên nhân?

Có một phép gán không mong đợi ở đâu đó. Nguyên nhân có thể là do nhầm lẫn giữa [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators#assignment_operators) và [toán tử so sánh bằng](/en-US/docs/Web/JavaScript/Reference/Operators#equality_operators). Trong khi dấu `=` đơn dùng để gán giá trị cho một biến, thì toán tử `==` hoặc `===` dùng để so sánh một giá trị.

## Ví dụ

### Phép gán không hợp lệ điển hình

```js-nolint example-bad
if (Math.PI + 1 = 3 || Math.PI + 1 = 4) {
  console.log("no way!");
}
// SyntaxError: invalid assignment left-hand side

const str = "Hello, "
+= "is it me "
+= "you're looking for?";
// SyntaxError: invalid assignment left-hand side
```

Trong câu lệnh `if`, bạn cần dùng toán tử so sánh bằng (`===`), và để nối chuỗi, cần dùng toán tử cộng (`+`).

```js-nolint example-good
if (Math.PI + 1 === 3 || Math.PI + 1 === 4) {
  console.log("no way!");
}

const str = "Hello, "
  + "from the "
  + "other side!";
```

### Phép gán gây ra ReferenceError

Các phép gán không hợp lệ không phải lúc nào cũng gây ra lỗi cú pháp. Đôi khi cú pháp gần như đúng, nhưng lúc thực thi, biểu thức ở vế trái được đánh giá thành một _giá trị_ thay vì một _tham chiếu_, nên phép gán vẫn không hợp lệ. Các lỗi như vậy xảy ra muộn hơn trong quá trình thực thi, khi câu lệnh thực sự được chạy.

```js-nolint example-bad
function foo() {
  return { a: 1 };
}
foo() = 1; // ReferenceError: invalid assignment left-hand side
```

Các lời gọi hàm, lời gọi [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super), và [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) đều là các giá trị chứ không phải tham chiếu. Nếu bạn muốn dùng chúng ở vế trái, mục tiêu gán cần phải là một thuộc tính của các giá trị mà chúng tạo ra.

```js example-good
function foo() {
  return { a: 1 };
}
foo().a = 1;
```

> [!NOTE]
> Trong Firefox và Safari, ví dụ đầu tiên tạo ra `ReferenceError` ở chế độ không nghiêm ngặt, và `SyntaxError` ở [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Chrome ném ra `ReferenceError` lúc chạy cho cả hai chế độ nghiêm ngặt và không nghiêm ngặt.

### Sử dụng optional chaining làm mục tiêu gán

[Optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) không phải là mục tiêu hợp lệ của phép gán.

```js-nolint example-bad
obj?.foo = 1; // SyntaxError: invalid assignment left-hand side
```

Thay vào đó, bạn phải kiểm tra trường hợp nullish trước.

```js example-good
if (obj) {
  obj.foo = 1;
}
```

## Xem thêm

- [Toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators#assignment_operators)
- [Toán tử so sánh bằng](/en-US/docs/Web/JavaScript/Reference/Operators#equality_operators)
