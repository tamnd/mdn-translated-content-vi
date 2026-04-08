---
title: "@font-face"
slug: Web/CSS/Reference/At-rules/@font-face
page-type: css-at-rule
browser-compat: css.at-rules.font-face
sidebar: cssref
---

At-rule [CSS](/en-US/docs/Web/CSS) **`@font-face`** chỉ định một font tùy chỉnh để hiển thị văn bản; font có thể được tải từ một máy chủ từ xa hoặc một font được cài đặt cục bộ trên máy tính của người dùng.

## Cú pháp

```css
@font-face {
  font-family: "Trickster";
  src:
    local("Trickster"),
    url("trickster-COLRv1.otf") format("opentype") tech(color-COLRv1),
    url("trickster-outline.otf") format("opentype"),
    url("trickster-outline.woff2") format("woff2");
}
```

### Các descriptor

- {{cssxref("@font-face/ascent-override", "ascent-override")}}
  - : Định nghĩa chỉ số ascent cho font.
- {{cssxref("@font-face/descent-override", "descent-override")}}
  - : Định nghĩa chỉ số descent cho font.
- {{cssxref("@font-face/font-display", "font-display")}}
  - : Xác định cách một font face được hiển thị dựa trên việc nó có được tải xuống hay chưa và khi nào nó sẵn sàng sử dụng.
- {{cssxref("@font-face/font-family", "font-family")}}
  - : Chỉ định một tên sẽ được sử dụng làm giá trị font face cho các thuộc tính font. Tên `font-family` là bắt buộc để quy tắc `@font-face` hợp lệ.
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
  - : Một giá trị {{cssxref("font-stretch")}}. Chấp nhận hai giá trị để chỉ định một phạm vi được hỗ trợ bởi một font face, ví dụ `font-stretch: 50% 200%;`
- {{cssxref("@font-face/font-style", "font-style")}}
  - : Một giá trị {{cssxref("font-style")}}. Chấp nhận hai giá trị để chỉ định một phạm vi được hỗ trợ bởi một font face, ví dụ `font-style: oblique 20deg 50deg;`
- {{cssxref("@font-face/font-weight", "font-weight")}}
  - : Một giá trị {{cssxref("font-weight")}}. Chấp nhận hai giá trị để chỉ định một phạm vi được hỗ trợ bởi một font face, ví dụ `font-weight: 100 400;`
- {{cssxref("@font-face/font-feature-settings", "font-feature-settings")}}
  - : Cho phép kiểm soát các tính năng typographic nâng cao trong font OpenType.
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
  - : Cho phép kiểm soát cấp thấp các biến thể font OpenType hoặc TrueType, bằng cách chỉ định tên trục bốn chữ cái của các tính năng cần thay đổi, cùng với các giá trị biến thể của chúng.
- {{cssxref("@font-face/line-gap-override", "line-gap-override")}}
  - : Định nghĩa chỉ số line gap cho font.
- {{cssxref("@font-face/size-adjust", "size-adjust")}}
  - : Định nghĩa một hệ số nhân cho các đường viền glyph và các chỉ số liên quan đến font này. Điều này giúp dễ dàng hài hòa thiết kế của các font khác nhau khi được hiển thị ở cùng kích thước font.
- {{cssxref("@font-face/src", "src")}}
  - : Chỉ định các tham chiếu đến tài nguyên font bao gồm các gợi ý về định dạng và công nghệ font. Một `src` là bắt buộc để quy tắc `@font-face` hợp lệ.
- {{cssxref("@font-face/unicode-range", "unicode-range")}}
  - : Phạm vi các điểm code Unicode sẽ được sử dụng từ font.

## Mô tả

Thông thường, `url()` và `local()` được sử dụng cùng nhau, sao cho bản sao font được cài đặt của người dùng được sử dụng nếu có sẵn, và rơi vào tải xuống bản sao của font nếu không tìm thấy trên thiết bị của người dùng.

Nếu hàm `local()` được cung cấp, chỉ định tên font để tìm kiếm trên thiết bị của người dùng, và nếu {{Glossary("user agent")}} tìm thấy một kết quả khớp, font cục bộ đó được sử dụng. Ngược lại, tài nguyên font được chỉ định bằng hàm `url()` sẽ được tải xuống và sử dụng.

Trình duyệt cố gắng tải các tài nguyên theo thứ tự khai báo danh sách của chúng, vì vậy thường `local()` nên được viết trước `url()`. Cả hai hàm đều là tùy chọn, vì vậy một khối quy tắc chỉ chứa một hoặc nhiều `local()` mà không có `url()` là có thể. Nếu muốn có các font cụ thể hơn với các giá trị `format()` hoặc `tech()`, những font này nên được liệt kê _trước_ các phiên bản không có các giá trị này, vì biến thể kém cụ thể hơn sẽ được thử và sử dụng trước.

Để phân phối web, thường tốt nhất là phục vụ font ở định dạng WOFF2, vì nó nén font hiệu quả hơn các định dạng cũ hơn như WOFF hoặc OpenType, giảm kích thước tệp và cải thiện thời gian tải. WOFF2 cũng được hỗ trợ tốt trong các trình duyệt hiện đại, khiến nó là lựa chọn mặc định an toàn cho hầu hết các trang web.

Bằng cách cho phép các tác giả cung cấp font của riêng họ, `@font-face` làm cho việc thiết kế nội dung mà không bị giới hạn bởi các font gọi là "web-safe" (tức là các font phổ biến đến mức được coi là có sẵn phổ biến) trở nên khả thi. Khả năng chỉ định tên của một font được cài đặt cục bộ để tìm kiếm và sử dụng giúp tùy chỉnh font vượt ra ngoài những điều cơ bản trong khi làm cho điều đó có thể thực hiện mà không cần kết nối internet.

> [!NOTE]
> Các chiến lược dự phòng để tải font trên các trình duyệt cũ hơn được mô tả trong [trang descriptor `src`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/src#specifying_fallbacks_for_older_browsers).

At-rule `@font-face` có thể được sử dụng không chỉ ở cấp độ cao nhất của CSS, mà còn bên trong bất kỳ [at-rule nhóm điều kiện CSS](/en-US/docs/Web/CSS/Guides/Conditional_rules#at-rules_and_descriptors) nào.

### Kiểu MIME của Font

| Định dạng              | Kiểu MIME    |
| ---------------------- | ------------ |
| TrueType               | `font/ttf`   |
| OpenType               | `font/otf`   |
| Web Open Font Format   | `font/woff`  |
| Web Open Font Format 2 | `font/woff2` |

### Ghi chú

- Web font chịu cùng hạn chế domain (các tệp font phải ở trên cùng domain với trang sử dụng chúng), trừ khi [kiểm soát truy cập HTTP](/en-US/docs/Web/HTTP/Guides/CORS) được sử dụng để nới lỏng hạn chế này.
- `@font-face` không thể được khai báo bên trong một bộ chọn CSS. Ví dụ, điều sau đây sẽ không hoạt động:

  ```css example-bad
  .className {
    @font-face {
      font-family: "MyHelvetica";
      src:
        local("Helvetica Neue Bold"), local("HelveticaNeue-Bold"),
        url("MgOpenModernaBold.woff2");
      font-weight: bold;
    }
  }
  ```

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định một font có thể tải xuống

Ví dụ này chỉ định một font có thể tải xuống để sử dụng, áp dụng nó cho toàn bộ body của tài liệu:

```html live-sample___web-font-example
<body>
  This is Bitstream Vera Serif Bold.
</body>
```

```css live-sample___web-font-example
@font-face {
  font-family: "Bitstream Vera Serif Bold";
  src: url("https://mdn.github.io/shared-assets/fonts/FiraSans-Regular.woff2");
}

body {
  font-family: "Bitstream Vera Serif Bold", serif;
}
```

{{EmbedLiveSample("web-font-example", "", "100px")}}

### Chỉ định font cục bộ thay thế

Trong ví dụ này, bản sao cục bộ của người dùng về "Helvetica Neue Bold" được sử dụng; nếu người dùng không có font đó được cài đặt (cả tên font đầy đủ và tên Postscript đều được thử), thì font có thể tải xuống có tên "MgOpenModernaBold.woff2" được sử dụng thay thế:

```css
@font-face {
  font-family: "MyHelvetica";
  src:
    local("Helvetica Neue Bold"), local("HelveticaNeue-Bold"),
    url("MgOpenModernaBold.woff2");
  font-weight: bold;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Về WOFF](/en-US/docs/Web/CSS/Guides/Fonts/WOFF)
- [Trình tạo @font-face FontSquirrel](https://www.fontsquirrel.com/tools/webfont-generator)
- [Font đẹp với @font-face](https://hacks.mozilla.org/2009/06/beautiful-fonts-with-font-face/)
- [Thư viện Font](https://fontlibrary.org/)
