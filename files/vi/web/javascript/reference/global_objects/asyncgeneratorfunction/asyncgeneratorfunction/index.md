---
title: AsyncGeneratorFunction() constructor
short-title: AsyncGeneratorFunction()
slug: Web/JavaScript/Reference/Global_Objects/AsyncGeneratorFunction/AsyncGeneratorFunction
page-type: javascript-constructor
browser-compat: javascript.builtins.AsyncGeneratorFunction.AsyncGeneratorFunction
sidebar: jsref
---

> [!WARNING]
> Các đối số được truyền cho hàm tạo này được phân tích cú pháp và thực thi động như JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và là vectơ tiềm năng cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> Xem [Các cân nhắc bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function#security_considerations) trong tài liệu tham khảo hàm tạo `Function()` để biết thêm thông tin.

Hàm tạo **`AsyncGeneratorFunction()`** tạo các đối tượng {{jsxref("AsyncGeneratorFunction")}}.

Lưu ý rằng `AsyncGeneratorFunction` không phải là đối tượng toàn cục. Nó có thể được lấy bằng cách đánh giá đoạn code sau.

```js
const AsyncGeneratorFunction = async function* () {}.constructor;
```

Hàm tạo `AsyncGeneratorFunction()` không được thiết kế để sử dụng trực tiếp, và tất cả các cảnh báo được đề cập trong mô tả {{jsxref("Function/Function", "Function()")}} đều áp dụng cho `AsyncGeneratorFunction()`.

## Cú pháp

```js-nolint
new AsyncGeneratorFunction(functionBody)
new AsyncGeneratorFunction(arg1, functionBody)
new AsyncGeneratorFunction(arg1, arg2, functionBody)
new AsyncGeneratorFunction(arg1, arg2, /* …, */ argN, functionBody)

AsyncGeneratorFunction(functionBody)
AsyncGeneratorFunction(arg1, functionBody)
AsyncGeneratorFunction(arg1, arg2, functionBody)
AsyncGeneratorFunction(arg1, arg2, /* …, */ argN, functionBody)
```

> [!NOTE]
> `AsyncGeneratorFunction()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một thực thể `AsyncGeneratorFunction` mới.

### Tham số

Xem {{jsxref("Function/Function", "Function()")}}.

## Ví dụ

Lưu ý rằng các ví dụ này bỏ qua việc sử dụng trusted types để ngắn gọn. Để xem code minh họa cách tiếp cận được khuyến nghị, hãy xem [Sử dụng `TrustedScript`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#using_trustedscript) trong `eval()`.

### Sử dụng hàm tạo

Ví dụ sau sử dụng hàm tạo `AsyncGeneratorFunction` để tạo một hàm async generator.

```js
const AsyncGeneratorFunction = async function* () {}.constructor;
const createAsyncGenerator = new AsyncGeneratorFunction("a", "yield a * 2");
const asyncGen = createAsyncGenerator(10);
asyncGen.next().then((res) => console.log(res.value)); // 20
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*)
- [Biểu thức `async function*`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*)
- [Hàm tạo `Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function)
- Hướng dẫn [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
- {{jsxref("Functions", "Functions", "", 1)}}
