---
title: Logical OR assignment (||=)
slug: Web/JavaScript/Reference/Operators/Logical_OR_assignment
page-type: javascript-operator
browser-compat: javascript.operators.logical_or_assignment
sidebar: jssidebar
---

Toán tử **logical OR assignment (`||=`)** chỉ tính toán toán hạng bên phải và gán cho toán hạng bên trái nếu toán hạng bên trái là {{Glossary("falsy")}}.

{{InteractiveExample("JavaScript Demo: Logical OR assignment (||=) operator")}}

```js interactive-example
const a = { duration: 50, title: "" };

a.duration ||= 10;
console.log(a.duration);
// Expected output: 50

a.title ||= "title is empty.";
console.log(a.title);
// Expected output: "title is empty."
```

## Cú pháp

```js-nolint
x ||= y
```

## Mô tả

Logical OR assignment [_short-circuits_](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#short-circuiting), nghĩa là `x ||= y` tương đương với `x || (x = y)`, ngoại trừ biểu thức `x` chỉ được tính một lần.

Không có phép gán nào được thực hiện nếu toán hạng bên trái không phải falsy, do cơ chế short-circuit của toán tử [logical OR](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR). Ví dụ, đoạn mã dưới đây không ném lỗi dù `x` là `const`:

```js
const x = 1;
x ||= 2;
```

Đoạn mã dưới đây cũng không kích hoạt setter:

```js
const x = {
  get value() {
    return 1;
  },
  set value(v) {
    console.log("Setter called");
  },
};

x.value ||= 2;
```

Thực tế, nếu `x` không phải falsy thì `y` hoàn toàn không được tính toán.

```js
const x = 1;
x ||= console.log("y evaluated");
// Logs nothing
```

## Ví dụ

### Đặt nội dung mặc định

Nếu phần tử "lyrics" trống, hiển thị giá trị mặc định:

```js
document.getElementById("lyrics").textContent ||= "No lyrics.";
```

Ở đây cơ chế short-circuit đặc biệt hữu ích vì phần tử sẽ không bị cập nhật không cần thiết và không gây ra các tác dụng phụ không mong muốn như thêm công việc phân tích cú pháp hoặc render, hay mất focus, v.v.

Lưu ý: Hãy chú ý đến giá trị được trả về bởi API mà bạn đang kiểm tra. Nếu một chuỗi rỗng được trả về (giá trị {{Glossary("falsy")}}), phải dùng `||=` để "No lyrics." được hiển thị thay vì khoảng trắng. Tuy nhiên, nếu API trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}} trong trường hợp nội dung trống, nên dùng [`??=`](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment) thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Logical OR (`||`)](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR)
- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
- [Bitwise OR assignment (`|=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_OR_assignment)
- {{Glossary("Truthy")}}
- {{Glossary("Falsy")}}
