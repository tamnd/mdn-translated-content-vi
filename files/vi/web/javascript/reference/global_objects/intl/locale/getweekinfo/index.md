---
title: Intl.Locale.prototype.getWeekInfo()
short-title: getWeekInfo()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getWeekInfo
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getWeekInfo
sidebar: jsref
---

Phương thức **`getWeekInfo()`** của các instance {{jsxref("Intl.Locale")}} trả về đối tượng `weekInfo` với các thuộc tính `firstDay`, `weekend` và `minimalDays` cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `weekInfo`. Tuy nhiên, vì nó trả về một đối tượng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.weekInfo === locale.weekInfo` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getWeekInfo()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng đại diện cho thông tin tuần liên quan đến dữ liệu Locale được chỉ định trong [Các thành phần tuần UTS 35](https://www.unicode.org/reports/tr35/tr35-dates.html#Date_Patterns_Week_Elements). Nó có các thuộc tính sau:

- `firstDay`
  - : Số nguyên từ 1 (Thứ Hai) đến 7 (Chủ Nhật) chỉ ra ngày đầu tiên trong tuần của locale. Thường là 1, 5, 6 hoặc 7.
- `weekend`
  - : Mảng các số nguyên từ 1 đến 7 chỉ ra các ngày cuối tuần của locale. Thường liên tục vì UTS 35 lưu trữ `weekendStart` và `weekendEnd` thay vì.
- `minimalDays`
  - : Số nguyên từ 1 đến 7 (thường là 1 và 4) chỉ ra số ngày tối thiểu cần có trong tuần đầu tiên của tháng hoặc năm, dùng để tính tuần-của-năm hoặc tuần-của-tháng (ví dụ, tuần thứ 20 của năm). Ví dụ, trong lịch [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601), tuần đầu tiên của năm phải có ít nhất 4 ngày trong năm đó, vì vậy nếu ngày 1 tháng 1 là Thứ Sáu, Thứ Bảy hoặc Chủ Nhật, nó sẽ được đánh số là một phần của tuần cuối của năm trước.

## Ví dụ

### Lấy thông tin tuần

Trả về thông tin tuần cho một `Locale` nhất định.

```js
const he = new Intl.Locale("he"); // Hebrew (Israel)
console.log(he.getWeekInfo()); // { firstDay: 7, weekend: [5, 6], minimalDays: 1 }

const af = new Intl.Locale("af"); // Afrikaans (South Africa)
console.log(af.getWeekInfo()); // { firstDay: 7, weekend: [6, 7], minimalDays: 1 }

const enGB = new Intl.Locale("en-GB"); // English (United Kingdom)
console.log(enGB.getWeekInfo()); // { firstDay: 1, weekend: [6, 7], minimalDays: 4 }

const arAF = new Intl.Locale("ar-AF"); // Arabic (Afghanistan)
console.log(arAF.getWeekInfo()); // { firstDay: 6, weekend: [4, 5], minimalDays: 1 }

const dvMV = new Intl.Locale("dv-MV"); // Divehi (Maldives)
console.log(dvMV.getWeekInfo()); // { firstDay: 5, weekend: [6, 7], minimalDays: 1 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
