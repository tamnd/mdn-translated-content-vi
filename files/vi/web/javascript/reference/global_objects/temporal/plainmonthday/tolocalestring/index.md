---
title: Temporal.PlainMonthDay.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một chuỗi với biểu diễn tháng-ngày này theo ngôn ngữ cụ thể. Trong các triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong cơ sở dữ liệu chuỗi bản địa hóa lớn, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng các tham số, tốt hơn là tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì một đối tượng `DateTimeFormat` ghi nhớ các tham số được truyền cho nó và có thể quyết định lưu vào bộ nhớ đệm một phần cơ sở dữ liệu, do đó các lần gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong ngữ cảnh bị hạn chế hơn.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép ứng dụng chỉ định ngôn ngữ mà các quy ước định dạng của nó nên được sử dụng.

Trong các triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của constructor [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các triển khai không hỗ trợ `Intl.DateTimeFormat` trả về cùng chuỗi như {{jsxref("Temporal/PlainMonthDay/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của constructor `Intl.DateTimeFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của constructor `Intl.DateTimeFormat()`. Tùy chọn `calendar` phải được cung cấp với cùng giá trị như lịch của tháng-ngày này. Về [các tùy chọn thành phần ngày-giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options) và các phím tắt kiểu (`dateStyle` và `timeStyle`), các tùy chọn nên theo một trong các dạng sau:
    - Không cung cấp bất kỳ tùy chọn nào: `month` và `day` sẽ mặc định là `"numeric"`.
    - Chỉ cung cấp `dateStyle`: nó mở rộng thành các định dạng `month` và `day`.
    - Cung cấp một số tùy chọn thành phần ngày-giờ, trong đó ít nhất một trong số đó là `month` hoặc `day`. Chỉ các thành phần ngày được chỉ định sẽ được bao gồm trong đầu ra.

Xem constructor [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi đại diện cho tháng-ngày đã cho theo các quy ước ngôn ngữ cụ thể.

Trong các triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(monthDay)`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng một locale — các biến thể đầu ra là theo thiết kế và được phép theo đặc tả. Nó cũng có thể không phải những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không phá vỡ hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số được mã hóa cứng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném nếu bất kỳ tùy chọn nào không thuộc loại mong đợi.

## Ví dụ

### Sử dụng toLocaleString()

Cách sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi định dạng theo locale mặc định và các tùy chọn mặc định.

```js
// Note that just specifying "08-01" defaults to the ISO 8601 calendar,
// which throws an error if the locale's default calendar is not ISO 8601.
const md = Temporal.PlainMonthDay.from("2021-08-01[u-ca=gregory]");

console.log(md.toLocaleString()); // 8/1 (assuming en-US locale and Gregorian calendar)
```

Nếu lịch của tháng-ngày không khớp với lịch mặc định của locale, ngay cả khi lịch của nó là `iso8601`, một tùy chọn `calendar` rõ ràng phải được cung cấp với cùng giá trị.

```js
const md = Temporal.PlainMonthDay.from("08-01");
md.toLocaleString("en-US", { calendar: "iso8601" }); // 08-01
```

### Sử dụng toLocaleString() với options

Bạn có thể tùy chỉnh các phần nào của tháng-ngày được bao gồm trong đầu ra bằng cách cung cấp tham số `options`.

```js
const md = Temporal.PlainMonthDay.from("2021-08-01[u-ca=gregory]");
md.toLocaleString("en-US", { dateStyle: "full" }); // August 1
md.toLocaleString("en-US", { month: "long" }); // August
md.toLocaleString("en-US", { day: "numeric" }); // 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Temporal/PlainMonthDay/toJSON", "Temporal.PlainMonthDay.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainMonthDay/toString", "Temporal.PlainMonthDay.prototype.toString()")}}
