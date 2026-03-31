---
title: "SyntaxError: invalid assignment left-hand side"
slug: Web/JavaScript/Reference/Errors/Invalid_assignment_left-hand_side
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid assignment left-hand side" xảy ra khi có một phép gán không mong đợi ở đâu đó. Nó có thể được kích hoạt khi một dấu `=` đơn được sử dụng thay vì `==` hoặc `===`.

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

## Điều gì đã xảy ra?

Có một phép gán không mong đợi ở đâu đó. Điều này có thể do sự không khớp giữa [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators#assignment_operators) và [toán tử so sánh bằng](/en-US/docs/Web/JavaScript/Reference/Operators#equality_operators), ví dụ. Trong khi một dấu `=` đơn gán giá trị cho một biến, các toán tử `==` hoặc `===` so sánh một giá trị.

## Ví dụ

### Các phép gán không hợp lệ điển hình

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

Trong câu lệnh `if`, bạn muốn sử dụng toán tử so sánh bằng (`===`), và để nối chuỗi, cần toán tử cộng (`+`).

```js-nolint example-good
if (Math.PI + 1 === 3 || Math.PI + 1 === 4) {
  console.log("no way!");
}

const str = "Hello, "
  + "from the "
  + "other side!";
```

### Các phép gán tạo ra ReferenceError

Các phép gán không hợp lệ không phải lúc nào cũng tạo ra lỗi cú pháp. Đôi khi cú pháp gần đúng, nhưng tại thời điểm chạy, biểu thức vế trái đánh giá thành _giá trị_ thay vì _tham chiếu_, vì vậy phép gán vẫn không hợp lệ. Các lỗi như vậy xảy ra muộn hơn trong quá trình thực thi, khi câu lệnh thực sự được thực thi.

```js-nolint example-bad
function foo() {
  return { a: 1 };
}
foo() = 1; // ReferenceError: invalid assignment left-hand side
```

Lời gọi hàm, lời gọi [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super), và [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) đều là các giá trị thay vì tham chiếu. Nếu bạn muốn sử dụng chúng ở vế trái, đích gán cần phải là thuộc tính của các giá trị được tạo ra bởi chúng.

```js example-good
function foo() {
  return { a: 1 };
}
foo().a = 1;
```

> [!NOTE]
> Trong Firefox và Safari, ví dụ đầu tiên tạo ra `ReferenceError` trong chế độ non-strict, và `SyntaxError` trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Chrome ném `ReferenceError` tại thời điểm chạy cho cả chế độ strict và non-strict.

### Sử dụng optional chaining làm đích gán

[Optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) không phải là đích gán hợp lệ.

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
