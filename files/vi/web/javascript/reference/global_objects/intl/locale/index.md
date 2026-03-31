---
title: Intl.Locale
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale
page-type: javascript-class
browser-compat: javascript.builtins.Intl.Locale
sidebar: jsref
---

Đối tượng **`Intl.Locale`** là một thuộc tính tích hợp sẵn tiêu chuẩn của đối tượng Intl, đại diện cho một định danh locale Unicode.

{{InteractiveExample("JavaScript Demo: Intl.Locale")}}

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

## Mô tả

Đối tượng **`Intl.Locale`** được tạo ra nhằm giúp thao tác với các locale Unicode dễ dàng hơn. Unicode biểu diễn locale bằng một chuỗi ký tự gọi là _định danh locale_. Định danh locale bao gồm một _định danh ngôn ngữ_ và các _thẻ mở rộng_. Định danh ngôn ngữ là phần cốt lõi của locale, gồm các thẻ phụ _language_ (ngôn ngữ), _script_ (chữ viết), _region_ (vùng) và _variants_ (biến thể). Thông tin bổ sung về locale được lưu trong các _thẻ mở rộng_ tùy chọn. Các thẻ mở rộng chứa thông tin về những khía cạnh của locale như loại lịch, loại đồng hồ và hệ thống đánh số.

Theo truyền thống, API Intl dùng chuỗi ký tự để biểu diễn locale, giống như Unicode. Đây là giải pháp đơn giản và nhẹ nhàng, hoạt động tốt trong hầu hết trường hợp. Tuy nhiên, việc thêm lớp Locale giúp phân tích cú pháp và thao tác ngôn ngữ, chữ viết, vùng cũng như các thẻ mở rộng dễ dàng hơn. Các thuộc tính của `Intl.Locale` sau đây tương ứng với các thẻ phụ của định danh locale Unicode:

| Thuộc tính                                                   | Thẻ phụ tương ứng                |
| ------------------------------------------------------------ | -------------------------------- |
| {{jsxref("Intl/Locale/language", "language")}}               | ID ngôn ngữ, phần đầu tiên       |
| {{jsxref("Intl/Locale/script", "script")}}                   | ID ngôn ngữ, phần sau `language` |
| {{jsxref("Intl/Locale/region", "region")}}                   | ID ngôn ngữ, phần sau `script`   |
| {{jsxref("Intl/Locale/variants", "variants")}}               | ID ngôn ngữ, phần sau `region`   |
| {{jsxref("Intl/Locale/calendar", "calendar")}}               | `ca` (mở rộng)                   |
| {{jsxref("Intl/Locale/caseFirst", "caseFirst")}}             | `kf` (mở rộng)                   |
| {{jsxref("Intl/Locale/collation", "collation")}}             | `co` (mở rộng)                   |
| {{jsxref("Intl/Locale/hourCycle", "hourCycle")}}             | `hc` (mở rộng)                   |
| {{jsxref("Intl/Locale/numberingSystem", "numberingSystem")}} | `nu` (mở rộng)                   |
| {{jsxref("Intl/Locale/numeric", "numeric")}}                 | `kn` (mở rộng)                   |

Thông tin trên được cung cấp đúng như khi đối tượng `Locale` được khởi tạo, mà không cần tra cứu cơ sở dữ liệu bên ngoài nào. Ngoài ra, đối tượng `Intl.Locale` còn cung cấp một số phương thức trả về thông tin thực tế của locale, chẳng hạn như các lịch, kiểu sắp xếp và hệ thống đánh số có sẵn.

## Hàm khởi tạo

- {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}
  - : Tạo một đối tượng `Locale` mới.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.Locale.prototype` và dùng chung cho tất cả các instance `Intl.Locale`.

- {{jsxref("Intl/Locale/baseName", "Intl.Locale.prototype.baseName")}}
  - : Trả về thông tin cơ bản, cốt lõi về `Locale` dưới dạng một chuỗi con của chuỗi dữ liệu đầy đủ.
- {{jsxref("Intl/Locale/calendar", "Intl.Locale.prototype.calendar")}}
  - : Trả về phần của `Locale` cho biết kỷ nguyên lịch của locale.
- {{jsxref("Intl/Locale/caseFirst", "Intl.Locale.prototype.caseFirst")}}
  - : Trả về thông tin liệu có xem xét chữ hoa/thường trong quy tắc sắp xếp của locale hay không.
- {{jsxref("Intl/Locale/collation", "Intl.Locale.prototype.collation")}}
  - : Trả về kiểu sắp xếp cho `Locale`, dùng để sắp xếp chuỗi theo quy tắc của locale.
- {{jsxref("Object/constructor", "Intl.Locale.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng instance. Với các instance `Intl.Locale`, giá trị khởi tạo là hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale")}}.
- {{jsxref("Intl/Locale/hourCycle", "Intl.Locale.prototype.hourCycle")}}
  - : Trả về quy ước định dạng thời gian được locale sử dụng.
- {{jsxref("Intl/Locale/language", "Intl.Locale.prototype.language")}}
  - : Trả về ngôn ngữ liên kết với locale.
- {{jsxref("Intl/Locale/numberingSystem", "Intl.Locale.prototype.numberingSystem")}}
  - : Trả về hệ thống đánh số mà locale sử dụng.
- {{jsxref("Intl/Locale/numeric", "Intl.Locale.prototype.numeric")}}
  - : Trả về thông tin liệu locale có xử lý đặc biệt khi sắp xếp ký tự số hay không.
- {{jsxref("Intl/Locale/region", "Intl.Locale.prototype.region")}}
  - : Trả về vùng lãnh thổ (thường là một quốc gia) liên kết với locale.
- {{jsxref("Intl/Locale/script", "Intl.Locale.prototype.script")}}
  - : Trả về hệ thống chữ viết dùng để ghi ngôn ngữ cụ thể trong locale.
- {{jsxref("Intl/Locale/variants", "Intl.Locale.prototype.variants")}}
  - : Trả về các thẻ phụ biến thể (chẳng hạn các hệ thống chính tả khác nhau) liên kết với locale.
- `Intl.Locale.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.Locale"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/Locale/getCalendars", "Intl.Locale.prototype.getCalendars()")}}
  - : Trả về một {{jsxref("Array")}} chứa các định danh lịch có sẵn theo quy tắc của locale.
- {{jsxref("Intl/Locale/getCollations", "Intl.Locale.prototype.getCollations()")}}
  - : Trả về một {{jsxref("Array")}} chứa các kiểu sắp xếp của `Locale`.
- {{jsxref("Intl/Locale/getHourCycles", "Intl.Locale.prototype.getHourCycles()")}}
  - : Trả về một {{jsxref("Array")}} chứa các định danh chu kỳ giờ, biểu thị đồng hồ 12 giờ ("h12"), đồng hồ 12 giờ kiểu Nhật ("h11"), đồng hồ 24 giờ ("h23") hoặc định dạng ít dùng "h24".
- {{jsxref("Intl/Locale/getNumberingSystems", "Intl.Locale.prototype.getNumberingSystems()")}}
  - : Trả về một {{jsxref("Array")}} chứa các định danh hệ thống đánh số có sẵn theo quy tắc của locale.
- {{jsxref("Intl/Locale/getTextInfo", "Intl.Locale.prototype.getTextInfo()")}}
  - : Trả về phần chỉ ra thứ tự ký tự `ltr` (trái sang phải) hoặc `rtl` (phải sang trái).
- {{jsxref("Intl/Locale/getTimeZones", "Intl.Locale.prototype.getTimeZones()")}}
  - : Trả về một {{jsxref("Array")}} chứa các định danh múi giờ liên kết với `Locale`.
- {{jsxref("Intl/Locale/getWeekInfo", "Intl.Locale.prototype.getWeekInfo()")}}
  - : Trả về [Các thành phần tuần theo UTS 35](https://www.unicode.org/reports/tr35/tr35-dates.html#Date_Patterns_Week_Elements) theo quy tắc locale.
- {{jsxref("Intl/Locale/maximize", "Intl.Locale.prototype.maximize()")}}
  - : Lấy các giá trị có khả năng nhất cho ngôn ngữ, chữ viết và vùng của locale dựa trên các giá trị hiện có.
- {{jsxref("Intl/Locale/minimize", "Intl.Locale.prototype.minimize()")}}
  - : Cố gắng xóa thông tin về locale mà lẽ ra sẽ được thêm vào khi gọi {{jsxref("Intl/Locale/maximize", "maximize()")}}.
- {{jsxref("Intl/Locale/toString", "Intl.Locale.prototype.toString()")}}
  - : Trả về chuỗi định danh locale đầy đủ của Locale.

## Ví dụ

### Sử dụng cơ bản

Ở dạng đơn giản nhất, hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} nhận một chuỗi định danh locale làm đối số:

```js
const us = new Intl.Locale("en-US");
```

### Sử dụng hàm khởi tạo Locale với đối tượng tùy chọn

Hàm khởi tạo cũng nhận một đối số là đối tượng cấu hình tùy chọn, có thể chứa một số loại mở rộng. Ví dụ, đặt thuộc tính {{jsxref("Intl/Locale/hourCycle", "hourCycle")}} của đối tượng cấu hình thành loại chu kỳ giờ mong muốn, rồi truyền vào hàm khởi tạo:

```js
const us12hour = new Intl.Locale("en-US", { hourCycle: "h12" });
console.log(us12hour.hourCycle); // Prints "h12"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.Locale` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-locale/)
- {{jsxref("Intl")}}
- [Canonical Unicode Locale Identifiers](https://www.unicode.org/reports/tr35/#Canonical_Unicode_Locale_Identifiers) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
