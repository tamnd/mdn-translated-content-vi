---
title: ruby-position
slug: Web/CSS/Reference/Properties/ruby-position
page-type: css-property
browser-compat: css.properties.ruby-position
sidebar: cssref
---

Thuộc tính **`ruby-position`** của [CSS](/vi/docs/Web/CSS) xác định vị trí của phần tử ruby so với phần tử cơ sở của nó. Phần tử ruby có thể được đặt phía trên (`over`), phía dưới (`under`), hoặc giữa các ký tự ở phía bên phải (`inter-character`).

{{InteractiveExample("CSS Demo: ruby-position")}}

```css interactive-example-choice
ruby-position: over;
```

```css interactive-example-choice
ruby-position: under;
```

```html interactive-example
<section id="default-example">
  <ruby id="example-element"> 明日 <rp>(</rp><rt>Ashita</rt><rp>)</rp> </ruby>
</section>
```

```css interactive-example
#example-element {
  font-size: 2em;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
ruby-position: over;
ruby-position: under;
ruby-position: alternate;
ruby-position: alternate over;
ruby-position: alternate under;
ruby-position: inter-character;

/* Giá trị toàn cục */
ruby-position: inherit;
ruby-position: initial;
ruby-position: revert;
ruby-position: revert-layer;
ruby-position: unset;
```

### Giá trị

- `over`
  - : ![Over example](screen_shot_2015-03-04_at_13.02.20.png)
    Từ khóa cho biết ruby phải được đặt phía trên văn bản chính với chữ viết ngang và ở bên phải với chữ viết dọc.
- `under`
  - : ![Under example](screen_shot_2015-03-04_at_13.02.07.png)
    Từ khóa cho biết ruby phải được đặt phía dưới văn bản chính với chữ viết ngang và ở bên trái với chữ viết dọc.
- `alternate`
  - : Từ khóa cho biết ruby luân phiên giữa trên và dưới khi có nhiều cấp chú thích.
- `inter-character`
  - : Khi được chỉ định, hoạt động như `over` trong chế độ viết dọc. Ngoài ra, chỉ định rằng ruby phải được đặt giữa các ký tự khác nhau, xuất hiện bên phải của cơ sở trong văn bản ngang và buộc các phần tử con của container chú thích ruby có chế độ viết `vertical-rl`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ruby được đặt phía trên văn bản

#### HTML

```html
<ruby>
  <rb>超電磁砲</rb>
  <rp>（</rp><rt>レールガン</rt><rp>）</rp>
</ruby>
```

#### CSS

```css
ruby {
  ruby-position: over;
}
```

#### Kết quả

{{EmbedLiveSample("Ruby_positioned_over_the_text", 100, 40)}}

### Ruby được đặt phía dưới văn bản

#### HTML

```html
<ruby>
  <rb>超電磁砲</rb>
  <rp>（</rp><rt>レールガン</rt><rp>）</rp>
</ruby>
```

#### CSS

```css
ruby {
  ruby-position: under;
}
```

#### Kết quả

{{EmbedLiveSample("Ruby_positioned_under_the_text", 100, 40)}}

### Ruby luân phiên

#### HTML

```html
<ruby>
  <rb>A</rb><rb>B</rb><rb>C</rb>
  <rtc>Above</rtc>
  <rtc>Below</rtc>
</ruby>
```

#### CSS

```css
ruby {
  ruby-position: alternate; /* this is also the initial value */
}
```

#### Kết quả

{{EmbedLiveSample("Ruby_alternate", 100, 40)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML {{HTMLElement("ruby")}}, {{HTMLElement("rt")}}, {{HTMLElement("rp")}}, và {{HTMLElement("rtc")}}
- {{cssxref("ruby-align")}}
- Module [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout)
