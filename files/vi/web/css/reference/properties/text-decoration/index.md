---
title: text-decoration
slug: Web/CSS/Reference/Properties/text-decoration
page-type: css-shorthand-property
browser-compat: css.properties.text-decoration
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`text-decoration`** đặt giao diện của các đường trang trí trên văn bản. Đây là thuộc tính viết tắt cho {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-decoration-style")}} và thuộc tính mới hơn {{cssxref("text-decoration-thickness")}}.

{{InteractiveExample("CSS Demo: text-decoration")}}

```css interactive-example-choice
text-decoration: underline;
```

```css interactive-example-choice
text-decoration: underline dotted;
```

```css interactive-example-choice
text-decoration: underline dotted red;
```

```css interactive-example-choice
text-decoration: green wavy underline;
```

```css interactive-example-choice
text-decoration: underline overline #ff3028;
```

```html interactive-example
<section id="default-example">
  <p>
    I'd far rather be
    <span class="transition-all" id="example-element">happy than right</span>
    any day.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}
```

Các trang trí văn bản được vẽ xuyên qua các phần tử văn bản con cháu. Điều này có nghĩa là nếu một phần tử chỉ định trang trí văn bản, thì phần tử con không thể xóa trang trí đó. Ví dụ, với đánh dấu `<p>This text has <em>some emphasized words</em> in it.</p>`, quy tắc kiểu `p { text-decoration: underline; }` sẽ làm cho toàn bộ đoạn văn có gạch chân. Quy tắc `em { text-decoration: none; }` sẽ không gây ra bất kỳ thay đổi nào; toàn bộ đoạn văn vẫn sẽ có gạch chân. Tuy nhiên, quy tắc `em { text-decoration: overline; }` sẽ làm xuất hiện một trang trí thứ hai trên "some emphasized words".

## Các thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("text-decoration-color")}}
- {{cssxref("text-decoration-line")}}
- {{cssxref("text-decoration-style")}}
- {{cssxref("text-decoration-thickness")}}

## Cú pháp

```css
text-decoration: underline;
text-decoration: overline red;
text-decoration: none;

/* Giá trị toàn cục */
text-decoration: inherit;
text-decoration: initial;
text-decoration: revert;
text-decoration: revert-layer;
text-decoration: unset;
```

Thuộc tính `text-decoration` được chỉ định bằng một hoặc nhiều giá trị phân tách bằng dấu cách, đại diện cho các thuộc tính longhand text-decoration khác nhau.

### Giá trị

- {{cssxref("text-decoration-line")}}
  - : Đặt loại trang trí được sử dụng, chẳng hạn như `underline` hoặc `line-through`.
- {{cssxref("text-decoration-color")}}
  - : Đặt màu của trang trí.
- {{cssxref("text-decoration-style")}}
  - : Đặt kiểu đường sử dụng cho trang trí, chẳng hạn như `solid`, `wavy` hoặc `dashed`.
- {{cssxref("text-decoration-thickness")}}
  - : Đặt độ dày của đường sử dụng cho trang trí.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Minh họa các giá trị text-decoration

```css
.under {
  text-decoration: underline red;
}

.over {
  text-decoration: wavy overline lime;
}

.line {
  text-decoration: line-through;
}

.plain {
  text-decoration: none;
}

.underover {
  text-decoration: dashed underline overline;
}

.thick {
  text-decoration: solid underline purple 4px;
}

.blink {
  text-decoration: blink;
}
```

```html
<p class="under">This text has a line underneath it.</p>
<p class="over">This text has a line over it.</p>
<p class="line">This text has a line going through it.</p>
<p>
  This <a class="plain" href="#">link will not be underlined</a>, as links
  generally are by default. Be careful when removing the text decoration on
  anchors since users often depend on the underline to denote hyperlinks.
</p>
<p class="underover">This text has lines above <em>and</em> below it.</p>
<p class="thick">
  This text has a really thick purple underline in supporting browsers.
</p>
<p class="blink">
  This text might blink for you, depending on the browser you use.
</p>
```

#### Kết quả

{{EmbedLiveSample('Examples','auto','520')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính text-decoration riêng lẻ: {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-decoration-style")}} và {{cssxref("text-decoration-thickness")}}.
- Các thuộc tính {{cssxref("text-decoration-skip-ink")}}, {{cssxref("text-underline-offset")}} và {{cssxref("text-underline-position")}} cũng ảnh hưởng đến text-decoration, nhưng không được bao gồm trong thuộc tính viết tắt.
- Thuộc tính {{cssxref("list-style")}} kiểm soát giao diện của các mục trong danh sách HTML {{HTMLElement("ol")}} và {{HTMLElement("ul")}}.
- Thuộc tính SVG {{SVGAttr("text-decoration")}}
