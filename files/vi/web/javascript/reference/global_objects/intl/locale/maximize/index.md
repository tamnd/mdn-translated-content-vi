---
title: Intl.Locale.prototype.maximize()
short-title: maximize()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/maximize
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.maximize
sidebar: jsref
---

Phương thức **`maximize()`** của các instance {{jsxref("Intl.Locale")}} lấy các giá trị có khả năng nhất cho ngôn ngữ, chữ viết và vùng của locale này dựa trên các giá trị hiện có.

{{InteractiveExample("JavaScript Demo: Intl.Locale.prototype.maximize()")}}

```js interactive-example
const english = new Intl.Locale("en");
const korean = new Intl.Locale("ko");
const arabic = new Intl.Locale("ar");

console.log(english.maximize().baseName);
// Expected output: "en-Latn-US"

console.log(korean.maximize().baseName);
// Expected output: "ko-Kore-KR"

console.log(arabic.maximize().baseName);
// Expected output: "ar-Arab-EG"
```

## Cú pháp

```js-nolint
maximize()
```

### Tham số

Không có.

### Giá trị trả về

Một instance {{jsxref("Intl.Locale")}} có thuộc tính `baseName` trả về kết quả của thuật toán [Add Likely Subtags](https://www.unicode.org/reports/tr35/#Likely_Subtags) được thực thi trên _{{jsxref("Intl/Locale/baseName", "locale.baseName")}}_.

## Mô tả

Đôi khi, rất tiện khi có thể xác định các thẻ phụ định danh ngôn ngữ locale có khả năng nhất dựa trên ID ngôn ngữ không đầy đủ. Thuật toán Add Likely Subtags cung cấp chức năng này. Ví dụ, với ID ngôn ngữ "en", thuật toán sẽ trả về "en-Latn-US", vì tiếng Anh chỉ được viết bằng chữ Latin, và có khả năng được dùng nhiều nhất ở Hoa Kỳ vì đây là quốc gia nói tiếng Anh lớn nhất thế giới. Chức năng này được cung cấp cho lập trình viên JavaScript qua phương thức `maximize()`. `maximize()` chỉ ảnh hưởng đến các thẻ phụ chính tạo nên [định danh ngôn ngữ](https://www.unicode.org/reports/tr35/#Language_Locale_Field_Definitions): các thẻ phụ ngôn ngữ, chữ viết và vùng. Các thẻ phụ khác sau "-u" trong định danh locale được gọi là thẻ phụ mở rộng và không bị ảnh hưởng bởi phương thức `maximize()`. Ví dụ về các thẻ phụ này là {{jsxref("Intl/Locale/hourCycle", "hourCycle")}}, {{jsxref("Intl/Locale/calendar", "calendar")}} và {{jsxref("Intl/Locale/numeric", "numeric")}}.

## Ví dụ

### Sử dụng maximize

```js
const myLocale = new Intl.Locale("fr", {
  hourCycle: "h12",
  calendar: "gregory",
});
console.log(myLocale.baseName); // Prints "fr"
console.log(myLocale.toString()); // Prints "fr-u-ca-gregory-hc-h12"
const myLocMaximized = myLocale.maximize();

// Prints "fr-Latn-FR". The "Latn" and "FR" tags are added,
// since French is only written in the Latin script and is most likely to be spoken in France.
console.log(myLocMaximized.baseName);

// Prints "fr-Latn-FR-u-ca-gregory-hc-h12".
// Note that the extension tags (after "-u") remain unchanged.
console.log(myLocMaximized.toString());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- {{jsxref("Intl/Locale/baseName", "baseName")}}
- [Likely Subtags](https://www.unicode.org/reports/tr35/#Likely_Subtags) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
