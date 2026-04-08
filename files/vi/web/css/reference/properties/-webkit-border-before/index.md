---
title: -webkit-border-before
slug: Web/CSS/Reference/Properties/-webkit-border-before
page-type: css-shorthand-property
status:
  - non-standard
browser-compat: css.properties.-webkit-border-before
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-webkit-border-before`** là thuộc tính viết tắt dùng để thiết lập các giá trị thuộc tính đường viền logic bắt đầu khối riêng lẻ tại một chỗ trong bảng style.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("-webkit-border-before-color")}}
- {{cssxref("-webkit-border-before-style")}}
- {{cssxref("-webkit-border-before-width")}}

## Cú pháp

```css
/* Giá trị đường viền */
-webkit-border-before: 1px;
-webkit-border-before: 2px dotted;
-webkit-border-before: medium dashed blue;

/* Giá trị toàn cục */
-webkit-border-before: inherit;
-webkit-border-before: initial;
-webkit-border-before: revert;
-webkit-border-before: revert-layer;
-webkit-border-before: unset;
```

### Giá trị

Một hoặc nhiều giá trị sau, theo thứ tự bất kỳ:

- `<'border-width'>`
  - : Xem {{cssxref("border-width")}}
- `<'border-style'>`
  - : Xem {{cssxref("border-style")}}
- `<'color'>`
  - : Xem {{cssxref("color")}}

## Mô tả

Thuộc tính `-webkit-border-before` ánh xạ tới một đường viền vật lý tùy thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với thuộc tính {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, hoặc {{cssxref("border-left")}} tùy theo các giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}}.

Nó liên quan đến {{cssxref("-webkit-border-after")}}, {{cssxref("-webkit-border-start")}}, và {{cssxref("-webkit-border-end")}}, vốn định nghĩa các đường viền còn lại của phần tử.

Thuộc tính tiêu chuẩn tương đương với thuộc tính này là {{cssxref("border-block-start")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-border-before = <'border-width'> || <'border-style'> || <color>`)}}

## Ví dụ

### Áp dụng đường viền với văn bản dọc

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
  -webkit-border-before: 5px dashed blue;
}
```

#### Kết quả

{{EmbedLiveSample("Applying_a_border_with_vertical_text", 140, 140)}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào, nhưng liên quan đến thuộc tính tiêu chuẩn {{cssxref("border-block-start")}}.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border-block-start")}}
- Các thuộc tính vật lý tương ứng: {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, và {{cssxref("border-left")}}
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
