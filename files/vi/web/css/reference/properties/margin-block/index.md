---
title: margin-block
slug: Web/CSS/Reference/Properties/margin-block
page-type: css-shorthand-property
browser-compat: css.properties.margin-block
sidebar: cssref
---

Thuộc tính [rút gọn](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) CSS **`margin-block`** xác định lề đầu và cuối khối logic của một phần tử, ánh xạ đến các lề vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử.

{{InteractiveExample("CSS Demo: margin-block")}}

```css interactive-example-choice
margin-block: 10px 20px;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
margin-block: 20px 40px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
margin-block: 5% 20%;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
margin-block: 1rem auto;
writing-mode: vertical-lr;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="row">One</div>
    <div class="row transition-all" id="example-element">Two</div>
    <div class="row">Three</div>
  </div>
</section>
```

```css interactive-example
#container {
  width: 300px;
  height: 200px;
  display: flex;
  align-content: flex-start;
  flex-direction: column;
  justify-content: flex-start;
}

.row {
  height: 33.33%;
  display: inline-block;
  border: solid #ce7777 10px;
  background-color: #2b3a55;
  color: white;
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffbf00;
  background-color: #2b3a55;
}
```

## Các thuộc tính thành phần

Thuộc tính này là dạng rút gọn cho các thuộc tính CSS sau:

- {{cssxref("margin-block-start")}}
- {{cssxref("margin-block-end")}}

## Cú pháp

```css
/* Giá trị <length> */
margin-block: 10px 20px; /* Độ dài tuyệt đối */
margin-block: 1em 2em; /* tương đối với kích thước văn bản */
margin-block: 5% 2%; /* tương đối với chiều rộng của khối chứa gần nhất */
margin-block: 10px; /* đặt cả giá trị đầu và cuối */
margin-block: anchor-size(inline);
margin-block: calc(anchor-size(width) / 4) 1em;

/* Giá trị từ khóa */
margin-block: auto;

/* Giá trị toàn cục */
margin-block: inherit;
margin-block: initial;
margin-block: revert;
margin-block: revert-layer;
margin-block: unset;
```

Thuộc tính này tương ứng với {{CSSxRef("margin-top")}} và {{CSSxRef("margin-bottom")}}, hoặc {{CSSxRef("margin-right")}} và {{CSSxRef("margin-left")}}, tùy thuộc vào các giá trị được xác định cho {{CSSxRef("writing-mode")}}, {{CSSxRef("direction")}} và {{CSSxRef("text-orientation")}}.

Thuộc tính `margin-block` có thể được chỉ định bằng một hoặc hai giá trị.

- Khi chỉ định **một** giá trị, nó áp dụng cùng lề cho **cả đầu và cuối**.
- Khi chỉ định **hai** giá trị, lề đầu tiên áp dụng cho **đầu**, lề thứ hai cho **cuối**.

### Giá trị

Thuộc tính `margin-block` nhận các giá trị giống như thuộc tính {{CSSxRef("margin-top", "", "#values")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt lề đầu và cuối khối

#### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: auto;
  border: 1px solid green;
}

p {
  margin: 0;
  margin-block: 20px 40px;
  background-color: tan;
}

.verticalExample {
  writing-mode: vertical-rl;
}
```

#### HTML

```html
<div>
  <p>Example text</p>
</div>
<div class="verticalExample">
  <p>Example text</p>
</div>
```

#### Kết quả

{{EmbedLiveSample("Setting_block_start_and_end_margins", 140, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Các thuộc tính vật lý ánh xạ: {{CSSxRef("margin-top")}}, {{CSSxRef("margin-right")}}, {{CSSxRef("margin-bottom")}} và {{CSSxRef("margin-left")}}
- {{CSSxRef("writing-mode")}}, {{CSSxRef("direction")}}, {{CSSxRef("text-orientation")}}
