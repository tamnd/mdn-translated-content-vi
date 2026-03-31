---
title: Temporal.ZonedDateTime.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi biểu thị ngày-giờ này theo ngôn ngữ cụ thể. Trong các trình triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat` và truyền ngày-giờ này đã được chuyển đổi sang {{jsxref("Temporal.Instant")}} (vì `Intl.DateTimeFormat` không thể định dạng trực tiếp `Temporal.ZonedDateTime`).

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong cơ sở dữ liệu lớn của các chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là nên tạo đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì đối tượng `DateTimeFormat` ghi nhớ các đối số được truyền vào và có thể quyết định lưu vào bộ đệm một phần cơ sở dữ liệu, để các lần gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong ngữ cảnh hạn chế hơn. Tuy nhiên, hiện tại `Intl.DateTimeFormat` không hỗ trợ định dạng các đối tượng `Temporal.ZonedDateTime`, vì vậy bạn phải chuyển đổi chúng thành đối tượng `Temporal.Instant` trước khi truyền vào `format()`.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép ứng dụng chỉ định ngôn ngữ có các quy ước định dạng nên được sử dụng.

Trong các trình triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của hàm tạo [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các trình triển khai không hỗ trợ `Intl.DateTimeFormat` trả về cùng một chuỗi như {{jsxref("Temporal/ZonedDateTime/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi có {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của hàm tạo `Intl.DateTimeFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của hàm tạo `Intl.DateTimeFormat()`. Nếu lịch của ngày-giờ này không phải là `"iso8601"`, tùy chọn `calendar` phải được cung cấp với cùng giá trị; ngược lại, nếu lịch của ngày-giờ này là `"iso8601"`, tùy chọn `calendar` có thể là bất kỳ giá trị nào. Tùy chọn `timeZone` không được cung cấp, vì nó được tự động đặt là {{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}} của ngày-giờ. Về [các tùy chọn thành phần ngày-giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options) và các tắt kiểu (`dateStyle` và `timeStyle`), các tùy chọn nên theo một trong các dạng sau:
    - Không cung cấp bất kỳ cái nào: `year`, `month`, `day`, `hour`, `minute` và `second` sẽ mặc định là `"numeric"`.
    - Cung cấp ít nhất một trong `dateStyle` hoặc `timeStyle`: các thành phần ngày-giờ sẽ được đặt theo kiểu được chỉ định và ngôn ngữ.
    - Cung cấp một số tùy chọn thành phần ngày-giờ. Chỉ các thành phần ngày-giờ được chỉ định sẽ được bao gồm trong đầu ra.

Xem [hàm tạo `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi biểu thị ngày-giờ đã cho theo các quy ước ngôn ngữ cụ thể.

Trong các trình triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, { ...options, timeZone: dateTime.timeZoneId }).format(dateTime.toInstant())`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Phần lớn thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các trình triển khai, ngay cả trong cùng một ngôn ngữ — các biến thể đầu ra là do thiết kế và được phép bởi đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng dấu cách không ngắt hoặc được bao quanh bởi các ký tự điều khiển hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số cứng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không thuộc loại mong đợi.

## Ví dụ

### Sử dụng toLocaleString()

Sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo ngôn ngữ mặc định và với các tùy chọn mặc định.

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-08-01T12:34:56-04:00[America/New_York]",
);

console.log(zdt.toLocaleString()); // 8/1/2021, 12:34:56 PM EDT (assuming en-US locale)
```

Nếu lịch của ngày không khớp với lịch mặc định của ngôn ngữ, và lịch của ngày không phải là `iso8601`, thì phải cung cấp tùy chọn `calendar` rõ ràng với cùng giá trị.

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-08-01T12:34:56+09:00[Asia/Tokyo][u-ca=japanese]",
);
// The ja-JP locale uses the Gregorian calendar by default
zdt.toLocaleString("ja-JP", { calendar: "japanese" }); // R3/8/1 12:34:56 JST
```

### Sử dụng toLocaleString() với các tùy chọn

Bạn có thể tùy chỉnh phần nào của ngày được bao gồm trong đầu ra bằng cách cung cấp tham số `options`.

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-08-01T12:34:56+09:00[Asia/Tokyo][u-ca=japanese]",
);
zdt.toLocaleString("ja-JP", {
  calendar: "japanese",
  dateStyle: "full",
  timeStyle: "full",
}); // 令和3年8月1日日曜日 12時34分56秒 日本標準時
zdt.toLocaleString("ja-JP", {
  calendar: "japanese",
  year: "numeric",
  month: "long",
  hour: "numeric",
  timeZoneName: "shortGeneric",
}); // 令和3年8月 12時 JST
zdt.toLocaleString("ja-JP", {
  calendar: "japanese",
  year: "numeric",
  hour: "numeric",
  minute: "numeric",
}); // 令和3年 12:34
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Temporal/ZonedDateTime/toJSON", "Temporal.ZonedDateTime.prototype.toJSON()")}}
- {{jsxref("Temporal/ZonedDateTime/toString", "Temporal.ZonedDateTime.prototype.toString()")}}
