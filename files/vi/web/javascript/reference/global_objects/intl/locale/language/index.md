---
title: Intl.Locale.prototype.language
short-title: language
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/language
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.language
sidebar: jsref
---

Thuộc tính truy cập **`language`** của các instance {{jsxref("Intl.Locale")}} trả về ngôn ngữ liên kết với locale này.

## Mô tả

Ngôn ngữ là một trong những thuộc tính cốt lõi của locale. Đặc tả Unicode coi định danh ngôn ngữ của một locale là sự kết hợp của ngôn ngữ và vùng lãnh thổ (để phân biệt các phương ngữ và biến thể, ví dụ tiếng Anh Anh và tiếng Anh Mỹ). Thuộc tính `language` của {{jsxref("Intl.Locale")}} chỉ trả về thẻ phụ ngôn ngữ của locale.

Giá trị của thuộc tính `language` được đặt lúc khởi tạo, thông qua phần đầu tiên của định danh locale hoặc thông qua tùy chọn `language` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt.

Set accessor của `language` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, ngôn ngữ có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Đặt ngôn ngữ qua chuỗi locale

Để là định danh locale Unicode hợp lệ, chuỗi phải bắt đầu bằng thẻ phụ ngôn ngữ. Đối số chính của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} phải là định danh locale Unicode hợp lệ, do đó bất cứ khi nào sử dụng hàm khởi tạo, phải truyền vào một định danh có thẻ phụ ngôn ngữ.

```js
const locale = new Intl.Locale("en-Latn-US");
console.log(locale.language); // "en"
```

### Ghi đè ngôn ngữ qua đối số đối tượng cấu hình

Mặc dù thẻ phụ ngôn ngữ phải được chỉ định, hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể ghi đè thẻ phụ ngôn ngữ.

```js
const locale = new Intl.Locale("en-Latn-US", { language: "es" });
console.log(locale.language); // "es"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [Thẻ phụ ngôn ngữ Unicode](https://www.unicode.org/reports/tr35/#unicode_language_subtag_validity) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
