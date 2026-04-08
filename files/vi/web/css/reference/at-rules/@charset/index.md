---
title: "@charset"
slug: Web/CSS/Reference/At-rules/@charset
page-type: css-at-rule
browser-compat: css.at-rules.charset
sidebar: cssref
---

Quy tắc **`@charset`** [CSS](/en-US/docs/Web/CSS) chỉ định bộ mã ký tự được sử dụng trong stylesheet. Cú pháp này hữu ích khi dùng các ký tự không phải {{Glossary("ASCII")}} trong một số thuộc tính CSS, chẳng hạn như {{ cssxref("content") }}. Mặc dù ký tự đầu tiên trong `@charset` là ký hiệu `@`, nó không phải là một [quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules). Nó là một chuỗi byte cụ thể chỉ có thể đặt ở đầu stylesheet. Không có ký tự nào khác, ngoại trừ ký hiệu thứ tự byte Unicode, được phép đứng trước nó. Nó cũng không tuân theo các quy tắc cú pháp CSS thông thường như sử dụng dấu nháy hay khoảng trắng.

Nếu `@charset` không được nhận dạng là khai báo charset, nó sẽ được phân tích như một quy tắc at thông thường. [Mô-đun cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax) không khuyến khích hành vi dự phòng này, định nghĩa nó là một quy tắc kế thừa không được nhận dạng sẽ bị loại bỏ khi kiểm tra ngữ pháp stylesheet.

Do có nhiều cách định nghĩa bộ mã ký tự của stylesheet, trình duyệt sẽ thử các phương thức sau theo thứ tự (và dừng lại ngay khi một phương thức cho kết quả):

1. Giá trị của ký tự [thứ tự byte Unicode](https://en.wikipedia.org/wiki/Byte_order_mark) đặt ở đầu tệp.
2. Giá trị do thuộc tính `charset` của tiêu đề HTTP `Content-Type:` cung cấp hoặc tương đương trong giao thức được dùng để phục vụ stylesheet.
3. Khai báo CSS `@charset`.
4. Sử dụng bộ mã ký tự được định nghĩa bởi tài liệu tham chiếu: thuộc tính `charset` của phần tử {{ HTMLElement("link") }}. Phương thức này đã lỗi thời và không nên sử dụng.
5. Giả định tài liệu là UTF-8.

## Cú pháp

```css
@charset "UTF-8";
@charset "iso-8859-15";
```

### Tham số

- _charset_
  - : Một {{cssxref("&lt;string&gt;")}} biểu thị bộ mã ký tự sẽ dùng. Nó phải là tên của bộ mã ký tự web-safe được định nghĩa trong [IANA-registry](https://www.iana.org/assignments/character-sets/character-sets.xhtml), phải được đặt trong dấu nháy kép, theo sau đúng một ký tự khoảng trắng (U+0020), và kết thúc ngay lập tức bằng dấu chấm phẩy. Nếu có nhiều tên liên quan đến một bộ mã, chỉ tên được đánh dấu là _preferred_ mới được sử dụng.

## Cú pháp hình thức

Lưu ý rằng quy tắc `@charset` không được phân tích qua cú pháp mà qua một chuỗi byte cụ thể có dạng sau:

```plain
@charset "<charset>";
```

## Ví dụ

### Khai báo charset hợp lệ và không hợp lệ

```css-nolint example-good
@charset "UTF-8"; /* Đặt bộ mã ký tự của stylesheet thành Unicode UTF-8 */
```

```css-nolint example-bad
@charset 'iso-8859-15'; /* Không hợp lệ, sử dụng dấu nháy sai */
@charset  "UTF-8"; /* Không hợp lệ, nhiều hơn một khoảng trắng */
 @charset "UTF-8"; /* Không hợp lệ, có ký tự (một khoảng trắng) trước khai báo */
@charset UTF-8; /* Không hợp lệ, charset là CSS <string> và yêu cầu dấu nháy kép */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Mục từ điển [Bộ ký tự](/en-US/docs/Glossary/Character_set)
- Mục từ điển [Unicode](/en-US/docs/Glossary/Unicode)
