---
title: Temporal.Instant.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các instance {{jsxref("Temporal.Instant")}} trả về một chuỗi biểu diễn instant này theo ngôn ngữ cụ thể. Trong các môi trường hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong một cơ sở dữ liệu lớn về chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì đối tượng `DateTimeFormat` ghi nhớ các đối số được truyền vào và có thể quyết định lưu vào bộ nhớ đệm một phần của cơ sở dữ liệu, do đó các lần gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong một ngữ cảnh bị hạn chế hơn.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép ứng dụng chỉ định ngôn ngữ có quy ước định dạng cần sử dụng.

Trong các môi trường hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của hàm tạo [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các môi trường không hỗ trợ `Intl.DateTimeFormat` trả về chuỗi giống hệt với {{jsxref("Temporal/Instant/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của hàm tạo `Intl.DateTimeFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của hàm tạo `Intl.DateTimeFormat()`.

Xem [hàm tạo `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi biểu diễn instant đã cho theo quy ước ngôn ngữ cụ thể.

Trong các môi trường có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(instant)`.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các môi trường, ngay cả trong cùng một locale — sự biến đổi đầu ra là có chủ ý và được cho phép theo đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng dấu cách không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số cố định.

## Ví dụ

### Sử dụng toLocaleString()

Cách sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56Z");

console.log(instant.toLocaleString()); // 8/1/2021, 12:34:56 AM (assuming en-US locale and device in UTC time zone)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Temporal/Instant/toJSON", "Temporal.Instant.prototype.toJSON()")}}
- {{jsxref("Temporal/Instant/toString", "Temporal.Instant.prototype.toString()")}}
