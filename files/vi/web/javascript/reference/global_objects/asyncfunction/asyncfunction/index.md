---
title: AsyncFunction() constructor
short-title: AsyncFunction()
slug: Web/JavaScript/Reference/Global_Objects/AsyncFunction/AsyncFunction
page-type: javascript-constructor
browser-compat: javascript.builtins.AsyncFunction.AsyncFunction
sidebar: jsref
---

> [!WARNING]
> Các đối số được truyền cho hàm tạo này được phân tích cú pháp và thực thi động như JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và là vectơ tiềm năng cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> Xem [Các cân nhắc bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function#security_considerations) trong tài liệu tham khảo hàm tạo `Function()` để biết thêm thông tin.

Hàm tạo **`AsyncFunction()`** tạo các đối tượng {{jsxref("AsyncFunction")}}.

Lưu ý rằng `AsyncFunction` _không_ phải là đối tượng toàn cục. Nó có thể được lấy bằng đoạn code sau:

```js
const AsyncFunction = async function () {}.constructor;
```

Hàm tạo `AsyncFunction()` không được thiết kế để sử dụng trực tiếp, và tất cả các cảnh báo được đề cập trong mô tả {{jsxref("Function/Function", "Function()")}} đều áp dụng cho `AsyncFunction()`.

## Cú pháp

```js-nolint
new AsyncFunction(functionBody)
new AsyncFunction(arg1, functionBody)
new AsyncFunction(arg1, arg2, functionBody)
new AsyncFunction(arg1, arg2, /* …, */ argN, functionBody)

AsyncFunction(functionBody)
AsyncFunction(arg1, functionBody)
AsyncFunction(arg1, arg2, functionBody)
AsyncFunction(arg1, arg2, /* …, */ argN, functionBody)
```

> [!NOTE]
> `AsyncFunction()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một thực thể `AsyncFunction` mới.

### Tham số

Xem {{jsxref("Function/Function", "Function()")}}.

## Ví dụ

Lưu ý rằng các ví dụ này bỏ qua việc sử dụng trusted types để ngắn gọn. Để xem code minh họa cách tiếp cận được khuyến nghị, hãy xem [Sử dụng `TrustedScript`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#using_trustedscript) trong `eval()`.

### Tạo một hàm async từ hàm tạo AsyncFunction()

```js
function resolveAfter2Seconds(x) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(x);
    }, 2000);
  });
}

const AsyncFunction = async function () {}.constructor;

const fn = new AsyncFunction(
  "a",
  "b",
  "return await resolveAfter2Seconds(a) + await resolveAfter2Seconds(b);",
);

fn(10, 20).then((v) => {
  console.log(v); // in ra 30 sau 4 giây
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function)
- [Biểu thức `async function`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function)
- [Hàm tạo `Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function)
