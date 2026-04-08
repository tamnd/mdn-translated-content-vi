---
title: "SyntaxError: new keyword cannot be used with an optional chain"
slug: Web/JavaScript/Reference/Errors/Bad_new_optional
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "new keyword cannot be used with an optional chain" xảy ra khi constructor của biểu thức {{jsxref("Operators/new", "new")}} là một [optional chain](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining), hoặc nếu có optional chain giữa constructor và danh sách đối số trong ngoặc.

## Thông báo

```plain
SyntaxError: Invalid optional chain from new expression (V8-based)
SyntaxError: new keyword cannot be used with an optional chain (Firefox)
SyntaxError: Cannot call constructor in an optional chain. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Có hai cách để gặp lỗi này. Cách thứ nhất là khi biểu thức constructor là một biểu thức optional chain, như sau:

```js-nolint example-bad
new Intl?.DateTimeFormat();
Number?.[parseMethod]`Hello, world!`;
```

Cách thứ hai là khi `?.` xuất hiện giữa constructor và danh sách đối số, như sau:

```js-nolint
new Intl.DateTimeFormat?.();
```

`new` tùy chọn bị cấm cụ thể vì cú pháp của nó phức tạp (`new` có và không có đối số), và kết quả không rõ ràng (đây sẽ là trường hợp duy nhất mà `new` không đánh giá thành giá trị đối tượng). Bạn cần dịch optional chaining sang điều kiện cơ bản (xem [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) để biết thêm thông tin).

```js
const result =
  Intl.DateTimeFormat === null || Intl.DateTimeFormat === undefined
    ? undefined
    : new Intl.DateTimeFormat();
```

Hãy nhớ rằng optional chaining chỉ short-circuit trong một đơn vị có ngoặc. Nếu bạn đặt biểu thức constructor trong ngoặc, optional chaining sẽ không gây ra lỗi, vì bây giờ constructor không short-circuit và kết quả là rõ ràng (constructor sẽ tạo ra `undefined` và sau đó khiến biểu thức `new` ném lỗi).

```js-nolint
new (Intl?.DateTimeFormat)(); // Throws if Intl?.DateTimeFormat is undefined
```

Tuy nhiên điều này có phần vô nghĩa vì optional chaining ngăn các lỗi bên trong chuỗi truy cập thuộc tính, nhưng sau đó được đảm bảo tạo ra lỗi khi gọi `new`. Bạn có thể vẫn muốn sử dụng kiểm tra điều kiện.

Lưu ý rằng optional chaining chỉ bị cấm như biểu thức constructor. Bạn có thể sử dụng optional chaining bên trong danh sách đối số, hoặc sử dụng optional chaining trên toàn bộ biểu thức `new`.

```js example-good
new Intl.DateTimeFormat(navigator?.languages);
new Intl.DateTimeFormat().resolvedOptions?.();
```

Lưu ý rằng không cần sử dụng `?.` trên bản thân biểu thức `new`: `new a()?.b`, vì `new` được đảm bảo tạo ra giá trị đối tượng không null.

## Xem thêm

- {{jsxref("Operators/new", "new")}}
- [Optional chaining (`?.`)](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)
- [Original discussion on whether "optional new" should be allowed](https://github.com/tc39/proposal-optional-chaining/issues/22)
