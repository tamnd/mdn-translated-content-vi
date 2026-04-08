---
title: corner-bottom-right-shape
slug: Web/CSS/Reference/Properties/corner-bottom-right-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.corner-bottom-right-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`corner-bottom-right-shape`** chỉ định hình dạng của góc dưới bên phải của một hộp, trong phạm vi vùng {{cssxref("border-radius")}} của nó.

Để có mô tả đầy đủ về hành vi hình dạng góc và nhiều ví dụ, xem trang thuộc tính viết tắt {{cssxref("corner-shape")}}.

## Cú pháp

```css
/* Keyword values */
corner-bottom-right-shape: notch;
corner-bottom-right-shape: scoop;

/* superellipse() function values */
corner-bottom-right-shape: superellipse(1.7);
corner-bottom-right-shape: superellipse(-3);

/* Global values */
corner-bottom-right-shape: inherit;
corner-bottom-right-shape: initial;
corner-bottom-right-shape: revert;
corner-bottom-right-shape: revert-layer;
corner-bottom-right-shape: unset;
```

### Giá trị

Thuộc tính `corner-bottom-right-shape` được chỉ định bằng một giá trị {{cssxref("&lt;corner-shape-value>")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

### Cách dùng cơ bản của `corner-bottom-right-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng ta cho hộp một số kiểu dáng cơ bản, được ẩn để ngắn gọn. Chúng ta cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là `30% / 20%`, và `corner-bottom-right-shape` là `notch`.

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
  background-color: cyan;
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
  border-radius: 30% / 20%;
  corner-bottom-right-shape: notch;
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
- {{cssxref("corner-top-left-shape")}}, {{cssxref("corner-top-right-shape")}}, and {{cssxref("corner-bottom-left-shape")}}
- {{cssxref("corner-start-start-shape")}}, {{cssxref("corner-start-end-shape")}}, {{cssxref("corner-end-start-shape")}}, and {{cssxref("corner-end-end-shape")}}
- {{cssxref("border-radius")}} shorthand property
- {{cssxref("border-bottom-right-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
