---
title: corner-block-end-shape
slug: Web/CSS/Reference/Properties/corner-block-end-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.corner-block-end-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`corner-block-end-shape`** chỉ định hình dạng của cả hai góc ở cạnh block-end của một hộp, trong phạm vi vùng {{cssxref("border-radius")}} của chúng.

Để có mô tả đầy đủ về hành vi hình dạng góc và nhiều ví dụ, xem trang thuộc tính viết tắt {{cssxref("corner-shape")}}.

## Các thuộc tính thành phần

Thuộc tính `corner-block-end-shape` là dạng viết tắt của các thuộc tính logic sau:

- {{cssxref("corner-end-start-shape")}}
- {{cssxref("corner-end-end-shape")}}

## Cú pháp

```css
/* Single keyword value set for both corners */
corner-block-end-shape: square;
corner-block-end-shape: scoop;

/* Single superellipse() value set for both corners */
corner-block-end-shape: superellipse(3.5);
corner-block-end-shape: superellipse(-1.9);

/* Block-end/inline-start corner, block-end/inline-end corner */
corner-block-end-shape: square scoop;
corner-block-end-shape: square superellipse(-1.9);

/* Global values */
corner-block-end-shape: inherit;
corner-block-end-shape: initial;
corner-block-end-shape: revert;
corner-block-end-shape: revert-layer;
corner-block-end-shape: unset;
```

### Giá trị

Thuộc tính `corner-block-end-shape` được chỉ định bằng một hoặc hai giá trị {{cssxref("&lt;corner-shape-value>")}}}:

- Nếu **một giá trị** được sử dụng, nó chỉ định hình dạng của **cả hai góc block-end**.
- Nếu **hai giá trị** được sử dụng, giá trị đầu tiên chỉ định hình dạng của góc **block-end/inline-start**, và giá trị thứ hai chỉ định hình dạng của góc **block-end/inline-end**.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

### Cách dùng cơ bản của `corner-block-end-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng ta cho hộp một số kiểu dáng cơ bản, được ẩn để ngắn gọn. Chúng ta cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là `80px / 40px`, và `corner-block-end-shape` là `notch square`.

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
  border-radius: 80px / 40px;
  corner-block-end-shape: notch square;
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
- {{cssxref("corner-block-start-shape")}}, {{cssxref("corner-inline-start-shape")}}, and {{cssxref("corner-inline-end-shape")}}
- {{cssxref("corner-top-shape")}}, {{cssxref("corner-bottom-shape")}}, {{cssxref("corner-left-shape")}}, and {{cssxref("corner-right-shape")}}
- {{cssxref("border-radius")}} shorthand property
- {{cssxref("border-end-start-radius")}} and {{cssxref("border-end-end-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
