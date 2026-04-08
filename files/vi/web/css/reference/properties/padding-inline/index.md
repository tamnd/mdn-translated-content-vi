---
title: padding-inline
slug: Web/CSS/Reference/Properties/padding-inline
page-type: css-shorthand-property
browser-compat: css.properties.padding-inline
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`padding-inline`** là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) xác định padding logic đầu và cuối theo hướng inline của một phần tử, ánh xạ sang các thuộc tính padding vật lý tùy thuộc vào chế độ viết, hướng và định hướng chữ của phần tử.

{{InteractiveExample("CSS Demo: padding-inline")}}

```css interactive-example-choice
padding-inline: 5% 10%;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
padding-inline: 15px 40px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
padding-inline: 5% 20%;
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

## Các thuộc tính thành phần

Thuộc tính này là cách viết tắt cho các thuộc tính CSS sau:

- {{cssxref("padding-inline-end")}}
- {{cssxref("padding-inline-start")}}

## Cú pháp

```css
/* Giá trị <length> */
padding-inline: 10px 20px; /* Độ dài tuyệt đối */
padding-inline: 1em 2em; /* tương đối so với kích thước chữ */
padding-inline: 10px; /* thiết lập cả giá trị đầu và cuối */

/* Giá trị <percentage> */
padding-inline: 5% 2%; /* tương đối so với chiều rộng của khối chứa gần nhất */

/* Giá trị toàn cục */
padding-inline: inherit;
padding-inline: initial;
padding-inline: revert;
padding-inline: revert-layer;
padding-inline: unset;
```

Thuộc tính `padding-inline` có thể được chỉ định bằng một hoặc hai giá trị. Nếu chỉ định một giá trị, giá trị đó được dùng cho cả {{cssxref("padding-inline-start")}} và {{cssxref("padding-inline-end")}}. Nếu chỉ định hai giá trị, giá trị đầu tiên dùng cho {{cssxref("padding-inline-start")}} và giá trị thứ hai dùng cho {{cssxref("padding-inline-end")}}.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của padding dưới dạng giá trị cố định. Phải không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của padding dưới dạng phần trăm, tương đối so với kích thước inline (_width_ trong ngôn ngữ nằm ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block). Phải không âm.

## Mô tả

Các giá trị padding được chỉ định bởi `padding-inline` có thể tương đương với các thuộc tính {{cssxref("padding-top")}} và {{cssxref("padding-bottom")}} hoặc {{cssxref("padding-right")}} và {{cssxref("padding-left")}}, tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập padding inline cho văn bản dọc

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
  writing-mode: vertical-rl;
  padding-inline: 20px 40px;
  background-color: #c8c800;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_padding_for_vertical_text", 140, 140)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Các thuộc tính vật lý tương ứng: {{cssxref("padding-top")}}, {{cssxref("padding-right")}}, {{cssxref("padding-bottom")}} và {{cssxref("padding-left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
