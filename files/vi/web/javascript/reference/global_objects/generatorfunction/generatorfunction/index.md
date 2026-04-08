---
title: GeneratorFunction() constructor
short-title: GeneratorFunction()
slug: Web/JavaScript/Reference/Global_Objects/GeneratorFunction/GeneratorFunction
page-type: javascript-constructor
browser-compat: javascript.builtins.GeneratorFunction.GeneratorFunction
sidebar: jsref
---

> [!WARNING]
> Các đối số được truyền cho hàm tạo này được phân tích cú pháp và thực thi động như JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và là vectơ tiềm năng cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> Xem [Các cân nhắc bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function#security_considerations) trong tài liệu tham khảo hàm tạo `Function()` để biết thêm thông tin.

Hàm tạo **`GeneratorFunction()`** tạo các đối tượng {{jsxref("GeneratorFunction")}}.

Lưu ý rằng `GeneratorFunction` _không_ phải là đối tượng toàn cục. Nó có thể được lấy bằng đoạn code sau:

```js
const GeneratorFunction = function* () {}.constructor;
```

Hàm tạo `GeneratorFunction()` không được thiết kế để sử dụng trực tiếp, và tất cả các cảnh báo được đề cập trong mô tả {{jsxref("Function/Function", "Function()")}} đều áp dụng cho `GeneratorFunction()`.

## Cú pháp

```js-nolint
new GeneratorFunction(functionBody)
new GeneratorFunction(arg1, functionBody)
new GeneratorFunction(arg1, arg2, functionBody)
new GeneratorFunction(arg1, arg2, /* …, */ argN, functionBody)

GeneratorFunction(functionBody)
GeneratorFunction(arg1, functionBody)
GeneratorFunction(arg1, arg2, functionBody)
GeneratorFunction(arg1, arg2, /* …, */ argN, functionBody)
```

> [!NOTE]
> `GeneratorFunction()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một thực thể `GeneratorFunction` mới.

### Tham số

Xem {{jsxref("Function/Function", "Function()")}}.

## Ví dụ

Lưu ý rằng các ví dụ này bỏ qua việc sử dụng trusted types để ngắn gọn. Để xem code minh họa cách tiếp cận được khuyến nghị, hãy xem [Sử dụng `TrustedScript`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#using_trustedscript) trong `eval()`.

### Tạo và sử dụng hàm tạo GeneratorFunction()

```js
const GeneratorFunction = function* () {}.constructor;
const g = new GeneratorFunction("a", "yield a * 2");
const iterator = g(10);
console.log(iterator.next().value); // 20
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*)
- [Biểu thức `function*`](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- [Hàm tạo `Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function)
- Hướng dẫn [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
- {{jsxref("Functions", "Functions", "", 1)}}
