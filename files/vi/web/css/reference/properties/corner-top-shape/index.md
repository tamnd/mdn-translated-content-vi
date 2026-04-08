---
title: corner-top-shape
slug: Web/CSS/Reference/Properties/corner-top-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.corner-top-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`corner-top-shape`** chỉ định hình dạng của cả hai góc ở cạnh trên của một hộp, trong phạm vi vùng {{cssxref("border-radius")}} của chúng.

Để có mô tả đầy đủ về hành vi hình dạng góc và nhiều ví dụ, xem trang thuộc tính viết tắt {{cssxref("corner-shape")}}.

## Các thuộc tính thành phần

Thuộc tính `corner-top-shape` là dạng viết tắt của các thuộc tính vật lý sau:

- {{cssxref("corner-top-left-shape")}}
- {{cssxref("corner-top-right-shape")}}

## Cú pháp

```css
/* Single keyword value set for both corners */
corner-top-shape: notch;
corner-top-shape: squircle;

/* Single superellipse() value set for both corners */
corner-top-shape: superellipse(3);
corner-top-shape: superellipse(-1.5);

/* Left-hand corner, right-hand corner */
corner-top-shape: notch squircle;
corner-top-shape: notch superellipse(-1.5);

/* Global values */
corner-top-shape: inherit;
corner-top-shape: initial;
corner-top-shape: revert;
corner-top-shape: revert-layer;
corner-top-shape: unset;
```

### Giá trị

Thuộc tính `corner-top-shape` được chỉ định bằng một hoặc hai giá trị {{cssxref("&lt;corner-shape-value>")}}:

- Nếu **một giá trị** được sử dụng, nó chỉ định hình dạng của **cả hai góc trên**.
- Nếu **hai giá trị** được sử dụng, giá trị đầu tiên chỉ định hình dạng của góc **trên-trái**, và giá trị thứ hai chỉ định hình dạng của góc **trên-phải**.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

### Cách dùng cơ bản của `corner-top-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng ta cho hộp một số kiểu dáng cơ bản, được ẩn để ngắn gọn. Chúng ta cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là 60 pixel, và `corner-top-shape` là `scoop notch`.

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
  border-radius: 60px;
  corner-top-shape: scoop notch;
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
- {{cssxref("corner-bottom-shape")}}, {{cssxref("corner-left-shape")}}, and {{cssxref("corner-right-shape")}}
- {{cssxref("corner-block-start-shape")}}, {{cssxref("corner-block-end-shape")}}, {{cssxref("corner-inline-start-shape")}}, and {{cssxref("corner-inline-end-shape")}}
- {{cssxref("border-radius")}} shorthand property
- {{cssxref("border-top-left-radius")}} and {{cssxref("border-top-right-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
