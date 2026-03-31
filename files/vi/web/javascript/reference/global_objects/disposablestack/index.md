---
title: DisposableStack
slug: Web/JavaScript/Reference/Global_Objects/DisposableStack
page-type: javascript-class
browser-compat: javascript.builtins.DisposableStack
sidebar: jsref
---

Đối tượng **`DisposableStack`** đại diện cho một ngăn xếp (stack) các [disposer](/en-US/docs/Web/JavaScript/Reference/Statements/using) được chạy khi chính ngăn xếp đó bị hủy. Các hàm disposer được thực thi theo thứ tự ngược lại so với thứ tự đăng ký, với các đảm bảo xử lý lỗi chặt chẽ. Việc gọi phương thức `move()` sẽ chuyển trách nhiệm gọi các disposer đã đăng ký hiện tại sang một `DisposableStack` mới và ngăn việc đăng ký thêm bất kỳ disposer nào khác.

## Mô tả

`DisposableStack` không hoàn toàn là một "ngăn xếp" theo nghĩa giao diện của nó. Nó có một số phương thức để đẩy disposer vào, nhưng không có cách nào để lấy ra một disposer. Thay vào đó, _tất cả_ các disposer đều được lấy ra và thực thi từng cái một khi ngăn xếp bị hủy.

Bạn đăng ký các [tài nguyên có thể hủy](/en-US/docs/Web/JavaScript/Guide/Resource_management) vào `DisposableStack` bằng các phương thức {{jsxref("DisposableStack/use", "use()")}}, {{jsxref("DisposableStack/adopt", "adopt()")}}, hoặc {{jsxref("DisposableStack/defer", "defer()")}}.

```js
using disposer = new DisposableStack();
const reader = disposer.use(stream.getReader());
```

Sau đó, khi `disposer` ra khỏi phạm vi, tất cả các tài nguyên đã đăng ký vào nó sẽ bị hủy theo thứ tự ngược lại với thứ tự đăng ký, trừ khi chúng đã được chuyển ra bằng `move()`.

Thực tiễn tốt là _không_ tách biểu thức khởi tạo tài nguyên ra thành một câu lệnh riêng, dù biểu thức đó dài đến đâu. Bạn nên luôn bọc lời gọi `use()` hoặc `adopt()` xung quanh biểu thức khởi tạo tài nguyên để đảm bảo tài nguyên được đăng ký vào ngăn xếp ngay lập tức.

```js example-bad
using disposer = new DisposableStack();
const reader = stream.getReader();
disposer.use(reader);
```

Về mặt chức năng, hai đoạn code này tương đương nhau. Tuy nhiên, đoạn đầu ít xảy ra lỗi hơn vì tài nguyên được khai báo và đăng ký trong một dòng duy nhất. Nếu ai đó thêm code giữa dòng thứ hai và thứ ba của đoạn thứ hai, một lỗi có thể xảy ra, khiến tài nguyên bị rò rỉ.

## Constructor

- {{jsxref("DisposableStack/DisposableStack", "DisposableStack()")}}
  - : Tạo một đối tượng `DisposableStack` mới.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `DisposableStack.prototype` và được chia sẻ bởi tất cả các instance của `DisposableStack`.

- {{jsxref("Object/constructor", "DisposableStack.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `DisposableStack`, giá trị ban đầu là constructor {{jsxref("DisposableStack/DisposableStack", "DisposableStack")}}.
- {{jsxref("DisposableStack.prototype.disposed")}}
  - : Chỉ đọc. Trả về `true` nếu `DisposableStack` đã bị hủy, hoặc `false` nếu chưa.
- `DisposableStack.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"DisposableStack"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("DisposableStack.prototype.adopt()")}}
  - : Đăng ký một giá trị không triển khai giao thức disposable vào ngăn xếp bằng cách cung cấp một hàm disposer tùy chỉnh.
- {{jsxref("DisposableStack.prototype.defer()")}}
  - : Nhận một hàm callback để gọi khi ngăn xếp bị hủy.
- {{jsxref("DisposableStack.prototype.dispose()")}}
  - : Hủy ngăn xếp này bằng cách gọi tất cả các disposer đã đăng ký theo thứ tự ngược lại với thứ tự đăng ký.
- {{jsxref("DisposableStack.prototype.move()")}}
  - : Tạo một instance `DisposableStack` mới chứa các disposer giống ngăn xếp này, sau đó đánh dấu ngăn xếp này là đã hủy mà không gọi bất kỳ disposer nào.
- {{jsxref("DisposableStack.prototype.use()")}}
  - : Đăng ký một giá trị triển khai giao thức disposable vào ngăn xếp.
- [`DisposableStack.prototype[Symbol.dispose]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/DisposableStack/Symbol.dispose)
  - : Bí danh của phương thức `dispose()`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `DisposableStack` in `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Symbol.dispose")}}
- {{jsxref("Statements/using", "using")}}
- {{jsxref("AsyncDisposableStack")}}
