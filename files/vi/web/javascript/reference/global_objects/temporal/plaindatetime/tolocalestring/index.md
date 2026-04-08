---
title: Temporal.PlainDateTime.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một chuỗi với biểu diễn ngày-giờ này theo ngôn ngữ cụ thể. Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy thác cho `Intl.DateTimeFormat`.

Mỗi khi `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong cơ sở dữ liệu lớn các chuỗi nội địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng các tham số, tốt hơn là nên tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì một đối tượng `DateTimeFormat` ghi nhớ các tham số được truyền vào và có thể quyết định lưu cache một phần cơ sở dữ liệu, để các lần gọi `format` trong tương lai có thể tìm kiếm các chuỗi nội địa hóa trong một ngữ cảnh bị hạn chế hơn.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép các ứng dụng chỉ định ngôn ngữ có các quy ước định dạng cần được sử dụng.

Trong các triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của hàm tạo [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các triển khai không có hỗ trợ `Intl.DateTimeFormat` trả về chuỗi giống hệt như {{jsxref("Temporal/PlainDateTime/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của hàm tạo `Intl.DateTimeFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của hàm tạo `Intl.DateTimeFormat()`. Nếu lịch của ngày-giờ này không phải là `"iso8601"`, tùy chọn `calendar` phải được cung cấp với cùng giá trị; ngược lại, nếu lịch của ngày-giờ này là `"iso8601"`, tùy chọn `calendar` có thể là bất kỳ giá trị nào. Đối với [các tùy chọn thành phần ngày-giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options) và các phím tắt style (`dateStyle` và `timeStyle`), các tùy chọn nên theo một trong các dạng sau:
    - Không cung cấp bất kỳ tùy chọn nào trong số đó: `year`, `month`, `day`, `hour`, `minute`, và `second` sẽ mặc định là `"numeric"`.
    - Cung cấp ít nhất một trong `dateStyle` hoặc `timeStyle`: các thành phần ngày-giờ sẽ được thiết lập theo style được chỉ định và locale.
    - Cung cấp một số tùy chọn thành phần ngày-giờ. Chỉ các thành phần ngày-giờ được chỉ định mới được bao gồm trong đầu ra.

Xem [hàm tạo `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi đại diện cho ngày-giờ đã cho theo các quy ước theo ngôn ngữ cụ thể.

Trong các triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(dateTime)`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Hầu hết thời gian, định dạng trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng một locale — sự khác biệt đầu ra là có chủ ý và được phép theo đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số được mã hóa cứng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không thuộc kiểu dự kiến.

## Ví dụ

### Sử dụng toLocaleString()

Sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const dt = Temporal.PlainDateTime.from("2021-08-01T12:34:56");

console.log(dt.toLocaleString()); // 8/1/2021, 12:34:56 PM (assuming en-US locale)
```

Nếu lịch của ngày không khớp với lịch mặc định của locale, và lịch của ngày không phải là `iso8601`, thì phải cung cấp tùy chọn `calendar` rõ ràng với cùng giá trị.

```js
const dt = Temporal.PlainDateTime.from("2021-08-01T12:34:56[u-ca=japanese]");
// The ja-JP locale uses the Gregorian calendar by default
dt.toLocaleString("ja-JP", { calendar: "japanese" }); // R3/8/1 12:34:56
```

### Sử dụng toLocaleString() với các tùy chọn

Bạn có thể tùy chỉnh các phần nào của ngày được bao gồm trong đầu ra bằng cách cung cấp tham số `options`.

```js
const dt = Temporal.PlainDateTime.from("2021-08-01T12:34:56");
dt.toLocaleString("en-US", { dateStyle: "full", timeStyle: "full" }); // Sunday, August 1, 2021 at 12:34:56 PM
dt.toLocaleString("en-US", {
  year: "numeric",
  month: "long",
  hour: "numeric",
}); // August 2021 at 12 PM
dt.toLocaleString("en-US", {
  year: "numeric",
  hour: "numeric",
  minute: "numeric",
}); // 2021, 12:34 PM
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Temporal/PlainDateTime/toJSON", "Temporal.PlainDateTime.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainDateTime/toString", "Temporal.PlainDateTime.prototype.toString()")}}
