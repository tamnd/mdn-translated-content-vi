---
title: String.prototype.substr()
short-title: substr()
slug: Web/JavaScript/Reference/Global_Objects/String/substr
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.substr
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`substr()`** của các giá trị {{jsxref("String")}} trả về một phần của chuỗi này, bắt đầu từ chỉ số được chỉ định và kéo dài thêm một số ký tự nhất định.

> [!NOTE]
> `substr()` không phải là một phần của đặc tả ECMAScript chính — nó được định nghĩa trong [Phụ lục B: Các tính năng ECMAScript bổ sung cho trình duyệt Web](https://tc39.es/ecma262/multipage/additional-ecmascript-features-for-web-browsers.html), vốn là tùy chọn chuẩn hóa cho các runtime không phải trình duyệt. Do đó, người dùng nên dùng các phương thức chuẩn [`String.prototype.substring()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring) và [`String.prototype.slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice) thay thế để code tương thích tốt nhất với nhiều nền tảng. Trang [`String.prototype.substring()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring#the_difference_between_substring_and_substr) có so sánh giữa ba phương thức này.

{{InteractiveExample("JavaScript Demo: String.prototype.substr()")}}

```js interactive-example
const str = "Mozilla";

console.log(str.substr(1, 2));
// Expected output: "oz"

console.log(str.substr(2));
// Expected output: "zilla"
```

## Cú pháp

```js-nolint
substr(start)
substr(start, length)
```

### Tham số

- `start`
  - : Chỉ số của ký tự đầu tiên được đưa vào chuỗi con trả về.
- `length` {{optional_inline}}
  - : Số ký tự cần trích xuất.

### Giá trị trả về

Một chuỗi mới chứa phần được chỉ định của chuỗi đã cho.

## Mô tả

Phương thức `substr()` của một chuỗi trích xuất `length` ký tự từ chuỗi, tính từ chỉ số `start`.

- Nếu `start >= str.length`, một chuỗi rỗng được trả về.
- Nếu `start < 0`, chỉ số bắt đầu đếm từ cuối chuỗi. Cụ thể hơn, trong trường hợp này chuỗi con bắt đầu tại `max(start + str.length, 0)`.
- Nếu `start` bị bỏ qua hoặc là {{jsxref("undefined")}}, nó được coi là `0`.
- Nếu `length` bị bỏ qua hoặc là {{jsxref("undefined")}}, hoặc nếu `start + length >= str.length`, `substr()` trích xuất các ký tự đến hết chuỗi.
- Nếu `length < 0`, một chuỗi rỗng được trả về.
- Với cả `start` và `length`, {{jsxref("NaN")}} được coi là `0`.

Mặc dù bạn được khuyến khích tránh dùng `substr()`, không có cách đơn giản nào để chuyển đổi `substr()` sang `slice()` hay `substring()` trong code cũ mà không cần về cơ bản viết lại một polyfill cho `substr()`. Ví dụ, `str.substr(a, l)`, `str.slice(a, a + l)` và `str.substring(a, a + l)` đều cho kết quả khác nhau khi `str = "01234", a = 1, l = -2` — `substr()` trả về chuỗi rỗng, `slice()` trả về `"123"`, còn `substring()` trả về `"0"`. Con đường tái cấu trúc thực tế phụ thuộc vào kiến thức về phạm vi của `a` và `l`.

## Ví dụ

### Sử dụng substr()

<!-- cSpell:ignore ozilla -->

```js
const string = "Mozilla";

console.log(string.substr(0, 1)); // 'M'
console.log(string.substr(1, 0)); // ''
console.log(string.substr(-1, 1)); // 'a'
console.log(string.substr(1, -1)); // ''
console.log(string.substr(-3)); // 'lla'
console.log(string.substr(1)); // 'ozilla'
console.log(string.substr(-20, 2)); // 'Mo'
console.log(string.substr(20, 2)); // ''
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.substr` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.substr`](https://www.npmjs.com/package/string.prototype.substr)
- {{jsxref("String.prototype.slice()")}}
- {{jsxref("String.prototype.substring()")}}
