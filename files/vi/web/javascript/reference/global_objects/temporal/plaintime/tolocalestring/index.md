---
title: Temporal.PlainTime.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một chuỗi biểu diễn thời gian này theo ngôn ngữ cụ thể. Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải tìm kiếm trong một cơ sở dữ liệu lớn các chuỗi bản địa hóa, điều này có thể kém hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì đối tượng `DateTimeFormat` ghi nhớ các đối số được truyền vào và có thể quyết định lưu vào bộ nhớ đệm một phần cơ sở dữ liệu, do đó các lần gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong ngữ cảnh bị hạn chế hơn.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép ứng dụng chỉ định ngôn ngữ có quy ước định dạng sẽ được sử dụng.

Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của constructor [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các triển khai không có hỗ trợ `Intl.DateTimeFormat` trả về cùng chuỗi như {{jsxref("Temporal/PlainTime/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi có {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của constructor `Intl.DateTimeFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của constructor `Intl.DateTimeFormat()`. Về [các tùy chọn thành phần ngày-giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options) và các phím tắt kiểu (`dateStyle` và `timeStyle`), các tùy chọn nên tuân theo một trong các dạng sau:
    - Không cung cấp tùy chọn nào: `hour`, `minute`, và `second` sẽ mặc định là `"numeric"`.
    - Chỉ cung cấp `timeStyle`: nó sẽ mở rộng sang các định dạng `dayPeriod`, `hour`, `minute`, `second`, và `fractionalSecondDigits`.
    - Cung cấp một số tùy chọn thành phần ngày-giờ, trong đó ít nhất một trong số đó là tùy chọn giờ (`dayPeriod`, `hour`, `minute`, `second`, `fractionalSecondDigits`). Chỉ các thành phần giờ được chỉ định sẽ được đưa vào đầu ra.

Xem [constructor `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi đại diện cho thời gian đã cho theo các quy ước ngôn ngữ cụ thể.

Trong các triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(time)`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng một locale — sự biến đổi đầu ra là theo thiết kế và được phép bởi đặc tả. Nó cũng có thể không như bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số được mã hóa cứng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không thuộc kiểu dự kiến.

## Ví dụ

### Sử dụng toLocaleString()

Sử dụng cơ bản phương thức này mà không chỉ định `locale` sẽ trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const time = Temporal.PlainTime.from("12:34:56");

console.log(time.toLocaleString()); // 12:34:56 PM (giả sử locale en-US)
```

### Sử dụng toLocaleString() với các tùy chọn

Bạn có thể tùy chỉnh các phần nào của thời gian được đưa vào đầu ra bằng cách cung cấp tham số `options`.

```js
const time = Temporal.PlainTime.from("12:34:56");
time.toLocaleString("en-US", { timeStyle: "short" }); // 12:34 PM
time.toLocaleString("en-US", { hour: "2-digit" }); // 12 PM
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Temporal/PlainTime/toJSON", "Temporal.PlainTime.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}
