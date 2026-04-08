---
title: corner-start-start-shape
slug: Web/CSS/Reference/Properties/corner-start-start-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.corner-start-start-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`corner-start-start-shape`** chỉ định hình dạng của góc block-start và inline-start của một hộp, trong phạm vi vùng {{cssxref("border-radius")}} của nó.

Để có mô tả đầy đủ về hành vi hình dạng góc và nhiều ví dụ, xem trang thuộc tính viết tắt {{cssxref("corner-shape")}}.

## Cú pháp

```css
/* Keyword values */
corner-start-start-shape: notch;
corner-start-start-shape: squircle;

/* superellipse() function values */
corner-start-start-shape: superellipse(3);
corner-start-start-shape: superellipse(-1.5);

/* Global values */
corner-start-start-shape: inherit;
corner-start-start-shape: initial;
corner-start-start-shape: revert;
corner-start-start-shape: revert-layer;
corner-start-start-shape: unset;
```

### Giá trị

Thuộc tính `corner-start-start-shape` được chỉ định bằng giá trị {{cssxref("&lt;corner-shape-value>")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

### Cách dùng cơ bản của `corner-start-start-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng ta cho hộp một số kiểu dáng cơ bản, được ẩn để ngắn gọn. Chúng ta cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là `40% 10px 10px`, và `corner-start-start-shape` là `scoop`.

```css hidden live-sample___basic-usage
body {
  font-family: "Helvetica", "Arial", sans-serif;
  width: 240px;
  margin: 20px auto;
}

div {
  width: 100%;
  height: 180px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: goldenrod;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
}
```

```css live-sample___basic-usage
div {
  box-shadow: 1px 1px 3px gray;
  border-radius: 40% 10px 10px;
  corner-start-start-shape: scoop;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("basic-usage", "100%", "240")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("corner-shape")}} shorthand property
- {{cssxref("corner-start-end-shape")}}, {{cssxref("corner-end-start-shape")}}, and {{cssxref("corner-end-end-shape")}}
- {{cssxref("corner-top-left-shape")}}, {{cssxref("corner-top-right-shape")}}, {{cssxref("corner-bottom-left-shape")}}, and {{cssxref("corner-bottom-right-shape")}}
- {{cssxref("border-radius")}} shorthand property
- {{cssxref("border-start-start-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
