---
title: Intl.Locale.prototype.getCalendars()
short-title: getCalendars()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getCalendars
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getCalendars
sidebar: jsref
---

Phương thức **`getCalendars()`** của các instance {{jsxref("Intl.Locale")}} trả về danh sách một hoặc nhiều định danh lịch duy nhất cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `calendars`. Tuy nhiên, vì nó trả về một mảng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.calendars === locale.calendars` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getCalendars()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi đại diện cho tất cả các lịch thường dùng cho `Locale`, được sắp xếp theo thứ tự ưu tiên giảm dần. Nếu `Locale` đã có [`calendar`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar), thì mảng trả về chứa chính xác giá trị đó.

Để biết danh sách các loại lịch được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types).

## Ví dụ

### Lấy danh sách lịch được hỗ trợ

Nếu đối tượng `Locale` chưa có `calendar`, `getCalendars()` liệt kê tất cả các lịch thường dùng cho `Locale` đã cho. Để xem ví dụ về cách đặt `calendar` một cách rõ ràng, hãy xem [ví dụ về `calendar`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar#examples).

```js
const arEG = new Intl.Locale("ar-EG");
console.log(arEG.getCalendars()); // ["gregory", "coptic", "islamic", "islamic-civil", "islamic-tbla"]
```

```js
const jaJP = new Intl.Locale("ja-JP");
console.log(jaJP.getCalendars()); // ["gregory", "japanese"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.calendar`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar)
- [Unicode Calendar Identifier](https://www.unicode.org/reports/tr35/#UnicodeCalendarIdentifier) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
