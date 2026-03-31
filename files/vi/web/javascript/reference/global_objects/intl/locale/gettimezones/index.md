---
title: Intl.Locale.prototype.getTimeZones()
short-title: getTimeZones()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getTimeZones
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getTimeZones
sidebar: jsref
---

Phương thức **`getTimeZones()`** của các instance {{jsxref("Intl.Locale")}} trả về danh sách các múi giờ được hỗ trợ cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `timeZones`. Tuy nhiên, vì nó trả về một mảng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.timeZones === locale.timeZones` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getTimeZones()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi đại diện cho các múi giờ được hỗ trợ cho `Locale` liên kết, trong đó mỗi giá trị là [tên chính tắc của múi giờ IANA](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets), được sắp xếp theo thứ tự bảng chữ cái. Nếu định danh locale không chứa thẻ phụ vùng, giá trị trả về là `undefined`.

> [!NOTE]
> Việc chuẩn hóa `Temporal` yêu cầu trình duyệt luôn trả về định danh chính trong cơ sở dữ liệu IANA, có thể thay đổi theo thời gian. Xem [múi giờ và độ lệch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin.

## Ví dụ

### Lấy danh sách múi giờ được hỗ trợ

Liệt kê các múi giờ được hỗ trợ cho một `Locale` nhất định.

```js
const arEG = new Intl.Locale("ar-EG");
console.log(arEG.getTimeZones()); // ["Africa/Cairo"]
```

```js
const jaJP = new Intl.Locale("ja-JP");
console.log(jaJP.getTimeZones()); // ["Asia/Tokyo"]
```

```js
const ar = new Intl.Locale("ar");
console.log(ar.getTimeZones()); // undefined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [Cơ sở dữ liệu múi giờ IANA](https://en.wikipedia.org/wiki/Daylight_saving_time#IANA_time_zone_database) trên Wikipedia
