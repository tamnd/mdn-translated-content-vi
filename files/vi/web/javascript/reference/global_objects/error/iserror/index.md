---
title: Error.isError()
short-title: isError()
slug: Web/JavaScript/Reference/Global_Objects/Error/isError
page-type: javascript-static-method
browser-compat: javascript.builtins.Error.isError
sidebar: jsref
---

Phương thức tĩnh **`Error.isError()`** xác định xem giá trị được truyền vào có phải là một {{jsxref("Error")}} hay không.

## Cú pháp

```js-nolint
Error.isError(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra.

### Giá trị trả về

`true` nếu `value` là một {{jsxref("Error")}}; ngược lại là `false`.

## Mô tả

`Error.isError()` kiểm tra xem giá trị được truyền vào có phải là một {{jsxref("Error")}} hay không. Nó thực hiện điều này bằng cách thực hiện _kiểm tra nhãn hiệu_ (branded check) cho một trường private được khởi tạo bởi constructor {{jsxref("Error/Error", "Error()")}}.
Đây là cơ chế tương tự được sử dụng bởi {{jsxref("Array.isArray()")}}, tương tự như cơ chế được sử dụng bởi toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in).

Đây là một lựa chọn thay thế mạnh mẽ hơn cho [`instanceof Error`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) vì nó tránh được kết quả dương tính giả và âm tính giả:

- `Error.isError()` từ chối các giá trị không phải là các instance `Error` thực sự, ngay cả khi chúng có `Error.prototype` trong chuỗi prototype của chúng — `instanceof Error` sẽ chấp nhận những giá trị này vì nó kiểm tra chuỗi prototype.
- `Error.isError()` chấp nhận các đối tượng `Error` được tạo trong một realm khác — `instanceof Error` trả về `false` cho những đối tượng này vì danh tính của constructor `Error` khác nhau giữa các realm.

`Error.isError()` trả về `true` cho các instance {{domxref("DOMException")}}. Điều này là vì, mặc dù `DOMException` không được chỉ định là một lớp con thực sự của `Error` (constructor `Error` không phải là prototype của constructor `DOMException`), `DOMException` vẫn hoạt động như `Error` cho tất cả các mục đích kiểm tra nhãn hiệu.

## Ví dụ

### Sử dụng Error.isError()

```js
// all following calls return true
Error.isError(new Error());
Error.isError(new TypeError());
Error.isError(new DOMException());
try {
  1 + 1n;
} catch (e) {
  console.log(Error.isError(e)); // The operation threw a TypeError, so this returns true
}

// all following calls return false
Error.isError();
Error.isError({});
Error.isError(null);
Error.isError(undefined);
Error.isError(17);
Error.isError("Error");
Error.isError(true);
Error.isError(false);
// This is not an error, because the object does not have the private field
// initialized by the Error constructor
Error.isError({ __proto__: Error.prototype });
```

### instanceof vs. Error.isError()

Khi kiểm tra instance `Error`, `Error.isError()` được ưu tiên hơn `instanceof` vì nó hoạt động trên nhiều realm.

```js
const iframe = document.createElement("iframe");
document.body.appendChild(iframe);
const xError = window.frames[window.frames.length - 1].Error;
const error = new xError();

// Correctly checking for Error
Error.isError(error); // true
// The prototype of error is xError.prototype, which is a
// different object from Error.prototype
error instanceof Error; // false
```

### Chuẩn hóa các lỗi bị bắt

Bạn có thể sử dụng `Error.isError()` để phát hiện xem giá trị bị bắt có phải là lỗi hay không và chuẩn hóa nó thành một đối tượng lỗi.

```js
try {
  throw "Oops; this is not an Error object";
} catch (e) {
  if (!Error.isError(e)) {
    e = new Error(e);
  }
  console.error(e.message);
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Error.isError` trong `core-js`](https://github.com/zloirock/core-js#erroriserror)
- [es-shims polyfill của `Error.isError`](https://www.npmjs.com/package/error.iserror)
- {{jsxref("Error")}}
