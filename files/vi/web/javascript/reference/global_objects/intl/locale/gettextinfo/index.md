---
title: Intl.Locale.prototype.getTextInfo()
short-title: getTextInfo()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getTextInfo
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getTextInfo
sidebar: jsref
---

Phương thức **`getTextInfo()`** của các instance {{jsxref("Intl.Locale")}} trả về thứ tự của ký tự được biểu thị bằng `ltr` (trái sang phải) hoặc `rtl` (phải sang trái) cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `textInfo`. Tuy nhiên, vì nó trả về một đối tượng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.textInfo === locale.textInfo` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getTextInfo()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng đại diện cho thông tin kiểu chữ liên quan đến dữ liệu Locale được chỉ định trong [Các thành phần bố cục UTS 35](https://www.unicode.org/reports/tr35/tr35-general.html#Layout_Elements). Nó có các thuộc tính sau:

- `direction`
  - : Chuỗi chỉ ra hướng của văn bản cho locale. Có thể là `"ltr"` (trái sang phải) hoặc `"rtl"` (phải sang trái).

## Ví dụ

### Lấy thông tin văn bản

Trả về các hướng văn bản được hỗ trợ cho một `Locale` nhất định.

```js
const ar = new Intl.Locale("ar");
console.log(ar.getTextInfo()); // { direction: "rtl" }
console.log(ar.getTextInfo().direction); // "rtl"
```

```js
const es = new Intl.Locale("es");
console.log(es.getTextInfo()); // { direction: "ltr" }
console.log(es.getTextInfo().direction); // "ltr"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
