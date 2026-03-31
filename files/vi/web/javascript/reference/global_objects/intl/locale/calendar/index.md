---
title: Intl.Locale.prototype.calendar
short-title: calendar
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.calendar
sidebar: jsref
---

Thuộc tính truy cập **`calendar`** của các instance {{jsxref("Intl.Locale")}} trả về loại lịch cho locale này.

## Mô tả

Mặc dù phần lớn thế giới sử dụng lịch Gregory, có nhiều kỷ nguyên lịch theo vùng được dùng trên thế giới. Để biết danh sách các loại lịch được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types).

Giá trị của thuộc tính `calendar` được đặt lúc khởi tạo, thông qua khóa `ca` của định danh locale hoặc thông qua tùy chọn `calendar` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `calendar` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, loại lịch có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm loại lịch qua chuỗi locale

Trong [đặc tả chuỗi locale Unicode](https://www.unicode.org/reports/tr35/), `calendar` là một "thẻ phụ mở rộng". Các thẻ phụ này thêm dữ liệu bổ sung về locale và được thêm vào định danh locale bằng khóa mở rộng `-u`. Để thêm loại lịch vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}, trước tiên hãy thêm khóa mở rộng `-u` nếu chưa có. Tiếp theo, thêm phần mở rộng `-ca` để chỉ ra rằng bạn đang thêm loại lịch. Cuối cùng, thêm loại kỷ nguyên lịch.

```js
const locale = new Intl.Locale("fr-FR-u-ca-buddhist");
console.log(locale.calendar); // "buddhist"
```

### Thêm loại lịch qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể chứa bất kỳ loại mở rộng nào, bao gồm cả lịch. Đặt thuộc tính `calendar` của đối tượng cấu hình thành kỷ nguyên lịch mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("fr-FR", { calendar: "buddhist" });
console.log(locale.calendar); // "buddhist"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.getCalendars()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/getCalendars)
- [Unicode Calendar Identifier](https://www.unicode.org/reports/tr35/#UnicodeCalendarIdentifier) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
