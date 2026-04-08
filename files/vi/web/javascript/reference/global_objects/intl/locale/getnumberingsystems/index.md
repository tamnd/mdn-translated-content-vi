---
title: Intl.Locale.prototype.getNumberingSystems()
short-title: getNumberingSystems()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getNumberingSystems
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getNumberingSystems
sidebar: jsref
---

Phương thức **`getNumberingSystems()`** của các instance {{jsxref("Intl.Locale")}} trả về danh sách một hoặc nhiều định danh [hệ thống đánh số](https://en.wikipedia.org/wiki/Numeral_system) duy nhất cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `numberingSystems`. Tuy nhiên, vì nó trả về một mảng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.numberingSystems === locale.numberingSystems` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getNumberingSystems()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi đại diện cho tất cả các hệ thống đánh số thường dùng cho `Locale`, được sắp xếp theo thứ tự ưu tiên giảm dần. Nếu `Locale` đã có [`numberingSystem`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/numberingSystem), thì mảng trả về chứa chính xác giá trị đó.

Để biết danh sách các loại hệ thống đánh số được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types).

## Ví dụ

### Lấy danh sách hệ thống đánh số được hỗ trợ

Nếu đối tượng `Locale` chưa có `numberingSystem`, `getNumberingSystems()` liệt kê tất cả các hệ thống đánh số thường dùng cho `Locale` đã cho. Để xem ví dụ về cách đặt `numberingSystem` một cách rõ ràng, hãy xem [ví dụ về `numberingSystem`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/numberingSystem#examples).

```js
const arEG = new Intl.Locale("ar-EG");
console.log(arEG.getNumberingSystems()); // ["arab"]
```

```js
const ja = new Intl.Locale("ja");
console.log(ja.getNumberingSystems()); // ["latn"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.numberingSystem`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/numberingSystem)
- [Chi tiết về các hệ thống đánh số Unicode tiêu chuẩn](https://github.com/unicode-org/cldr/blob/main/common/supplemental/numberingSystems.xml)
