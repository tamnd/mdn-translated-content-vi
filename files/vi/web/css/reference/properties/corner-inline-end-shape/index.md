---
title: corner-inline-end-shape
slug: Web/CSS/Reference/Properties/corner-inline-end-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.corner-inline-end-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`corner-inline-end-shape`** chỉ định hình dạng của cả hai góc trên cạnh inline-end của một hộp, trong phạm vi vùng {{cssxref("border-radius")}} của chúng.

Để có mô tả đầy đủ về hành vi hình dạng góc và nhiều ví dụ, xem trang thuộc tính viết tắt {{cssxref("corner-shape")}}.

## Các thuộc tính cấu thành

Thuộc tính `corner-inline-end-shape` là viết tắt của các thuộc tính logic sau:

- {{cssxref("corner-start-end-shape")}}
- {{cssxref("corner-end-end-shape")}}

## Cú pháp

```css
/* Single keyword value set for both corners */
corner-inline-end-shape: squircle;
corner-inline-end-shape: scoop;

/* Single superellipse() value set for both corners */
corner-inline-end-shape: superellipse(1.5);
corner-inline-end-shape: superellipse(-0.8);

/* Block-start/inline-end corner, block-end/inline-end corner */
corner-inline-end-shape: squircle scoop;
corner-inline-end-shape: squircle superellipse(-0.8);

/* Global values */
corner-inline-end-shape: inherit;
corner-inline-end-shape: initial;
corner-inline-end-shape: revert;
corner-inline-end-shape: revert-layer;
corner-inline-end-shape: unset;
```

### Giá trị

Thuộc tính `corner-inline-end-shape` được chỉ định bằng một hoặc hai giá trị {{cssxref("&lt;corner-shape-value>")}}:

- Nếu dùng **một giá trị**, nó chỉ định hình dạng của **cả hai góc inline-end**.
- Nếu dùng **hai giá trị**, giá trị đầu tiên chỉ định hình dạng của góc **block-start/inline-end**, và giá trị thứ hai chỉ định hình dạng của góc **block-end/inline-end**.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

### Cách dùng cơ bản của `corner-inline-end-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng ta cho hộp một số kiểu dáng cơ bản, được ẩn để ngắn gọn. Chúng ta cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là `15% 30%`, và `corner-inline-end-shape` là `bevel squircle`.

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
  background-color: green;
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
  border-radius: 15% 30%;
  corner-inline-end-shape: bevel squircle;
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
- {{cssxref("corner-block-start-shape")}}, {{cssxref("corner-block-end-shape")}}, and {{cssxref("corner-inline-start-shape")}}
- {{cssxref("corner-top-shape")}}, {{cssxref("corner-bottom-shape")}}, {{cssxref("corner-left-shape")}}, and {{cssxref("corner-right-shape")}}
- {{cssxref("border-radius")}} shorthand property
- {{cssxref("border-start-end-radius")}} and {{cssxref("border-end-end-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
