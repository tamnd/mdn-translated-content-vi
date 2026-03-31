---
title: Number.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Number/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Number.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các giá trị {{jsxref("Number")}} trả về một chuỗi với biểu diễn nhạy cảm ngôn ngữ của số này. Trong các triển khai hỗ trợ [API `Intl.NumberFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat), phương thức này ủy quyền cho `Intl.NumberFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong một cơ sở dữ liệu lớn các chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là tạo một đối tượng {{jsxref("Intl.NumberFormat")}} và sử dụng phương thức {{jsxref("Intl/NumberFormat/format", "format()")}} của nó, vì đối tượng `NumberFormat` nhớ các đối số được truyền vào và có thể quyết định lưu vào bộ nhớ đệm một phần của cơ sở dữ liệu, vì vậy các lần gọi `format` trong tương lai có thể tìm kiếm các chuỗi bản địa hóa trong ngữ cảnh bị ràng buộc hơn.

{{InteractiveExample("JavaScript Demo: Number.prototype.toLocaleString()")}}

```js interactive-example
function eArabic(x) {
  return x.toLocaleString("ar-EG");
}

console.log(eArabic(123456.789));
// Expected output: "١٢٣٬٤٥٦٫٧٨٩"

console.log(eArabic("123456.789"));
// Expected output: "123456.789"

console.log(eArabic(NaN));
// Expected output: "ليس رقم"
```

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép ứng dụng chỉ định ngôn ngữ có các quy ước định dạng nên được sử dụng.

Trong các triển khai hỗ trợ [API `Intl.NumberFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat), các tham số này tương ứng chính xác với các tham số của hàm tạo [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat). Các triển khai không hỗ trợ `Intl.NumberFormat` được yêu cầu bỏ qua cả hai tham số, làm cho locale sử dụng và dạng chuỗi trả về hoàn toàn phụ thuộc vào triển khai.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi đó. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#locales) của hàm tạo `Intl.NumberFormat()`.

    Trong các triển khai không hỗ trợ `Intl.NumberFormat`, tham số này bị bỏ qua và locale của máy chủ thường được sử dụng.

- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#options) của hàm tạo `Intl.NumberFormat()`.

    Trong các triển khai không hỗ trợ `Intl.NumberFormat`, tham số này bị bỏ qua.

Xem [hàm tạo `Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi biểu diễn số đã cho theo quy ước dành riêng cho ngôn ngữ.

Trong các triển khai có `Intl.NumberFormat`, điều này tương đương với `new Intl.NumberFormat(locales, options).format(number)`.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các triển khai, ngay cả trong cùng một locale — các biến thể đầu ra là do thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không như bạn mong đợi. Ví dụ, chuỗi có thể sử dụng dấu cách không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số được mã hóa cứng.

## Ví dụ

### Sử dụng toLocaleString()

Sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng trong locale mặc định với các tùy chọn mặc định.

```js
const number = 3500;

console.log(number.toLocaleString()); // "3,500" if in U.S. English locale
```

### Kiểm tra hỗ trợ cho tham số locales và options

Các tham số `locales` và `options` có thể không được hỗ trợ trong tất cả các triển khai, vì hỗ trợ cho API quốc tế hóa là tùy chọn, và một số hệ thống có thể không có dữ liệu cần thiết. Đối với các triển khai không có hỗ trợ quốc tế hóa, `toLocaleString()` luôn sử dụng locale của hệ thống, điều này có thể không phải là điều bạn muốn. Vì bất kỳ triển khai nào hỗ trợ các tham số `locales` và `options` phải hỗ trợ API {{jsxref("Intl")}}, bạn có thể kiểm tra sự tồn tại của API đó để được hỗ trợ:

```js
function toLocaleStringSupportsLocales() {
  return (
    typeof Intl === "object" &&
    !!Intl &&
    typeof Intl.NumberFormat === "function"
  );
}
```

### Sử dụng locales

Ví dụ này cho thấy một số biến thể trong các định dạng số được bản địa hóa. Để có định dạng của ngôn ngữ được sử dụng trong giao diện người dùng của ứng dụng, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng cách sử dụng đối số `locales`:

```js
const number = 123456.789;

// German uses comma as decimal separator and period for thousands
console.log(number.toLocaleString("de-DE"));
// 123.456,789

// Arabic in most Arabic speaking countries uses Eastern Arabic digits
console.log(number.toLocaleString("ar-EG"));
// ١٢٣٤٥٦٫٧٨٩

// India uses thousands/lakh/crore separators
console.log(number.toLocaleString("en-IN"));
// 1,23,456.789

// the nu extension key requests a numbering system, e.g. Chinese decimal
console.log(number.toLocaleString("zh-Hans-CN-u-nu-hanidec"));
// 一二三,四五六.七八九

// when requesting a language that may not be supported, such as
// Balinese, include a fallback language, in this case Indonesian
console.log(number.toLocaleString(["ban", "id"]));
// 123.456,789
```

### Sử dụng options

Kết quả do `toLocaleString()` cung cấp có thể được tùy chỉnh bằng tham số `options`:

```js
const number = 123456.789;

// request a currency format
console.log(
  number.toLocaleString("de-DE", { style: "currency", currency: "EUR" }),
);
// 123.456,79 €

// the Japanese yen doesn't use a minor unit
console.log(
  number.toLocaleString("ja-JP", { style: "currency", currency: "JPY" }),
);
// ￥123,457

// limit to three significant digits
console.log(number.toLocaleString("en-IN", { maximumSignificantDigits: 3 }));
// 1,23,000

// Use the host default language with options for number formatting
const num = 30000.65;
console.log(
  num.toLocaleString(undefined, {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }),
);
// "30,000.65" where English is the default language, or
// "30.000,65" where German is the default language, or
// "30 000,65" where French is the default language
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Number.prototype.toString()")}}
