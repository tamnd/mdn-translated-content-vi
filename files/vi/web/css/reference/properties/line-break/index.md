---
title: line-break
slug: Web/CSS/Reference/Properties/line-break
page-type: css-property
browser-compat: css.properties.line-break
sidebar: cssref
---

Thuộc tính **`line-break`** trong [CSS](/vi/docs/Web/CSS) thiết lập cách ngắt dòng văn bản tiếng Trung, Nhật hoặc Hàn (CJK) khi làm việc với dấu câu và ký hiệu.

{{InteractiveExample("CSS Demo: line-break")}}

```css interactive-example-choice
line-break: auto;
```

```css interactive-example-choice
line-break: anywhere;
```

```css interactive-example-choice
line-break: normal;
```

```css interactive-example-choice
line-break: loose;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    この喫茶店は、いつでもコーヒーの香りを漂わせています。<br />彼女はこの喫茶店で働いて、着々と実力をつけていきました。<br />今では知る人ぞ知る、名人です。
  </p>
</section>
```

```css interactive-example
#example-element {
  font-family: "Yu Gothic", "YuGothic", "Meiryo", "ＭＳ ゴシック", sans-serif;
  border: 2px dashed #999999;
  text-align: left;
  width: 240px;
  font-size: 16px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
line-break: auto;
line-break: loose;
line-break: normal;
line-break: strict;
line-break: anywhere;

/* Giá trị toàn cục */
line-break: inherit;
line-break: initial;
line-break: revert;
line-break: revert-layer;
line-break: unset;
```

### Giá trị

- `auto`
  - : Ngắt văn bản theo quy tắc ngắt dòng mặc định.
- `loose`
  - : Ngắt văn bản theo quy tắc ngắt dòng ít hạn chế nhất. Thường được dùng cho các dòng ngắn, chẳng hạn trong báo.
- `normal`
  - : Ngắt văn bản theo quy tắc ngắt dòng phổ biến nhất.
- `strict`
  - : Ngắt văn bản theo quy tắc ngắt dòng nghiêm ngặt nhất.
- `anywhere`
  - : Có cơ hội xuống dòng mềm xung quanh mọi đơn vị ký tự chữ, bao gồm xung quanh bất kỳ ký tự dấu câu hay khoảng trắng được giữ lại, hoặc ở giữa các từ, bất kể lệnh cấm ngắt dòng nào, kể cả những lệnh được giới thiệu bởi các ký tự thuộc lớp GL, WJ hoặc ZWJ hoặc được yêu cầu bởi thuộc tính {{cssxref("word-break")}}. Các cơ hội xuống dòng khác nhau không được ưu tiên. Dấu gạch nối không được áp dụng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập xuống dòng văn bản

Xem liệu văn bản có xuống dòng trước "々", "ぁ" và "。" hay không.

#### HTML

```html
<div lang="ja">
  <p class="wrap-box auto">
    auto:<br />そこは湖のほとりで木々が輝いていた。<br />その景色に、美しいなぁと思わずつぶやいた。
  </p>
  <p class="wrap-box loose">
    loose:<br />そこは湖のほとりで木々が輝いていた。<br />その景色に、美しいなぁと思わずつぶやいた。
  </p>
  <p class="wrap-box normal">
    normal:<br />そこは湖のほとりで木々が輝いていた。<br />その景色に、美しいなぁと思わずつぶやいた。
  </p>
  <p class="wrap-box strict">
    strict:<br />そこは湖のほとりで木々が輝いていた。<br />その景色に、美しいなぁと思わずつぶやいた。
  </p>
  <p class="wrap-box anywhere">
    anywhere:<br />そこは湖のほとりで木々が輝いていた。<br />その景色に、美しいなぁと思わずつぶやいた。
  </p>
</div>
```

#### CSS

```css
.wrap-box {
  width: 10em;
  margin: 0.5em;
  white-space: normal;
  vertical-align: top;
  display: inline-block;
}
.auto {
  line-break: auto;
}
.loose {
  line-break: loose;
}
.normal {
  line-break: normal;
}
.strict {
  line-break: strict;
}
.anywhere {
  line-break: anywhere;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_text_wrapping', 200, 400) }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS and international text](https://www.w3.org/International/articles/css3-text/) trên W3C
