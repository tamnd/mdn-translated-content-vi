---
title: Intl.Locale.prototype.variants
short-title: variants
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/variants
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.variants
sidebar: jsref
---

Thuộc tính truy cập **`variants`** của các instance {{jsxref("Intl.Locale")}} trả về các biến thể liên kết với locale này, dưới dạng chuỗi các định danh được phân tách bằng dấu gạch ngang (`-`) theo thứ tự được chỉ định ban đầu.

## Mô tả

Biến thể là một phần của ID ngôn ngữ chính. Chúng chọn các biến thể của một ngôn ngữ mà bộ ba (ngôn ngữ, vùng, chữ viết) không thể phân biệt được. Thông thường, chúng đại diện cho cùng một ngôn ngữ trong các thời kỳ khác nhau hoặc các cách viết chính tả khác nhau. Ví dụ, tiếng Đức có các biến thể chính tả `1901` và `1996`, được viết là `de-1901` và `de-1996`; biến thể "Tiếng Anh Cổ Đại sơ kỳ (1500-1700)" được viết là `en-emodeng`. Thẻ phụ có thể chứa nhiều định danh được phân tách bằng dấu gạch ngang (`-`). Về mặt kỹ thuật, các định danh này không có thứ tự, mặc dù trong thực tế chúng thường có thứ bậc ngữ nghĩa — ví dụ, phương ngữ Resian của tiếng Slovenia được viết là `sl-rozaj`, và phương ngữ San Giorgio/Bila của Resian được viết là `sl-rozaj-biske`.

Giá trị của thuộc tính `variants` được đặt lúc khởi tạo, thông qua phần của định danh locale sau `region` hoặc thông qua tùy chọn `variants` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `variants` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, biến thể có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm biến thể qua chuỗi locale

Các biến thể, nếu có, là các phần cuối cùng của chuỗi định danh ngôn ngữ Unicode hợp lệ, và có thể được thêm vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Lưu ý rằng biến thể không phải là phần bắt buộc của định danh locale.

```js
const locale = new Intl.Locale("sl-rozaj-biske");
console.log(locale.variants); // "rozaj-biske"
```

### Thêm biến thể qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn. Đặt thuộc tính `variants` của đối tượng cấu hình thành biến thể mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("sl", { variants: "rozaj-biske" });
console.log(locale.variants); // "rozaj-biske"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [Thẻ phụ biến thể Unicode](https://www.unicode.org/reports/tr35/#unicode_variant_subtag_validity) trong đặc tả ngôn ngữ đánh dấu dữ liệu locale Unicode
- [Sổ đăng ký thẻ phụ ngôn ngữ IANA](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry)
