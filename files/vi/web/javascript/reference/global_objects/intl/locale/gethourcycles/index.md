---
title: Intl.Locale.prototype.getHourCycles()
short-title: getHourCycles()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getHourCycles
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getHourCycles
sidebar: jsref
---

Phương thức **`getHourCycles()`** của các instance {{jsxref("Intl.Locale")}} trả về danh sách một hoặc nhiều định danh chu kỳ giờ duy nhất cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `hourCycles`. Tuy nhiên, vì nó trả về một mảng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.hourCycles === locale.hourCycles` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getHourCycles()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi đại diện cho tất cả các loại chu kỳ giờ thường dùng cho `Locale`, được sắp xếp theo thứ tự ưu tiên giảm dần. Nếu `Locale` đã có [`hourCycle`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/hourCycle), thì mảng trả về chứa chính xác giá trị đó.

Dưới đây là danh sách các loại chu kỳ giờ được hỗ trợ.

### Các loại chu kỳ giờ được hỗ trợ

- `h12`
  - : Hệ thống giờ dùng 1–12; tương ứng với 'h' trong pattern. Đồng hồ 12 giờ, với nửa đêm bắt đầu lúc 12:00 am. Ví dụ được dùng tại Hoa Kỳ.
- `h23`
  - : Hệ thống giờ dùng 0–23; tương ứng với 'H' trong pattern. Đồng hồ 24 giờ, với nửa đêm bắt đầu lúc 0:00.
- `h11`
  - : Hệ thống giờ dùng 0–11; tương ứng với 'K' trong pattern. Đồng hồ 12 giờ, với nửa đêm bắt đầu lúc 0:00 am. Chủ yếu dùng ở Nhật Bản.
- `h24`
  - : Hệ thống giờ dùng 1–24; tương ứng với 'k' trong pattern. Đồng hồ 24 giờ, với nửa đêm bắt đầu lúc 24:00. Không được dùng ở bất kỳ đâu.

## Ví dụ

### Lấy danh sách chu kỳ giờ được hỗ trợ

Nếu đối tượng `Locale` chưa có `hourCycle`, `getHourCycles()` liệt kê tất cả các định danh chu kỳ giờ thường dùng cho `Locale` đã cho. Để xem ví dụ về cách đặt `hourCycle` một cách rõ ràng, hãy xem [ví dụ về `hourCycle`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/hourCycle#examples).

```js
const arEG = new Intl.Locale("ar-EG");
console.log(arEG.getHourCycles()); // ["h12"]
```

```js
const jaJP = new Intl.Locale("ja-JP");
console.log(jaJP.getHourCycles()); // ["h23"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.hourCycle`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/hourCycle)
- [Unicode Hour Cycle Identifier](https://www.unicode.org/reports/tr35/#UnicodeHourCycleIdentifier) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
