---
title: AsyncDisposableStack
slug: Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack
page-type: javascript-class
browser-compat: javascript.builtins.AsyncDisposableStack
sidebar: jsref
---

Đối tượng **`AsyncDisposableStack`** đại diện cho một ngăn xếp (stack) các [async disposer](/en-US/docs/Web/JavaScript/Reference/Statements/await_using) được chạy khi chính ngăn xếp đó bị hủy. Các hàm disposer được thực thi theo thứ tự ngược lại so với thứ tự đăng ký, với các đảm bảo xử lý lỗi chặt chẽ. Việc gọi phương thức `move()` sẽ chuyển trách nhiệm gọi các disposer đã đăng ký hiện tại sang một `AsyncDisposableStack` mới và ngăn việc đăng ký thêm bất kỳ disposer nào khác.

Xem {{jsxref("DisposableStack")}} để biết thông tin chung về cách sử dụng disposable stack.

## Constructor

- {{jsxref("AsyncDisposableStack/AsyncDisposableStack", "AsyncDisposableStack()")}}
  - : Tạo một đối tượng `AsyncDisposableStack` mới.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `AsyncDisposableStack.prototype` và được chia sẻ bởi tất cả các instance của `AsyncDisposableStack`.

- {{jsxref("Object/constructor", "AsyncDisposableStack.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `AsyncDisposableStack`, giá trị ban đầu là constructor {{jsxref("AsyncDisposableStack/AsyncDisposableStack", "AsyncDisposableStack")}}.
- {{jsxref("AsyncDisposableStack.prototype.disposed")}}
  - : Chỉ đọc. Trả về `true` nếu `AsyncDisposableStack` đã bị hủy, hoặc `false` nếu chưa.
- `AsyncDisposableStack.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"AsyncDisposableStack"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("AsyncDisposableStack.prototype.adopt()")}}
  - : Đăng ký một giá trị không triển khai giao thức async disposable vào ngăn xếp bằng cách cung cấp một hàm disposer tùy chỉnh.
- {{jsxref("AsyncDisposableStack.prototype.disposeAsync()")}}
  - : Hủy ngăn xếp này bằng cách gọi tất cả các disposer đã đăng ký theo thứ tự ngược lại với thứ tự đăng ký.
- {{jsxref("AsyncDisposableStack.prototype.defer()")}}
  - : Nhận một hàm callback để gọi và chờ (await) khi ngăn xếp bị hủy.
- {{jsxref("AsyncDisposableStack.prototype.move()")}}
  - : Tạo một instance `AsyncDisposableStack` mới chứa các disposer giống ngăn xếp này, sau đó đánh dấu ngăn xếp này là đã hủy mà không gọi bất kỳ disposer nào.
- {{jsxref("AsyncDisposableStack.prototype.use()")}}
  - : Đăng ký một giá trị triển khai giao thức async disposable vào ngăn xếp.
- [`AsyncDisposableStack.prototype[Symbol.asyncDispose]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/Symbol.asyncDispose)
  - : Bí danh của phương thức `disposeAsync()`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `AsyncDisposableStack` in `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Symbol.asyncDispose")}}
- {{jsxref("Statements/await_using", "await using")}}
- {{jsxref("DisposableStack")}}
