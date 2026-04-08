---
title: Intl.DateTimeFormat.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DateTimeFormat.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.DateTimeFormat")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `DateTimeFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat.prototype.resolvedOptions()")}}

```js interactive-example
const region = new Intl.DateTimeFormat("zh-CN", { timeZone: "UTC" });
const options = region.resolvedOptions();

console.log(options.locale);
// Expected output: "zh-CN"

console.log(options.calendar);
// Expected output: "gregory"

console.log(options.numberingSystem);
// Expected output: "latn"
```

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `DateTimeFormat` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho ngôn ngữ thực sự được sử dụng, được xác định bởi quá trình [thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Chỉ các khóa mở rộng Unicode `ca`, `hc`, và `nu`, nếu được yêu cầu, mới có thể được bao gồm trong đầu ra.
- `calendar`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"ca"`, với giá trị mặc định được điền vào khi cần. Đây là [kiểu lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) được hỗ trợ cho ngôn ngữ này. Mặc định phụ thuộc vào ngôn ngữ.
- `numberingSystem`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"nu"`, với giá trị mặc định được điền vào khi cần. Đây là [hệ thống đánh số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types) được hỗ trợ cho ngôn ngữ này. Mặc định phụ thuộc vào ngôn ngữ.
- `timeZone`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Đây là [tên múi giờ IANA](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets). Mặc định là múi giờ mặc định của runtime.

    > [!NOTE]
    > Việc chuẩn hóa `Temporal` yêu cầu các trình duyệt sử dụng cùng mã định danh như được chỉ định ban đầu, không chuẩn hóa thành bí danh khác. Xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin.

- `hourCycle` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"hc"`, với giá trị mặc định được điền vào khi cần. Nếu `hour12` được cung cấp trong `options`, thì nó ghi đè các cài đặt `hourCycle` khác. Nó chỉ có mặt nếu các tùy chọn đã phân giải cũng bao gồm `hour` hoặc `timeStyle`. Nó là `"h11"`, `"h12"`, `"h23"`, hoặc `"h24"`. Mặc định phụ thuộc vào ngôn ngữ, mặc dù `"h24"` không bao giờ là mặc định.
- `hour12` {{optional_inline}}
  - : Được tính toán từ `hourCycle`. Nó chỉ có mặt nếu các tùy chọn đã phân giải cũng bao gồm `hour` hoặc `timeStyle`. Nó là `true` nếu `hourCycle` là `"h11"` hoặc `"h12"`, và `false` nếu `hourCycle` là `"h23"` hoặc `"h24"`.
- `weekday`, `era`, `year`, `month`, `day`, `dayPeriod`, `hour`, `minute`, `second`, `fractionalSecondDigits`, `timeZoneName` {{optional_inline}}
  - : Các giá trị kết quả từ việc khớp định dạng giữa các thuộc tính tương ứng trong đối số `options` và các sự kết hợp và biểu diễn có sẵn để định dạng ngày giờ trong ngôn ngữ đã chọn. Một số thuộc tính này có thể không có mặt, biểu thị rằng các thành phần tương ứng sẽ không được biểu diễn trong đầu ra đã định dạng. `weekday`, `era`, và `dayPeriod` là `"narrow"`, `"short"`, hoặc `"long"`; `year`, `day`, `hour`, `minute`, và `second` là `"numeric"`, `"2-digit"`, hoặc `"narrow"`; `month` là `"numeric"`, `"2-digit"`, `"narrow"`, `"short"`, hoặc `"long"`; `fractionalSecondDigits` là `1`, `2`, hoặc `3`; `timeZoneName` là `"short"`, `"long"`, `"shortOffset"`, `"longOffset"`, `"shortGeneric"`, hoặc `"longGeneric"`.

    Nếu các thuộc tính này được yêu cầu trong `options`, constructor ngăn không cho chỉ định `dateStyle` và `timeStyle`, vì vậy nhóm bên dưới sẽ không bao giờ có mặt.

- `dateStyle`, `timeStyle` {{optional_inline}}
  - : Các giá trị được cung cấp cho các thuộc tính này trong đối số `options`. Chúng là `"full"`, `"long"`, `"medium"`, `"short"`, hoặc `"none"`. Một số thuộc tính này có thể không có mặt, biểu thị rằng các thành phần tương ứng sẽ không được biểu diễn trong đầu ra đã định dạng.

    Nếu các thuộc tính này được yêu cầu trong `options`, constructor ngăn không cho chỉ định các tùy chọn thành phần ngày giờ riêng lẻ, vì vậy nhóm bên trên sẽ không bao giờ có mặt.

    > [!NOTE]
    > Mặc dù `dateStyle` và `timeStyle` là phím tắt cho các kiểu thành phần ngày và giờ riêng lẻ, các kiểu thành phần cụ thể (phụ thuộc vào ngôn ngữ) mà chúng phân giải thành không được bao gồm trong các tùy chọn đã phân giải. Điều này đảm bảo kết quả của `resolvedOptions()` có thể được truyền trực tiếp vào constructor `Intl.DateTimeFormat()` (vì một đối tượng `options` có cả `dateStyle` hoặc `timeStyle` lẫn các kiểu thành phần ngày hoặc giờ riêng lẻ là không hợp lệ).

## Ví dụ

### Sử dụng phương thức resolvedOptions

```js
const germanFakeRegion = new Intl.DateTimeFormat("de-XX", { timeZone: "UTC" });
const usedOptions = germanFakeRegion.resolvedOptions();

usedOptions.locale; // "de" (because "de-XX" does not exist)
usedOptions.calendar; // "gregory"
usedOptions.numberingSystem; // "latn"
usedOptions.timeZone; // "UTC"
usedOptions.month; // "numeric"
```

### Lấy múi giờ và tùy chọn ngôn ngữ của người dùng

Constructor `Intl.DateTimeFormat` không có tùy chọn nào sử dụng cài đặt hệ thống hiện tại. Bạn có thể sử dụng `resolvedOptions()` để lấy múi giờ hiện tại và lịch và hệ thống đánh số ưa thích của ngôn ngữ người dùng:

```js
const systemOptions = new Intl.DateTimeFormat().resolvedOptions();
systemOptions.timeZone; // e.g., "Europe/Brussels" or "Asia/Riyadh"
systemOptions.calendar; // e.g., "gregory" or "islamic-umalqura"
systemOptions.numberingSystem; // e.g., "latn" or "arab"
systemOptions.locale; // e.g., "nl-BE" or "ar-SA"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
