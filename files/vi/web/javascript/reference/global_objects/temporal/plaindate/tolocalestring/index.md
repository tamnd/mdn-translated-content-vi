---
title: Temporal.PlainDate.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một chuỗi biểu diễn ngày này theo ngôn ngữ cụ thể. Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong một cơ sở dữ liệu lớn chứa các chuỗi bản địa hóa, điều này có thể kém hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì đối tượng `DateTimeFormat` ghi nhớ các đối số được truyền vào và có thể quyết định lưu vào bộ nhớ đệm một phần của cơ sở dữ liệu, do đó các lần gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong ngữ cảnh bị giới hạn hơn.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép các ứng dụng chỉ định ngôn ngữ có quy ước định dạng cần sử dụng.

Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của hàm tạo [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các triển khai không có hỗ trợ `Intl.DateTimeFormat` sẽ trả về cùng chuỗi như {{jsxref("Temporal/PlainDate/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi chứa {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của hàm tạo `Intl.DateTimeFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của hàm tạo `Intl.DateTimeFormat()`. Nếu lịch của ngày này không phải là `"iso8601"`, tùy chọn `calendar` phải được cung cấp với cùng giá trị; nếu không, nếu lịch của ngày này là `"iso8601"`, tùy chọn `calendar` có thể là bất kỳ giá trị nào. Về [các tùy chọn thành phần date-time](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options) và các phím tắt kiểu (`dateStyle` và `timeStyle`), các tùy chọn nên theo một trong các dạng sau:
    - Không cung cấp bất kỳ tùy chọn nào: `year`, `month`, và `day` sẽ mặc định là `"numeric"`.
    - Chỉ cung cấp `dateStyle`: nó mở rộng thành các định dạng `weekday`, `era`, `year`, `month`, và `day`.
    - Cung cấp một số tùy chọn thành phần date-time, trong đó ít nhất một tùy chọn là tùy chọn ngày (`weekday`, `year`, `month`, `day`). Chỉ các thành phần ngày được chỉ định mới được đưa vào đầu ra.

Xem [hàm tạo `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi biểu diễn ngày đã cho theo các quy ước đặc thù của ngôn ngữ.

Trong các triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(date)`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng ngôn ngữ — sự khác biệt đầu ra được thiết kế sẵn và được đặc tả cho phép. Nó cũng có thể không như bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số được mã hóa cứng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không thuộc kiểu dự kiến.

## Ví dụ

### Sử dụng toLocaleString()

Sử dụng cơ bản phương thức này mà không chỉ định `locale` sẽ trả về một chuỗi định dạng trong ngôn ngữ mặc định với các tùy chọn mặc định.

```js
const date = Temporal.PlainDate.from("2021-08-01");

console.log(date.toLocaleString()); // 8/1/2021 (giả sử ngôn ngữ en-US)
```

Nếu lịch của ngày không khớp với lịch mặc định của ngôn ngữ, và lịch của ngày không phải là `iso8601`, phải cung cấp rõ ràng tùy chọn `calendar` với cùng giá trị.

```js
const date = Temporal.PlainDate.from("2021-08-01[u-ca=japanese]");
// Ngôn ngữ ja-JP sử dụng lịch Gregorian theo mặc định
date.toLocaleString("ja-JP", { calendar: "japanese" }); // R3/8/1
```

### Sử dụng toLocaleString() với các tùy chọn

Bạn có thể tùy chỉnh các phần nào của ngày được đưa vào đầu ra bằng cách cung cấp tham số `options`.

```js
const date = Temporal.PlainDate.from("2021-08-01");
date.toLocaleString("en-US", { dateStyle: "full" }); // Sunday, August 1, 2021
date.toLocaleString("en-US", {
  year: "numeric",
  month: "long",
  day: "numeric",
}); // August 1, 2021
date.toLocaleString("en-US", { year: "numeric", month: "long" }); // August 2021
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Temporal/PlainDate/toJSON", "Temporal.PlainDate.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}
