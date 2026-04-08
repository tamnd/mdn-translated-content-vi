---
title: outline-width
slug: Web/CSS/Reference/Properties/outline-width
page-type: css-property
browser-compat: css.properties.outline-width
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`outline-width`** đặt độ dày của đường viền ngoài (outline) của một phần tử. Đường viền ngoài là một đường được vẽ xung quanh phần tử, nằm ngoài {{cssxref("border")}}.

{{InteractiveExample("CSS Demo: outline-width")}}

```css interactive-example-choice
outline-width: 12px;
```

```css interactive-example-choice
outline-width: thin;
```

```css interactive-example-choice
outline-width: medium;
```

```css interactive-example-choice
outline-width: thick;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with an outline around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  outline: 0.75em solid;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}
```

Thông thường sẽ tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("outline")}} khi định nghĩa giao diện của đường viền ngoài.

## Cú pháp

```css
/* Giá trị từ khóa */
outline-width: thin;
outline-width: medium;
outline-width: thick;

/* Giá trị <length> */
outline-width: 1px;
outline-width: 0.1em;

/* Giá trị toàn cục */
outline-width: inherit;
outline-width: initial;
outline-width: revert;
outline-width: revert-layer;
outline-width: unset;
```

Thuộc tính `outline-width` được chỉ định bằng một trong các giá trị liệt kê dưới đây.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Độ rộng của đường viền ngoài được chỉ định dưới dạng `<length>`.
- `thin`
  - : Phụ thuộc vào trình duyệt. Thông thường tương đương với `1px` trong trình duyệt máy tính để bàn (bao gồm Firefox).
- `medium`
  - : Phụ thuộc vào trình duyệt. Thông thường tương đương với `3px` trong trình duyệt máy tính để bàn (bao gồm Firefox).
- `thick`
  - : Phụ thuộc vào trình duyệt. Thông thường tương đương với `5px` trong trình duyệt máy tính để bàn (bao gồm Firefox).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt độ rộng đường viền ngoài của phần tử

#### HTML

```html
<span id="thin">thin</span>
<span id="medium">medium</span>
<span id="thick">thick</span>
<span id="twopixels">2px</span>
<span id="oneex">1ex</span>
<span id="em">1.2em</span>
```

#### CSS

```css
span {
  outline-style: solid;
  display: inline-block;
  margin: 20px;
}

#thin {
  outline-width: thin;
}

#medium {
  outline-width: medium;
}

#thick {
  outline-width: thick;
}

#twopixels {
  outline-width: 2px;
}

#oneex {
  outline-width: 1ex;
}

#em {
  outline-width: 1.2em;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_an_elements_outline_width', '100%', '80')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("outline")}}
- {{cssxref("outline-style")}}
- {{cssxref("outline-color")}}
