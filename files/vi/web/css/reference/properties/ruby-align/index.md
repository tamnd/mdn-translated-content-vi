---
title: ruby-align
slug: Web/CSS/Reference/Properties/ruby-align
page-type: css-property
browser-compat: css.properties.ruby-align
sidebar: cssref
---

Thuộc tính **`ruby-align`** của [CSS](/vi/docs/Web/CSS) xác định cách phân bố các phần tử ruby khác nhau trên văn bản cơ sở.

## Cú pháp

```css
/* Giá trị từ khóa */
ruby-align: start;
ruby-align: center;
ruby-align: space-between;
ruby-align: space-around;

/* Giá trị toàn cục */
ruby-align: inherit;
ruby-align: initial;
ruby-align: revert;
ruby-align: revert-layer;
ruby-align: unset;
```

### Giá trị

- `start`
  - : Từ khóa cho biết ruby sẽ được căn chỉnh theo điểm đầu của văn bản cơ sở.
- `center`
  - : Từ khóa cho biết ruby sẽ được căn chỉnh ở giữa văn bản cơ sở.
- `space-between`
  - : Từ khóa cho biết khoảng trống thừa sẽ được phân bố giữa các phần tử ruby.
- `space-around`
  - : Từ khóa cho biết khoảng trống thừa sẽ được phân bố giữa và xung quanh các phần tử ruby.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ruby căn chỉnh theo điểm đầu văn bản cơ sở

#### HTML

```html
<ruby>
  <rb>This is a long text to check</rb>
  <rp>（</rp><rt>short ruby</rt><rp>）</rp>
</ruby>
```

#### CSS

```css
ruby {
  ruby-align: start;
}
```

#### Kết quả

{{EmbedLiveSample("Ruby_aligned_at_the_start_of_the_base_text", 180, 40)}}

### Ruby căn chỉnh ở giữa văn bản cơ sở

#### HTML

```html
<ruby>
  <rb>This is a long text to check</rb>
  <rp>（</rp><rt>short ruby</rt><rp>）</rp>
</ruby>
```

#### CSS

```css
ruby {
  ruby-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("Ruby_aligned_at_the_center_of_the_base_text", 180, 40)}}

### Khoảng trống thừa phân bố giữa các phần tử ruby

#### HTML

```html
<ruby>
  <rb>This is a long text to check</rb>
  <rp>（</rp><rt>short ruby</rt><rp>）</rp>
</ruby>
```

#### CSS

```css
ruby {
  ruby-align: space-between;
}
```

#### Kết quả

{{EmbedLiveSample("Extra_space_distributed_between_ruby_elements", 180, 40)}}

### Khoảng trống thừa phân bố giữa và xung quanh các phần tử ruby

#### HTML

```html
<ruby>
  <rb>This is a long text to check</rb>
  <rp>（</rp><rt>short ruby</rt><rp>）</rp>
</ruby>
```

#### CSS

```css
ruby {
  ruby-align: space-around;
}
```

#### Kết quả

{{EmbedLiveSample("Extra_space_distributed_between_and_around_ruby_elements", 180, 40)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("ruby-position")}}
- Module [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout)
- Các phần tử HTML Ruby: {{HTMLElement("ruby")}}, {{HTMLElement("rt")}}, {{HTMLElement("rp")}}, và {{HTMLElement("rtc")}}
