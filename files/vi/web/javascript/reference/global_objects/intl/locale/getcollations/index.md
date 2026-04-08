---
title: Intl.Locale.prototype.getCollations()
short-title: getCollations()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/getCollations
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Locale.getCollations
sidebar: jsref
---

Phương thức **`getCollations()`** của các instance {{jsxref("Intl.Locale")}} trả về danh sách một hoặc nhiều [kiểu sắp xếp](https://www.unicode.org/reports/tr35/tr35-collation.html#CLDR_collation) cho locale này.

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai dưới dạng thuộc tính truy cập có tên `collations`. Tuy nhiên, vì nó trả về một mảng mới mỗi lần truy cập, nó hiện được triển khai dưới dạng phương thức để tránh tình huống `locale.collations === locale.collations` trả về `false`. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết.

## Cú pháp

```js-nolint
getCollations()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi đại diện cho tất cả các kiểu sắp xếp thường dùng cho `Locale`, được sắp xếp theo thứ tự bảng chữ cái, với các giá trị `standard` và `search` luôn bị loại trừ. Nếu `Locale` đã có [`collation`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/collation), thì mảng trả về chứa chính xác giá trị đó.

Để biết danh sách các kiểu sắp xếp được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_collation_types).

## Ví dụ

### Lấy danh sách kiểu sắp xếp được hỗ trợ

Nếu đối tượng `Locale` chưa có `collation`, `getCollations()` liệt kê tất cả các kiểu sắp xếp thường dùng cho `Locale` đã cho. Để xem ví dụ về cách đặt `collation` một cách rõ ràng, hãy xem [ví dụ về `collation`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/collation#examples).

```js
const locale = new Intl.Locale("zh");
console.log(locale.getCollations()); // ["pinyin", "stroke", "zhuyin", "emoji", "eor"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.collation`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/collation)
