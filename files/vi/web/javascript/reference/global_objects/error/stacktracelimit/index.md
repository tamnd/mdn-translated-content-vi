---
title: Error.stackTraceLimit
short-title: stackTraceLimit
slug: Web/JavaScript/Reference/Global_Objects/Error/stackTraceLimit
page-type: javascript-static-data-property
status:
  - non-standard
browser-compat: javascript.builtins.Error.stackTraceLimit
sidebar: jsref
---

{{Non-standard_Header}}

> [!NOTE]
> Tính năng này là một phần của [V8 stack trace API](https://v8.dev/docs/stack-trace-api) hiện chưa là tiêu chuẩn. Tuy nhiên, vì lý do tương thích, nó cũng được triển khai bởi JavaScriptCore.

Data property tĩnh **`Error.stackTraceLimit`** chỉ ra số lượng tối đa các stack frame được ghi lại bởi stack trace của một lỗi. Nó có thể được đặt bởi mã người dùng để thay đổi hành vi của engine.

Nhìn chung, _đọc_ thuộc tính này không hữu ích lắm, nhưng bạn có thể _đặt_ nó thành một giá trị mới. Đặt nó thành một giá trị lớn hơn có thể hữu ích cho việc gỡ lỗi, vì nó cho phép bạn thấy nhiều hơn trong call stack. Đặt nó thành một giá trị nhỏ hơn có thể cải thiện hiệu suất vì nó giảm lượng stack được ghi lại.

## Giá trị

Một số nguyên đại diện cho số lượng tối đa các stack frame được ghi lại bởi stack trace của một lỗi.

{{js_property_attributes(1, 1, 1)}}

## Mô tả

Vì `stackTraceLimit` là một thuộc tính tĩnh của `Error`, bạn luôn sử dụng nó là `Error.stackTraceLimit`, thay vì là thuộc tính của một đối tượng `Error` mà bạn đã tạo. Nếu bạn muốn tùy chỉnh stack trace chỉ cho một lỗi duy nhất, bạn có thể cần đặt thuộc tính, tạo lỗi, rồi đặt lại thuộc tính về giá trị ban đầu.

## Ví dụ

### Đặt Error.stackTraceLimit

Đoạn mã này an toàn để chạy ngay cả trong các môi trường không hỗ trợ `Error.stackTraceLimit`, vì nó không đọc thuộc tính, chỉ đặt nó, và các engine không hỗ trợ nó sẽ bỏ qua việc đặt này.

```js
Error.stackTraceLimit = 2;
const a = () => b();
const b = () => c();
const c = () => d();
const d = () => e();
const e = () => {
  throw new Error("My error");
};
try {
  a();
} catch (e) {
  console.log(e.stack);
}
// Only two frames in supporting engines; all frames in others
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.stack")}}
- {{jsxref("Error.captureStackTrace()")}}
- [Stack trace API](https://v8.dev/docs/stack-trace-api) trong tài liệu V8
