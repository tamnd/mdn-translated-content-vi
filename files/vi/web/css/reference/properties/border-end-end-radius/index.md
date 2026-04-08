---
title: border-end-end-radius
slug: Web/CSS/Reference/Properties/border-end-end-radius
page-type: css-property
browser-compat: css.properties.border-end-end-radius
sidebar: cssref
---

Thuộc tính **`border-end-end-radius`** trong [CSS](/en-US/docs/Web/CSS) xác định bán kính đường viền logic trên một phần tử, ánh xạ tới bán kính đường viền vật lý phụ thuộc vào {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}} của phần tử. Điều này hữu ích khi xây dựng các kiểu hoạt động bất kể [hướng văn bản](/en-US/docs/Web/CSS/Reference/Properties/text-orientation) và [chế độ viết](/en-US/docs/Web/CSS/Guides/Writing_modes).

Thuộc tính này ảnh hưởng đến góc giữa cạnh block-end và cạnh inline-end của phần tử. Ví dụ, trong chế độ viết `horizontal-tb` với hướng `ltr`, nó tương ứng với thuộc tính {{CSSxRef("border-bottom-right-radius")}}.

{{InteractiveExample("CSS Demo: border-end-end-radius")}}

```css interactive-example-choice
border-end-end-radius: 80px 80px;
```

```css interactive-example-choice
border-end-end-radius: 250px 100px;
direction: rtl;
```

```css interactive-example-choice
border-end-end-radius: 50%;
writing-mode: vertical-lr;
```

```css interactive-example-choice
border-end-end-radius: 50%;
writing-mode: vertical-rl;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a bottom right rounded corner.
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  background-color: #5b6dcd;
  color: white;
  padding: 10px;
}
```

## Cú pháp

```css
/* Giá trị <length> */
/* Với một giá trị, góc sẽ là hình tròn */
border-end-end-radius: 10px;
border-end-end-radius: 1em;

/* Với hai giá trị, góc sẽ là hình elip */
border-end-end-radius: 1em 2em;

/* Giá trị toàn cục */
border-end-end-radius: inherit;
border-end-end-radius: initial;
border-end-end-radius: revert;
border-end-end-radius: revert-layer;
border-end-end-radius: unset;
```

### Giá trị

- `<length-percentage>`
  - : Biểu thị kích thước bán kính hình tròn hoặc các trục bán chính và bán phụ của hình elip. Là độ dài tuyệt đối, có thể biểu thị bằng bất kỳ đơn vị nào được cho phép bởi kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}. Phần trăm cho trục ngang tham chiếu đến chiều rộng của hộp, phần trăm cho trục dọc tham chiếu đến chiều cao của hộp. Giá trị âm không hợp lệ.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Bán kính đường viền với văn bản dọc

#### HTML

```html
<div>
  <p class="exampleText">Example</p>
</div>
```

#### CSS

```css
div {
  background-color: rebeccapurple;
  width: 120px;
  height: 120px;
  border-end-end-radius: 10px;
}

.exampleText {
  writing-mode: vertical-rl;
  padding: 10px;
  background-color: white;
  border-end-end-radius: 10px;
}
```

#### Kết quả

{{EmbedLiveSample("Border_radius_with_vertical_text", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính vật lý tương ứng: {{CSSxRef("border-bottom-right-radius")}}
- {{CSSxRef("writing-mode")}}, {{CSSxRef("direction")}}, {{CSSxRef("text-orientation")}}
