---
title: Error() constructor
short-title: Error()
slug: Web/JavaScript/Reference/Global_Objects/Error/Error
page-type: javascript-constructor
browser-compat: javascript.builtins.Error.Error
sidebar: jsref
---

Constructor **`Error()`** tạo ra các đối tượng {{jsxref("Error")}}.

## Cú pháp

```js-nolint
new Error()
new Error(message)
new Error(message, options)
new Error(message, fileName)
new Error(message, fileName, lineNumber)

Error()
Error(message)
Error(message, options)
Error(message, fileName)
Error(message, fileName, lineNumber)
```

> [!NOTE]
> `Error()` có thể được gọi với hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `Error` mới.

### Tham số

- `message` {{optional_inline}}
  - : Mô tả lỗi mà con người có thể đọc được.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `cause` {{optional_inline}}
      - : Một giá trị chỉ ra nguyên nhân cụ thể của lỗi, được phản ánh trong thuộc tính {{jsxref("Error/cause", "cause")}}. Khi bắt và ném lại một lỗi với thông báo lỗi cụ thể hơn hoặc hữu ích hơn, thuộc tính này có thể được dùng để truyền lỗi gốc.
- `fileName` {{optional_inline}} {{non-standard_inline}}
  - : Đường dẫn đến tệp đã tạo ra lỗi này, được phản ánh trong thuộc tính {{jsxref("Error/fileName", "fileName")}}. Mặc định là tên tệp chứa code đã gọi constructor `Error()`.
- `lineNumber` {{optional_inline}} {{non-standard_inline}}
  - : Số dòng trong tệp mà lỗi được tạo ra, được phản ánh trong thuộc tính {{jsxref("Error/lineNumber", "lineNumber")}}. Mặc định là số dòng chứa lời gọi constructor `Error()`.

## Ví dụ

### Gọi hàm hoặc tạo mới bằng new

Khi `Error` được dùng như một hàm, tức là không có {{jsxref("Operators/new", "new")}}, nó sẽ trả về một đối tượng `Error`.
Do đó, một lời gọi đơn thuần đến `Error` sẽ tạo ra cùng kết quả như khi xây dựng đối tượng `Error` thông qua từ khóa `new`.

```js
const x = Error("I was created using a function call!");

// above has the same functionality as following
const y = new Error('I was constructed via the "new" keyword!');
```

### Ném lại lỗi với nguyên nhân

Đôi khi hữu ích khi bắt một lỗi và ném lại nó với thông báo mới.
Trong trường hợp này, bạn nên truyền lỗi gốc vào constructor cho `Error` mới, như ví dụ dưới đây.

```js
try {
  frameworkThatCanThrow();
} catch (err) {
  throw new Error("New error message", { cause: err });
}
```

Để xem ví dụ chi tiết hơn, xem [Error > Phân biệt giữa các lỗi tương tự](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error#differentiate_between_similar_errors).

### Bỏ qua đối số options

JavaScript chỉ cố đọc `options.cause` nếu `options` là một đối tượng — điều này tránh sự nhập nhằng với chữ ký không chuẩn `Error(message, fileName, lineNumber)`, đòi hỏi tham số thứ hai phải là chuỗi. Nếu bạn bỏ qua `options`, truyền một giá trị nguyên thủy làm `options`, hoặc truyền một đối tượng không có thuộc tính `cause`, thì đối tượng `Error` được tạo ra sẽ không có thuộc tính `cause`.

```js
// Omitting options
const error1 = new Error("Error message");
console.log("cause" in error1); // false

// Passing a primitive value
const error2 = new Error("Error message", "");
console.log("cause" in error2); // false

// Passing an object without a cause property
const error3 = new Error("Error message", { details: "http error" });
console.log("cause" in error3); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Error` với hỗ trợ `cause` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-error)
- [Polyfill es-shims của Error `cause`](https://www.npmjs.com/package/error-cause)
- {{jsxref("Statements/throw", "throw")}}
- {{jsxref("Statements/try...catch", "try...catch")}}
- [Error causes](https://v8.dev/features/error-cause) trên v8.dev (2021)
