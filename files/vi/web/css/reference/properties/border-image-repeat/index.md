---
title: border-image-repeat
slug: Web/CSS/Reference/Properties/border-image-repeat
page-type: css-property
browser-compat: css.properties.border-image-repeat
sidebar: cssref
---

Thuộc tính **`border-image-repeat`** trong [CSS](/en-US/docs/Web/CSS) xác định cách các hình ảnh cho các cạnh và phần giữa của [hình ảnh đường viền](/en-US/docs/Web/CSS/Reference/Properties/border-image) được chia tỷ lệ và lát gạch. Vùng giữa có thể được hiển thị bằng cách dùng từ khóa "fill" trong thuộc tính {{cssxref("border-image-slice")}}.

{{InteractiveExample("CSS Demo: border-image-repeat")}}

```css interactive-example-choice
border-image-repeat: stretch;
```

```css interactive-example-choice
border-image-repeat: repeat;
```

```css interactive-example-choice
border-image-repeat: round;
```

```css interactive-example-choice
border-image-repeat: space;
```

```css interactive-example-choice
border-image-repeat: round stretch;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">This is a box with a border around it.</div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 50px;
  background: #fff3d4;
  color: black;
  border: 30px solid;
  border-image: url("/shared-assets/images/examples/border-diamonds.png") 30
    round;
  font-size: 1.2em;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
border-image-repeat: stretch;
border-image-repeat: repeat;
border-image-repeat: round;
border-image-repeat: space;

/* trên và dưới | trái và phải */
border-image-repeat: round stretch;

/* Giá trị toàn cục */
border-image-repeat: inherit;
border-image-repeat: initial;
border-image-repeat: revert;
border-image-repeat: revert-layer;
border-image-repeat: unset;
```

Thuộc tính `border-image-repeat` có thể được chỉ định bằng một hoặc hai giá trị từ danh sách bên dưới.

- Khi chỉ định **một** giá trị, nó áp dụng cùng hành vi cho **cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, giá trị đầu tiên áp dụng cho **trên, giữa và dưới**, giá trị thứ hai cho **trái và phải**.

### Giá trị

- `stretch`
  - : Các vùng cạnh của hình ảnh nguồn được kéo giãn để lấp đầy khoảng trống giữa mỗi đường viền.
- `repeat`
  - : Các vùng cạnh của hình ảnh nguồn được lát gạch (lặp lại) để lấp đầy khoảng trống giữa mỗi đường viền. Các ô có thể bị cắt xén để đạt được sự vừa vặn phù hợp.
- `round`
  - : Các vùng cạnh của hình ảnh nguồn được lát gạch (lặp lại) để lấp đầy khoảng trống giữa mỗi đường viền. Các ô có thể được kéo giãn để đạt được sự vừa vặn phù hợp.
- `space`
  - : Các vùng cạnh của hình ảnh nguồn được lát gạch (lặp lại) để lấp đầy khoảng trống giữa mỗi đường viền. Khoảng trống thêm sẽ được phân bổ giữa các ô để đạt được sự vừa vặn phù hợp.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Lặp lại hình ảnh đường viền

#### CSS

```css
#bordered {
  width: 12rem;
  margin-bottom: 1rem;
  padding: 1rem;
  border: 40px solid;
  border-image: url("border.png") 27;
  border-image-repeat: stretch; /* Can be changed in the live sample */
}
```

```html hidden
<div id="bordered">You can try out various border repetition rules on me!</div>

<select id="repetition">
  <option value="stretch">stretch</option>
  <option value="repeat">repeat</option>
  <option value="round">round</option>
  <option value="space">space</option>
  <option value="stretch repeat">stretch repeat</option>
  <option value="space round">space round</option>
</select>
```

```js hidden
const repetition = document.getElementById("repetition");
repetition.addEventListener("change", (evt) => {
  document.getElementById("bordered").style.borderImageRepeat =
    evt.target.value;
});
```

#### Kết quả

{{EmbedLiveSample("Repeating_border_images", "auto", 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nền và đường viền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Học CSS: Nền và đường viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
- [Hình ảnh đường viền trong CSS: Trọng tâm chính cho Interop 2023](/en-US/blog/border-images-interop-2023/) trên MDN blog (2023)
