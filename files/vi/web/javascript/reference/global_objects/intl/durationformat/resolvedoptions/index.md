---
title: Intl.DurationFormat.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DurationFormat.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.DurationFormat")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `DurationFormat` này.

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `DurationFormat` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho ngôn ngữ thực sự được sử dụng, được xác định bởi quá trình [thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Chỉ khóa mở rộng Unicode `nu`, nếu được yêu cầu, mới có thể được bao gồm trong đầu ra.
- `numberingSystem`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"nu"`, với giá trị mặc định được điền vào khi cần. Đây là [hệ thống đánh số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types) được hỗ trợ cho ngôn ngữ này. Mặc định phụ thuộc vào ngôn ngữ.
- `style`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Nó là `"long"`, `"short"`, `"narrow"`, hoặc `"digital"`. Mặc định là `"short"`.
- `years`, `yearsDisplay`, `months`, `monthsDisplay`, `weeks`, `weeksDisplay`, `days`, `daysDisplay`, `hours`, `hoursDisplay`, `minutes`, `minutesDisplay`, `seconds`, `secondsDisplay`, `milliseconds`, `millisecondsDisplay`, `nanoseconds`, `nanosecondsDisplay`
  - : Các giá trị được cung cấp cho các thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Để biết các giá trị hợp lệ và giá trị mặc định cho từng thuộc tính, xem đối số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/DurationFormat#options) của constructor.
- `fractionalDigits` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`. Nó chỉ có mặt nếu được chỉ định trong `options`. Đây là số nguyên từ 0 đến 9, kể cả.

## Ví dụ

### Sử dụng phương thức resolvedOptions

```js
const duration = new Intl.DurationFormat("en");
const usedOptions = duration.resolvedOptions();

usedOptions.locale; // "en"
usedOptions.numberingSystem; // "latn"
usedOptions.years; // "long"
usedOptions.yearsDisplay; // "auto"
usedOptions.style; // "long"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Intl.supportedValuesOf()")}}
- {{jsxref("Intl")}}
