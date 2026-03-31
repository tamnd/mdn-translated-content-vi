---
title: Intl.Locale.prototype.script
short-title: script
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/script
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.script
sidebar: jsref
---

Thuộc tính truy cập **`script`** của các instance {{jsxref("Intl.Locale")}} trả về hệ thống chữ viết dùng để ghi ngôn ngữ cụ thể được dùng trong locale này.

## Mô tả

Chữ viết, đôi khi còn gọi là hệ thống chữ viết, là một trong những thuộc tính cốt lõi của locale. Nó chỉ ra tập hợp các ký hiệu, hay glyph, được dùng để viết một ngôn ngữ cụ thể. Ví dụ, chữ viết liên kết với tiếng Anh là Latin, trong khi chữ viết thường liên kết với tiếng Hàn là Hangul. Trong nhiều trường hợp, việc chỉ định chữ viết không thực sự cần thiết, vì ngôn ngữ (vốn là bắt buộc) chỉ được viết bằng một chữ viết duy nhất. Tuy nhiên có ngoại lệ cho quy tắc này, và việc chỉ ra chữ viết là quan trọng khi có nhiều chữ viết có thể áp dụng.

Giá trị của thuộc tính `script` được đặt lúc khởi tạo, thông qua phần của định danh locale sau `language` hoặc thông qua tùy chọn `script` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `script` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, chữ viết có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm chữ viết qua chuỗi locale

Chữ viết, nếu có, là phần thứ hai của chuỗi định danh ngôn ngữ Unicode hợp lệ, và có thể được thêm vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Lưu ý rằng chữ viết không phải là phần bắt buộc của định danh locale.

```js
const locale = new Intl.Locale("en-Latn-US");
console.log(locale.script); // "Latn"
```

### Thêm chữ viết qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn. Đặt thuộc tính `script` của đối tượng cấu hình thành chữ viết mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("fr-FR", { script: "Latn" });
console.log(locale.script); // "Latn"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [Thẻ phụ chữ viết Unicode](https://www.unicode.org/reports/tr35/#unicode_script_subtag_validity) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
