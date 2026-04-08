---
title: padding-inline-start
slug: Web/CSS/Reference/Properties/padding-inline-start
page-type: css-property
browser-compat: css.properties.padding-inline-start
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`padding-inline-start`** xác định padding logic đầu theo hướng inline của một phần tử, ánh xạ sang padding vật lý tùy thuộc vào chế độ viết, hướng và định hướng chữ của phần tử.

{{InteractiveExample("CSS Demo: padding-inline-start")}}

```css interactive-example-choice
padding-inline-start: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
padding-inline-start: 20px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
padding-inline-start: 5em;
writing-mode: horizontal-tb;
direction: rtl;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    <div class="box">
      Far out in the uncharted backwaters of the unfashionable end of the
      western spiral arm of the Galaxy lies a small unregarded yellow sun.
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 10px solid #ffc129;
  overflow: hidden;
  text-align: left;
}

.box {
  border: dashed 1px;
  unicode-bidi: bidi-override;
}
```

## Cú pháp

```css
/* Giá trị <length> */
padding-inline-start: 10px; /* Độ dài tuyệt đối */
padding-inline-start: 1em; /* Độ dài tương đối so với kích thước chữ */

/* Giá trị <percentage> */
padding-inline-start: 5%; /* Padding tương đối so với chiều rộng của khối chứa */

/* Giá trị toàn cục */
padding-inline-start: inherit;
padding-inline-start: initial;
padding-inline-start: revert;
padding-inline-start: revert-layer;
padding-inline-start: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của padding dưới dạng giá trị cố định. Phải không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của padding dưới dạng phần trăm, tương đối so với kích thước inline (_width_ trong ngôn ngữ nằm ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block). Phải không âm.

## Mô tả

Thuộc tính `padding-inline-start` nhận cùng các giá trị như các thuộc tính vật lý chẳng hạn như {{cssxref("padding-top")}}. Tuy nhiên, nó có thể tương đương với {{cssxref("padding-left")}}, {{cssxref("padding-right")}}, `padding-top` hoặc {{cssxref("padding-bottom")}} tùy thuộc vào các giá trị được đặt cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Nó liên quan đến {{cssxref("padding-block-start")}}, {{cssxref("padding-block-end")}} và {{cssxref("padding-inline-end")}}, là các thuộc tính xác định các giá trị padding còn lại của phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập padding đầu inline cho văn bản dọc

#### HTML

```html
<div>
  <p class="exampleText">Example text</p>
</div>
```

#### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: 120px;
}

.exampleText {
  writing-mode: vertical-lr;
  padding-inline-start: 20px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_start_padding_for_vertical_text", 140, 140)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Các thuộc tính vật lý tương ứng: {{cssxref("padding-top")}}, {{cssxref("padding-right")}}, {{cssxref("padding-bottom")}} và {{cssxref("padding-left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
