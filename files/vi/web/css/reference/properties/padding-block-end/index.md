---
title: padding-block-end
slug: Web/CSS/Reference/Properties/padding-block-end
page-type: css-property
browser-compat: css.properties.padding-block-end
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`padding-block-end`** xác định padding logic cuối theo hướng block của một phần tử, ánh xạ sang padding vật lý tùy thuộc vào chế độ viết, hướng và định hướng chữ của phần tử.

{{InteractiveExample("CSS Demo: padding-block-end")}}

```css interactive-example-choice
padding-block-end: 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
padding-block-end: 20px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
padding-block-end: 5em;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
padding-block-end: 5em;
writing-mode: vertical-lr;
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
padding-block-end: 10px; /* Độ dài tuyệt đối */
padding-block-end: 1em; /* Độ dài tương đối so với kích thước chữ */

/* Giá trị <percentage> */
padding-block-end: 5%; /* Padding tương đối so với chiều rộng của khối chứa */

/* Giá trị toàn cục */
padding-block-end: inherit;
padding-block-end: initial;
padding-block-end: revert;
padding-block-end: revert-layer;
padding-block-end: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của padding dưới dạng giá trị cố định. Phải không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của padding dưới dạng phần trăm, tương đối so với kích thước inline (_width_ trong ngôn ngữ nằm ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block). Phải không âm.

## Mô tả

Thuộc tính `padding-block-end` nhận cùng các giá trị như các thuộc tính padding vật lý chẳng hạn như {{cssxref("padding-top")}}. Tuy nhiên, nó có thể tương đương với {{cssxref("padding-bottom")}}, `padding-top`, {{cssxref("padding-left")}} hoặc {{cssxref("padding-right")}} tùy thuộc vào các giá trị được đặt cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Nó liên quan đến {{cssxref("padding-block-start")}}, {{cssxref("padding-inline-start")}} và {{cssxref("padding-inline-end")}}, là các thuộc tính xác định các giá trị padding còn lại của phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập padding cuối block cho văn bản dọc

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
  padding-block-end: 20px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_block_end_padding_for_vertical_text", 140, 140)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Các thuộc tính vật lý tương ứng: {{cssxref("padding-top")}}, {{cssxref("padding-right")}}, {{cssxref("padding-bottom")}} và {{cssxref("padding-left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
