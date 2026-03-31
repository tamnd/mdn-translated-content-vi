---
title: Intl.Locale() constructor
short-title: Intl.Locale()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/Locale
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.Locale.Locale
sidebar: jsref
---

Hàm khởi tạo **`Intl.Locale()`** tạo ra các đối tượng {{jsxref("Intl.Locale")}}.

{{InteractiveExample("JavaScript Demo: Intl.Locale() constructor")}}

```js interactive-example
const korean = new Intl.Locale("ko", {
  script: "Kore",
  region: "KR",
  hourCycle: "h23",
  calendar: "gregory",
});

const japanese = new Intl.Locale("ja-Jpan-JP-u-ca-japanese-hc-h12");

console.log(korean.baseName, japanese.baseName);
// Expected output: "ko-Kore-KR" "ja-Jpan-JP"

console.log(korean.hourCycle, japanese.hourCycle);
// Expected output: "h23" "h12"
```

## Cú pháp

```js-nolint
new Intl.Locale(tag)
new Intl.Locale(tag, options)
```

> [!NOTE]
> `Intl.Locale()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `tag`
  - : Chuỗi định danh locale Unicode. Để biết cú pháp của chuỗi định danh locale, xem [trang chính Intl](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument). Lưu ý rằng hàm khởi tạo `Intl.Locale`, khác với hầu hết các hàm khởi tạo `Intl` khác, không chấp nhận mảng các locale hoặc `undefined`.
- `options`
  - : Đối tượng chứa cấu hình cho Locale. Các giá trị tùy chọn ở đây có ưu tiên cao hơn các khóa mở rộng trong định danh locale. Các thuộc tính có thể có:
    - `language`
      - : [Ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/language). Bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp [`unicode_language_subtag`](https://unicode.org/reports/tr35/#unicode_language_subtag) (2–3 hoặc 5–8 chữ cái) đều được chấp nhận, nhưng triển khai chỉ nhận diện một số loại nhất định.
    - `script`
      - : [Chữ viết](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/script). Bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp [`unicode_script_subtag`](https://unicode.org/reports/tr35/#unicode_script_subtag) (4 chữ cái) đều được chấp nhận, nhưng triển khai chỉ nhận diện một số loại nhất định.
    - `region`
      - : [Vùng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/region). Bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp [`unicode_region_subtag`](https://unicode.org/reports/tr35/#unicode_region_subtag) (2 chữ cái hoặc 3 chữ số) đều được chấp nhận, nhưng triển khai chỉ nhận diện một số loại nhất định.
    - `variants`
      - : [Biến thể](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/variants). Phải là danh sách các thẻ biến thể _duy nhất_ được phân tách bằng dấu gạch ngang (`-`), trong đó mỗi thẻ là bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp [`unicode_variant_subtag`](https://unicode.org/reports/tr35/#unicode_variant_subtag) (5–8 ký tự chữ-số hoặc một chữ số theo sau 3 ký tự chữ-số), nhưng triển khai chỉ nhận diện một số loại nhất định.
    - `calendar`
      - : [Lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar). Bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp [`type`](https://unicode.org/reports/tr35/#Unicode_locale_identifier) (một hoặc nhiều đoạn 3–8 ký tự chữ-số, nối với nhau bằng dấu gạch ngang) đều được chấp nhận, nhưng triển khai chỉ nhận diện một số loại nhất định, được liệt kê trong [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types).
    - `collation`
      - : [Kiểu sắp xếp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/collation). Bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp `type` đều được chấp nhận, nhưng triển khai chỉ nhận diện một số loại nhất định, được liệt kê trong [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_collation_types).
    - `numberingSystem`
      - : [Hệ thống đánh số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/numberingSystem). Bất kỳ chuỗi hợp lệ về mặt cú pháp nào tuân theo ngữ pháp `type` đều được chấp nhận, nhưng triển khai chỉ nhận diện một số loại nhất định, được liệt kê trong [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types).
    - `caseFirst`
      - : [Tùy chọn sắp xếp ưu tiên chữ hoa/thường](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/caseFirst). Các giá trị có thể là `"upper"`, `"lower"` hoặc `"false"`.
    - `hourCycle`
      - : [Chu kỳ giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/hourCycle). Các giá trị có thể là `"h23"`, `"h12"`, `"h11"` hoặc `"h24"` ít được dùng trong thực tế, được giải thích trong [`Intl.Locale.prototype.getHourCycles`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/getHourCycles#supported_hour_cycle_types)
    - `numeric`
      - : [Tùy chọn sắp xếp số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/numeric). Giá trị boolean.

## Ví dụ

### Sử dụng cơ bản

Ở dạng đơn giản nhất, hàm khởi tạo `Intl.Locale()` nhận một chuỗi định danh locale làm đối số:

```js
const us = new Intl.Locale("en-US");
```

### Sử dụng hàm khởi tạo Locale với đối tượng tùy chọn

Hàm khởi tạo cũng nhận một đối số là đối tượng cấu hình tùy chọn, có thể chứa một số loại mở rộng. Ví dụ, đặt thuộc tính [`hourCycle`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/hourCycle) của đối tượng cấu hình thành loại chu kỳ giờ mong muốn, rồi truyền vào hàm khởi tạo:

```js
const locale = new Intl.Locale("en-US", { hourCycle: "h12" });
console.log(locale.hourCycle); // "h12"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Collator")}}
- [Canonical Unicode Locale Identifiers](https://www.unicode.org/reports/tr35/#Canonical_Unicode_Locale_Identifiers) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
