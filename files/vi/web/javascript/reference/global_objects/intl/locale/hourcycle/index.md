---
title: Intl.Locale.prototype.hourCycle
short-title: hourCycle
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/hourCycle
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.hourCycle
sidebar: jsref
---

Thuộc tính truy cập **`hourCycle`** của các instance {{jsxref("Intl.Locale")}} trả về loại chu kỳ giờ cho locale này.

## Mô tả

Có 2 loại quy ước đo thời gian (đồng hồ) chính được dùng trên thế giới: đồng hồ 12 giờ và đồng hồ 24 giờ. Để biết danh sách các loại chu kỳ giờ được hỗ trợ, xem [`Intl.Locale.prototype.getHourCycles()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/getHourCycles#supported_hour_cycle_types).

Giá trị của thuộc tính `hourCycle` được đặt lúc khởi tạo, thông qua khóa `hc` của định danh locale hoặc thông qua tùy chọn `hourCycle` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `hourCycle` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, loại chu kỳ giờ có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm chu kỳ giờ qua chuỗi locale

Trong [đặc tả chuỗi locale Unicode](https://www.unicode.org/reports/tr35/), `hourCycle` là một "thẻ phụ mở rộng". Các thẻ phụ này thêm dữ liệu bổ sung về locale và được thêm vào định danh locale bằng khóa mở rộng `-u`. Để thêm loại chu kỳ giờ vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}, trước tiên hãy thêm khóa mở rộng `-u` nếu chưa có. Tiếp theo, thêm phần mở rộng `-hc` để chỉ ra rằng bạn đang thêm chu kỳ giờ. Cuối cùng, thêm loại chu kỳ giờ.

```js
const locale = new Intl.Locale("fr-FR-u-hc-h23");
console.log(locale.hourCycle); // "h23"
```

### Thêm chu kỳ giờ qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể chứa bất kỳ loại mở rộng nào, bao gồm loại chu kỳ giờ. Đặt thuộc tính `hourCycle` của đối tượng cấu hình thành loại chu kỳ giờ mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("en-US", { hourCycle: "h12" });
console.log(locale.hourCycle); // "h12"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.getHourCycles()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/getHourCycles)
- [Unicode Hour Cycle Identifier](https://www.unicode.org/reports/tr35/#UnicodeHourCycleIdentifier) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
