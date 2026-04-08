---
title: url()
slug: Web/CSS/Reference/Values/url_function
page-type: css-function
browser-compat: css.types.url
sidebar: cssref
---

Hàm **`url()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) dùng để bao gồm một tệp. Tham số là một URL tuyệt đối, URL tương đối, blob URL, hoặc data URL. Hàm **`url()`** có thể được truyền làm tham số cho một hàm CSS khác, như hàm {{cssxref("attr")}}. Tùy thuộc vào thuộc tính mà nó là giá trị, tài nguyên được tìm kiếm có thể là hình ảnh, font chữ, hoặc stylesheet. Ký hiệu hàm `url()` là giá trị cho kiểu dữ liệu `<url>`.

> [!NOTE]
> Có sự khác biệt giữa {{Glossary("URI")}} và {{Glossary("URL")}}. URI xác định một tài nguyên. URL là một loại URI, và mô tả _vị trí_ của một tài nguyên. URI có thể là URL hoặc tên ({{Glossary("URN")}}) của một tài nguyên.
>
> Trong CSS Level 1, ký hiệu hàm `url()` chỉ mô tả các URL thực sự. Trong CSS Level 2, định nghĩa của `url()` được mở rộng để mô tả bất kỳ URI nào, dù là URL hay URN. Điều này có nghĩa là `url()` có thể được dùng để tạo kiểu dữ liệu CSS `<uri>`, gây ra sự nhầm lẫn. Sự thay đổi này không chỉ gượng gạo mà còn không cần thiết, vì URN hầu như không bao giờ được sử dụng trong CSS thực tế. Để giảm bớt sự nhầm lẫn, CSS Level 3 đã quay lại định nghĩa ban đầu hẹp hơn. Bây giờ, `url()` chỉ biểu thị các `<url>` thực sự.

Các URL tương đối, nếu được dùng, là tương đối so với URL của stylesheet (không phải URL của trang web).

Hàm **`url()`** có thể được bao gồm làm giá trị cho
{{cssxref('background')}}, {{cssxref('background-image')}}, {{cssxref('border')}}, {{cssxref('border-image')}}, {{cssxref('border-image-source')}}, {{cssxref('content')}}, {{cssxref('cursor')}}, {{cssxref('filter')}}, {{cssxref('list-style')}}, {{cssxref('list-style-image')}}, {{cssxref('mask')}}, {{cssxref('mask-image')}}, {{cssxref('offset-path')}}, {{cssxref('clip-path')}},
[src](/vi/docs/Web/CSS/Reference/At-rules/@font-face/src) như một phần của khối {{cssxref("@font-face")}}, và [@counter-style/`symbol`](/vi/docs/Web/CSS/Reference/At-rules/@counter-style/symbols)

## Cú pháp

```css
/* Cách dùng cơ bản */
url("https://example.com/images/myImg.jpg");
url('https://example.com/images/myImg.jpg');
url(https://example.com/images/myImg.jpg);
url("data:image/jpeg;base64,iRxVB0…");
url(myImg.jpg);
url(#IDofSVGpath);

/* associated properties */
background-image: url("star.gif");
list-style-image: url('../images/bullet.jpg');
content: url("my-icon.jpg");
cursor: url(my-cursor.cur);
border-image-source: url(/media/diamonds.png);
src: url('fantastic-font.woff');
offset-path: url(#path);
mask-image: url("masks.svg#mask1");

/* Properties with fallbacks */
cursor: url(pointer.cur), pointer;

/* Associated short-hand properties */
background: url('star.gif') bottom right repeat-x blue;
border-image: url("/media/diamonds.png") 30 fill / 30px / 30px space;

/* As a parameter in another CSS function */
background-image: cross-fade(20% url(first.png), url(second.png));
mask-image: image(url(mask.png), skyblue, linear-gradient(black, transparent));

/* as part of a non-shorthand multiple value */
content: url(star.svg) url(star.svg) url(star.svg) url(star.svg) url(star.svg);

/* at-rules */
@document url("https://www.example.com/") { /* … */ }
@import url("https://www.example.com/style.css");
@namespace url(http://www.w3.org/1999/xhtml);
```

### Giá trị

- `<string>`
  - : Một chuỗi chỉ định một URL, là địa chỉ tương đối hoặc tuyệt đối, hoặc con trỏ, đến tài nguyên web cần bao gồm, hoặc là data URL. Bạn cũng có thể sử dụng hash URL để tham chiếu đến ID của một [hình dạng SVG](/vi/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes) hoặc một [bộ lọc SVG](/vi/docs/Web/SVG/Reference/Element/filter).

    Dấu ngoặc kép thường là tùy chọn — chúng bắt buộc nếu URL chứa dấu ngoặc đơn, khoảng trắng, hoặc dấu ngoặc kép (trừ khi các ký tự này được thoát), hoặc nếu địa chỉ chứa các ký tự điều khiển trên 0x7e. Các quy tắc cú pháp chuỗi thông thường áp dụng: dấu ngoặc kép không thể xuất hiện bên trong dấu ngoặc kép và dấu ngoặc đơn không thể xuất hiện bên trong dấu ngoặc đơn trừ khi được thoát.

- `<url-modifier>`
  - : Trong tương lai, hàm `url()` có thể hỗ trợ chỉ định một bộ điều chỉnh, một định danh hoặc một ký hiệu hàm, làm thay đổi ý nghĩa của chuỗi URL. Tính năng này hiện chưa được hỗ trợ và chưa được định nghĩa đầy đủ trong đặc tả.

## Cú pháp chính thức

{{CSSSyntax("url")}}

## Ví dụ

### Là giá trị của thuộc tính background

```css
body {
  background: url("https://mdn.github.io/shared-assets/images/examples/leopard.jpg")
    #0000dd no-repeat fixed;
}
```

{{EmbedLiveSample("As the background property value", "100%", "200")}}

### Để đặt hình ảnh làm dấu đầu dòng danh sách

```html hidden
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
</ul>
```

```css hidden
ul {
  font-size: 3rem;
  margin: 0;
}
```

```css
ul {
  list-style: outside
    url("https://mdn.github.io/shared-assets/images/examples/firefox-logo.svg");
}
```

{{EmbedLiveSample("For setting an image as a list bullet", "100%", "200")}}

### Sử dụng trong thuộc tính content

#### HTML

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
</ul>
```

#### CSS

```css
li::after {
  content: " - "
    url("https://mdn.github.io/shared-assets/images/examples/star-white_16x16.png");
}
```

#### Kết quả

{{EmbedLiveSample("Usage_in_the_content_property", "100%", "110")}}

### Sử dụng data URL

#### CSS

```css
body {
  background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='90' height='45'%3E%3Cpath d='M10 10h60' stroke='%2300F' stroke-width='5'/%3E%3Cpath d='M10 20h60' stroke='%230F0' stroke-width='5'/%3E%3Cpath d='M10 30h60' stroke='red' stroke-width='5'/%3E%3C/svg%3E");
}
```

{{EmbedLiveSample("Using_a_data_URL", "100%", 100)}}

### Sử dụng trong bộ lọc

Khi URL được dùng làm đường dẫn cho bộ lọc, URL phải là một trong những dạng sau:

1. Đường dẫn đến tệp SVG với ID của bộ lọc được thêm vào.
2. ID của bộ lọc, nếu SVG đã tồn tại trên trang.

```css
.blur {
  filter: url("my-file.svg#svg-blur"); /* the URL of an SVG file used as a filter */
}

.inline-blur {
  filter: url("#svg-blur"); /* the ID of an SVG that is embedded in the HTML page */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("gradient")}}
- {{cssxref("element()")}}
- {{cssxref("image/image", "image()")}}
- {{cssxref("image/image-set", "image-set()")}}
- {{cssxref("cross-fade()")}}
