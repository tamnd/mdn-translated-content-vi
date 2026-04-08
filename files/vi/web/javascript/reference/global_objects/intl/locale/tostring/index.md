---
title: Intl.Locale.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Intl.Locale")}} trả về [chuỗi định danh locale](https://www.unicode.org/reports/tr35/#Unicode_locale_identifier) đầy đủ của Locale này.

{{InteractiveExample("JavaScript Demo: Intl.Locale.prototype.toString()", "taller")}}

```js interactive-example
const french = new Intl.Locale("fr-Latn-FR", {
  calendar: "gregory",
  hourCycle: "h12",
});
const korean = new Intl.Locale("ko-Kore-KR", {
  numeric: true,
  caseFirst: "upper",
});

console.log(french.toString());
// Expected output: "fr-Latn-FR-u-ca-gregory-hc-h12"

console.log(korean.toString());
// Expected output: "ko-Kore-KR-u-kf-upper-kn"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Chuỗi định danh locale Unicode của _locale_.

## Mô tả

Đối tượng `Locale` là biểu diễn JavaScript của khái niệm định danh locale Unicode. Thông tin về một locale cụ thể (ngôn ngữ, chữ viết, loại lịch, v.v.) có thể được mã hóa trong một chuỗi định danh locale. Để làm việc với các định danh locale này dễ dàng hơn, đối tượng `Locale` đã được giới thiệu vào JavaScript. Gọi phương thức `toString` trên đối tượng Locale sẽ trả về chuỗi định danh cho Locale cụ thể đó. Phương thức `toString` cho phép các instance `Locale` được cung cấp làm đối số cho các hàm khởi tạo `Intl` hiện có, được serialize trong JSON, hoặc bất kỳ ngữ cảnh nào khác cần biểu diễn chuỗi chính xác.

## Ví dụ

### Sử dụng toString

```js
const myLocale = new Intl.Locale("fr-Latn-FR", {
  hourCycle: "h12",
  calendar: "gregory",
});
console.log(myLocale.baseName); // Prints "fr-Latn-FR"
console.log(myLocale.toString()); // Prints "fr-Latn-FR-u-ca-gregory-hc-h12"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- {{jsxref("Intl/Locale/baseName", "baseName")}}
