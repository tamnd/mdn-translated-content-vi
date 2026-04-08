---
title: "@document"
slug: Web/CSS/Reference/At-rules/@document
page-type: css-at-rule
status:
  - deprecated
  - non-standard
browser-compat: css.at-rules.document
sidebar: cssref
---

{{Deprecated_header}}{{Non-standard_header}}

At-rule [CSS](/en-US/docs/Web/CSS) **`@document`** giới hạn các quy tắc style chứa trong nó dựa trên URL của tài liệu. Nó được thiết kế chủ yếu cho stylesheet do người dùng định nghĩa (xem [userchrome.org](https://www.userchrome.org/) để biết thêm thông tin), mặc dù nó cũng có thể được sử dụng trên stylesheet do tác giả định nghĩa.

## Cú pháp

```css
@document url("https://www.example.com/")
{
  h1 {
    color: green;
  }
}
```

Một quy tắc `@document` có thể chỉ định một hoặc nhiều hàm khớp. Nếu bất kỳ hàm nào áp dụng cho một URL nhất định, quy tắc sẽ có hiệu lực trên URL đó. Các hàm khả dụng là:

- `url()`
  - : Khớp với một URL chính xác.
- `url-prefix()`
  - : Khớp nếu URL của tài liệu bắt đầu bằng giá trị được cung cấp.
- `domain()`
  - : Khớp nếu URL của tài liệu nằm trên domain được cung cấp (hoặc một subdomain của nó).
- `media-document()`
  - : Khớp với media theo chuỗi trong tham số, một trong `video`, `image`, `plugin` hoặc `all`.
- `regexp()`
  - : Khớp nếu URL của tài liệu khớp với [biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) được cung cấp. Biểu thức phải khớp toàn bộ URL.

Các giá trị được cung cấp cho các hàm `url()`, `url-prefix()`, `domain()`, và `media-document()` có thể tùy chọn được bao quanh bởi dấu nháy đơn hoặc kép. Các giá trị được cung cấp cho hàm `regexp()` _phải_ được bao quanh trong dấu nháy.

Các giá trị thoát được cung cấp cho hàm `regexp()` cũng phải được thoát khỏi CSS. Ví dụ: `.` (dấu chấm) khớp với bất kỳ ký tự nào trong biểu thức chính quy. Để khớp với một dấu chấm theo nghĩa đen, trước tiên bạn cần thoát nó bằng quy tắc biểu thức chính quy (thành `\.`), sau đó thoát chuỗi đó bằng quy tắc CSS (thành `\\.`).

`@document` hiện chỉ được hỗ trợ trong Firefox; nếu bạn muốn sao chép chức năng như vậy trong trình duyệt không phải Firefox của riêng mình, bạn có thể thử sử dụng [polyfill này](https://github.com/An-Error94/Handy-Scripts/tree/master/%40document-polyfill) của @An-Error94, sử dụng kết hợp user script, [thuộc tính data-\*](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*), và [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors).

> [!NOTE]
> Có một phiên bản có tiền tố -moz của thuộc tính này — `@-moz-document`. Phiên bản này đã bị giới hạn chỉ sử dụng trong user sheet và UA sheet trong Firefox 59 trên Nightly và Beta — một thử nghiệm được thiết kế để giảm thiểu các cuộc tấn công CSS injection tiềm năng (Xem [Firefox bug 1035091](https://bugzil.la/1035091)).

## Cú pháp hình thức

```plain
@document [ <url>                    |
            url-prefix(<string>)     |
            domain(<string>)         |
            media-document(<string>) |
            regexp(<string>)
          ]# {
  <group-rule-body>
}
```

## Ví dụ

### Chỉ định tài liệu cho quy tắc CSS

```css
@document url("http://www.w3.org/"),
          url-prefix("http://www.w3.org/Style/"),
          domain("mozilla.org"),
          media-document("video"),
          regexp("https:.*") {
  /* Các quy tắc CSS ở đây áp dụng cho:
     - Trang "http://www.w3.org/"
     - Bất kỳ trang nào có URL bắt đầu bằng "http://www.w3.org/Style/"
     - Bất kỳ trang nào có host URL là "mozilla.org"
       hoặc kết thúc bằng ".mozilla.org"
     - Bất kỳ video độc lập nào
     - Bất kỳ trang nào có URL bắt đầu bằng "https:" */

  /* Làm cho các trang đề cập ở trên thực sự xấu */
  body {
    color: purple;
    background: yellow;
  }
}
```

## Thông số kỹ thuật

[Ban đầu](https://www.w3.org/TR/2012/WD-css3-conditional-20120911/#at-document) trong Level 3, `@document` đã bị [hoãn lại](https://www.w3.org/TR/2012/WD-css3-conditional-20121213/#changes) đến Level 4, nhưng sau đó đã bị loại bỏ.

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Quy tắc stylesheet người dùng theo từng trang web](https://lists.w3.org/Archives/Public/www-style/2004Aug/0135) trên danh sách thư www-style.
