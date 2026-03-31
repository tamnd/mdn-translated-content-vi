---
title: Intl.Locale.prototype.minimize()
short-title: minimize()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/minimize
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.minimize
sidebar: jsref
---

Phương thức **`minimize()`** của các instance {{jsxref("Intl.Locale")}} cố gắng xóa thông tin về locale mà lẽ ra sẽ được thêm vào khi gọi {{jsxref("Intl/Locale/maximize", "maximize()")}}.

{{InteractiveExample("JavaScript Demo: Intl.Locale.prototype.minimize()")}}

```js interactive-example
const english = new Intl.Locale("en-Latn-US");
const korean = new Intl.Locale("ko-Kore-KR");
const arabic = new Intl.Locale("ar-Arab-EG");

console.log(english.minimize().baseName);
// Expected output: "en"

console.log(korean.minimize().baseName);
// Expected output: "ko"

console.log(arabic.minimize().baseName);
// Expected output: "ar"
```

## Cú pháp

```js-nolint
minimize()
```

### Tham số

Không có.

### Giá trị trả về

Một instance {{jsxref("Intl.Locale")}} có thuộc tính `baseName` trả về kết quả của thuật toán [Remove Likely Subtags](https://www.unicode.org/reports/tr35/#Likely_Subtags) được thực thi trên _{{jsxref("Intl/Locale/baseName", "locale.baseName")}}_.

## Mô tả

Phương thức này thực hiện ngược lại với {{jsxref("Intl/Locale/maximize", "maximize()")}}, xóa bỏ bất kỳ thẻ phụ ngôn ngữ, chữ viết hoặc vùng nào khỏi định danh ngôn ngữ locale (về cơ bản là nội dung của `baseName`). Điều này hữu ích khi có các thẻ phụ thừa trong định danh ngôn ngữ; ví dụ, "en-Latn" có thể được rút gọn thành "en", vì "Latn" là chữ viết duy nhất được dùng để viết tiếng Anh. `minimize()` chỉ ảnh hưởng đến các thẻ phụ chính tạo nên [định danh ngôn ngữ](https://www.unicode.org/reports/tr35/#Language_Locale_Field_Definitions): các thẻ phụ ngôn ngữ, chữ viết và vùng. Các thẻ phụ khác sau "-u" trong định danh locale được gọi là thẻ phụ mở rộng và không bị ảnh hưởng bởi phương thức `minimize()`. Ví dụ về các thẻ phụ này là {{jsxref("Intl/Locale/hourCycle", "hourCycle")}}, {{jsxref("Intl/Locale/calendar", "calendar")}} và {{jsxref("Intl/Locale/numeric", "numeric")}}.

## Ví dụ

### Sử dụng minimize

```js
const myLocale = new Intl.Locale("fr-Latn-FR", {
  hourCycle: "h12",
  calendar: "gregory",
});
console.log(myLocale.baseName); // Prints "fr-Latn-FR"
console.log(myLocale.toString()); // Prints "fr-Latn-FR-u-ca-gregory-hc-h12"

const myLocMinimized = myLocale.minimize();

// Prints "fr", since French is only written in the Latin script
// and is most likely to be spoken in France.
console.log(myLocMinimized.baseName);

// Prints "fr-u-ca-gregory-hc-h12".
// Note that the extension tags (after "-u") remain unchanged.
console.log(myLocMinimized.toString());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- {{jsxref("Intl/Locale/baseName", "baseName")}}
