---
title: Date.prototype.toLocaleTimeString()
short-title: toLocaleTimeString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toLocaleTimeString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toLocaleTimeString
sidebar: jsref
---

Phương thức **`toLocaleTimeString()`** của các instance {{jsxref("Date")}} trả về một chuỗi với biểu diễn nhạy cảm ngôn ngữ của phần thời gian của ngày này theo múi giờ địa phương. Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.

Mỗi khi `toLocaleTimeString` được gọi, nó phải thực hiện tìm kiếm trong một cơ sở dữ liệu lớn các chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn nên tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì đối tượng `DateTimeFormat` ghi nhớ các đối số được truyền vào nó và có thể quyết định lưu cache một phần cơ sở dữ liệu, nên các cuộc gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong một ngữ cảnh bị hạn chế hơn.

{{InteractiveExample("JavaScript Demo: Date.prototype.toLocaleTimeString()")}}

```js interactive-example
// Depending on timezone, your results will vary
const event = new Date("August 19, 1975 23:15:30 GMT+00:00");

console.log(event.toLocaleTimeString("en-US"));
// Expected output: "1:15:30 AM"

console.log(event.toLocaleTimeString("it-IT"));
// Expected output: "01:15:30"

console.log(event.toLocaleTimeString("ar-EG"));
// Expected output: "١٢:١٥:٣٠ ص"
```

## Cú pháp

```js-nolint
toLocaleTimeString()
toLocaleTimeString(locales)
toLocaleTimeString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép các ứng dụng chỉ định ngôn ngữ có quy ước định dạng nên được sử dụng.

Trong các triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của constructor [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các triển khai không có hỗ trợ `Intl.DateTimeFormat` được yêu cầu bỏ qua cả hai tham số, làm cho locale được sử dụng và hình thức chuỗi được trả về hoàn toàn phụ thuộc vào triển khai.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi đó. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của constructor `Intl.DateTimeFormat()`.

    Trong các triển khai không có hỗ trợ `Intl.DateTimeFormat`, tham số này bị bỏ qua và locale của máy chủ thường được sử dụng.

- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của constructor `Intl.DateTimeFormat()`. Nếu `dayPeriod`, `hour`, `minute`, `second` và `fractionalSecondDigits` đều là undefined, thì `hour`, `minute`, `second` sẽ được đặt thành `"numeric"`.

    Trong các triển khai không có hỗ trợ `Intl.DateTimeFormat`, tham số này bị bỏ qua.

Xem [constructor `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi đại diện cho phần thời gian của ngày đã cho theo quy ước dành riêng cho ngôn ngữ.

Trong các triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(date)`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleTimeString()` là nhất quán. Tuy nhiên, kết quả đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng một locale — các biến thể đầu ra là theo thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không như bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleTimeString()` với các hằng số được mã hóa cứng.

## Ví dụ

### Sử dụng toLocaleTimeString()

Cách sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const date = new Date(Date.UTC(2012, 11, 12, 3, 0, 0));

// toLocaleTimeString() without arguments depends on the implementation,
// the default locale, and the default time zone
console.log(date.toLocaleTimeString());
// "7:00:00 PM" if run in en-US locale with time zone America/Los_Angeles
```

### Kiểm tra hỗ trợ cho các tham số locales và options

Các tham số `locales` và `options` có thể không được hỗ trợ trong tất cả các triển khai, vì hỗ trợ API quốc tế hóa là tùy chọn và một số hệ thống có thể không có dữ liệu cần thiết. Đối với các triển khai không có hỗ trợ quốc tế hóa, `toLocaleTimeString()` luôn sử dụng locale của hệ thống, có thể không phải là điều bạn muốn. Vì bất kỳ triển khai nào hỗ trợ các tham số `locales` và `options` đều phải hỗ trợ API {{jsxref("Intl")}}, bạn có thể kiểm tra sự tồn tại của cái sau để hỗ trợ:

```js
function toLocaleTimeStringSupportsLocales() {
  return (
    typeof Intl === "object" &&
    !!Intl &&
    typeof Intl.DateTimeFormat === "function"
  );
}
```

### Sử dụng locales

Ví dụ này cho thấy một số biến thể của định dạng thời gian bản địa hóa. Để lấy định dạng của ngôn ngữ được sử dụng trong giao diện người dùng của ứng dụng của bạn, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng cách sử dụng đối số `locales`:

```js
const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));

// formats below assume the local time zone of the locale;
// America/Los_Angeles for the US

// US English uses 12-hour time with AM/PM
console.log(date.toLocaleTimeString("en-US"));
// "7:00:00 PM"

// British English uses 24-hour time without AM/PM
console.log(date.toLocaleTimeString("en-GB"));
// "03:00:00"

// Korean uses 12-hour time with AM/PM
console.log(date.toLocaleTimeString("ko-KR"));
// "오후 12:00:00"

// Arabic in most Arabic speaking countries uses real Arabic digits
console.log(date.toLocaleTimeString("ar-EG"));
// "٧:٠٠:٠٠ م"

// when requesting a language that may not be supported, such as
// Balinese, include a fallback language, in this case Indonesian
console.log(date.toLocaleTimeString(["ban", "id"]));
// "11.00.00"
```

### Sử dụng options

Kết quả được cung cấp bởi `toLocaleTimeString()` có thể được tùy chỉnh bằng cách sử dụng tham số `options`:

```js
const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));

// An application may want to use UTC and make that visible
const options = { timeZone: "UTC", timeZoneName: "short" };
console.log(date.toLocaleTimeString("en-US", options));
// "3:00:00 AM GMT"

// Sometimes even the US needs 24-hour time
console.log(date.toLocaleTimeString("en-US", { hour12: false }));
// "19:00:00"

// Show only hours and minutes, use options with the default locale - use an empty array
console.log(
  date.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
);
// "20:01"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Date.prototype.toLocaleDateString()")}}
- {{jsxref("Date.prototype.toLocaleString()")}}
- {{jsxref("Date.prototype.toTimeString()")}}
- {{jsxref("Date.prototype.toString()")}}
