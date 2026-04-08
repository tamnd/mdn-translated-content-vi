---
title: Date.prototype.toLocaleDateString()
short-title: toLocaleDateString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toLocaleDateString
sidebar: jsref
---

Phương thức **`toLocaleDateString()`** của các instance {{jsxref("Date")}} trả về một chuỗi với biểu diễn nhạy cảm ngôn ngữ của phần ngày của ngày này theo múi giờ địa phương. Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.

Mỗi khi `toLocaleDateString` được gọi, nó phải thực hiện tìm kiếm trong một cơ sở dữ liệu lớn các chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn nên tạo một đối tượng {{jsxref("Intl.DateTimeFormat")}} và sử dụng phương thức {{jsxref("Intl/DateTimeFormat/format", "format()")}} của nó, vì đối tượng `DateTimeFormat` ghi nhớ các đối số được truyền vào nó và có thể quyết định lưu cache một phần cơ sở dữ liệu, nên các cuộc gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong một ngữ cảnh bị hạn chế hơn.

{{InteractiveExample("JavaScript Demo: Date.prototype.toLocaleDateString()", "taller")}}

```js interactive-example
const event = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));
const options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};

console.log(event.toLocaleDateString("de-DE", options));
// Expected output (varies according to local timezone): Donnerstag, 20. Dezember 2012

console.log(event.toLocaleDateString("ar-EG", options));
// Expected output (varies according to local timezone): الخميس، ٢٠ ديسمبر، ٢٠١٢

console.log(event.toLocaleDateString(undefined, options));
// Expected output (varies according to local timezone and default locale): Thursday, December 20, 2012
```

## Cú pháp

```js-nolint
toLocaleDateString()
toLocaleDateString(locales)
toLocaleDateString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép các ứng dụng chỉ định ngôn ngữ có quy ước định dạng nên được sử dụng.

Trong các triển khai hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), các tham số này tương ứng chính xác với các tham số của constructor [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat). Các triển khai không có hỗ trợ `Intl.DateTimeFormat` được yêu cầu bỏ qua cả hai tham số, làm cho locale được sử dụng và hình thức chuỗi được trả về hoàn toàn phụ thuộc vào triển khai.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi đó. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#locales) của constructor `Intl.DateTimeFormat()`.

    Trong các triển khai không có hỗ trợ `Intl.DateTimeFormat`, tham số này bị bỏ qua và locale của máy chủ thường được sử dụng.

- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options) của constructor `Intl.DateTimeFormat()`. Tùy chọn `timeStyle` phải là undefined, nếu không sẽ ném {{jsxref("TypeError")}}. Nếu `weekday`, `year`, `month` và `day` đều là undefined, thì `year`, `month` và `day` sẽ được đặt thành `"numeric"`.

    Trong các triển khai không có hỗ trợ `Intl.DateTimeFormat`, tham số này bị bỏ qua.

Xem [constructor `Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi đại diện cho phần ngày của ngày đã cho theo quy ước dành riêng cho ngôn ngữ.

Trong các triển khai có `Intl.DateTimeFormat`, điều này tương đương với `new Intl.DateTimeFormat(locales, options).format(date)`, trong đó `options` đã được chuẩn hóa như mô tả ở trên.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleDateString()` là nhất quán. Tuy nhiên, kết quả đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng một locale — các biến thể đầu ra là theo thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không như bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleDateString()` với các hằng số được mã hóa cứng.

## Ví dụ

### Sử dụng toLocaleDateString()

Cách sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const date = new Date(Date.UTC(2012, 11, 12, 3, 0, 0));

// toLocaleDateString() without arguments depends on the implementation,
// the default locale, and the default time zone
console.log(date.toLocaleDateString());
// "12/11/2012" if run in en-US locale with time zone America/Los_Angeles
```

### Kiểm tra hỗ trợ cho các tham số locales và options

Các tham số `locales` và `options` có thể không được hỗ trợ trong tất cả các triển khai, vì hỗ trợ API quốc tế hóa là tùy chọn và một số hệ thống có thể không có dữ liệu cần thiết. Đối với các triển khai không có hỗ trợ quốc tế hóa, `toLocaleDateString()` luôn sử dụng locale của hệ thống, có thể không phải là điều bạn muốn. Vì bất kỳ triển khai nào hỗ trợ các tham số `locales` và `options` đều phải hỗ trợ API {{jsxref("Intl")}}, bạn có thể kiểm tra sự tồn tại của cái sau để hỗ trợ:

```js
function toLocaleDateStringSupportsLocales() {
  return (
    typeof Intl === "object" &&
    !!Intl &&
    typeof Intl.DateTimeFormat === "function"
  );
}
```

### Sử dụng locales

Ví dụ này cho thấy một số biến thể của định dạng ngày bản địa hóa. Để lấy định dạng của ngôn ngữ được sử dụng trong giao diện người dùng của ứng dụng của bạn, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng cách sử dụng đối số `locales`:

```js
const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));

// formats below assume the local time zone of the locale;
// America/Los_Angeles for the US

// US English uses month-day-year order
console.log(date.toLocaleDateString("en-US"));
// "12/20/2012"

// British English uses day-month-year order
console.log(date.toLocaleDateString("en-GB"));
// "20/12/2012"

// Korean uses year-month-day order
console.log(date.toLocaleDateString("ko-KR"));
// "2012. 12. 20."

// Event for Persian, It's hard to manually convert date to Solar Hijri
console.log(date.toLocaleDateString("fa-IR"));
// "۱۳۹۱/۹/۳۰"

// Arabic in most Arabic speaking countries uses real Arabic digits
console.log(date.toLocaleDateString("ar-EG"));
// "٢٠‏/١٢‏/٢٠١٢"

// for Japanese, applications may want to use the Japanese calendar,
// where 2012 was the year 24 of the Heisei era
console.log(date.toLocaleDateString("ja-JP-u-ca-japanese"));
// "24/12/20"

// when requesting a language that may not be supported, such as
// Balinese, include a fallback language, in this case Indonesian
console.log(date.toLocaleDateString(["ban", "id"]));
// "20/12/2012"
```

### Sử dụng options

Kết quả được cung cấp bởi `toLocaleDateString()` có thể được tùy chỉnh bằng cách sử dụng tham số `options`:

```js
const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));

// Request a weekday along with a long date
const options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};
console.log(date.toLocaleDateString("de-DE", options));
// "Donnerstag, 20. Dezember 2012"

// An application may want to use UTC and make that visible
options.timeZone = "UTC";
options.timeZoneName = "short";
console.log(date.toLocaleDateString("en-US", options));
// "Thursday, December 20, 2012, UTC"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Date.prototype.toLocaleString()")}}
- {{jsxref("Date.prototype.toLocaleTimeString()")}}
- {{jsxref("Date.prototype.toString()")}}
