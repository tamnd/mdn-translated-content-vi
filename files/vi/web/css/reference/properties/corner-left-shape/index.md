---
title: corner-left-shape
slug: Web/CSS/Reference/Properties/corner-left-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.corner-left-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`corner-left-shape`** chỉ định hình dạng của cả hai góc trên cạnh bên trái của một hộp, trong phạm vi vùng {{cssxref("border-radius")}} của chúng.

Để có mô tả đầy đủ về hành vi hình dạng góc và nhiều ví dụ, xem trang thuộc tính viết tắt {{cssxref("corner-shape")}}.

## Các thuộc tính cấu thành

Thuộc tính `corner-left-shape` là viết tắt của các thuộc tính vật lý sau:

- {{cssxref("corner-top-left-shape")}}
- {{cssxref("corner-bottom-left-shape")}}

## Cú pháp

```css
/* Single keyword value set for both corners */
corner-left-shape: round;
corner-left-shape: bevel;

/* Single superellipse() value set for both corners */
corner-left-shape: superellipse(1.2);
corner-left-shape: superellipse(-2.5);

/* Top corner, bottom corner */
corner-left-shape: round bevel;
corner-left-shape: bevel superellipse(1.2);

/* Global values */
corner-left-shape: inherit;
corner-left-shape: initial;
corner-left-shape: revert;
corner-left-shape: revert-layer;
corner-left-shape: unset;
```

### Giá trị

Thuộc tính `corner-left-shape` được chỉ định bằng một hoặc hai giá trị {{cssxref("&lt;corner-shape-value>")}}:

- Nếu dùng **một giá trị**, nó chỉ định hình dạng của **cả hai góc bên trái**.
- Nếu dùng **hai giá trị**, giá trị đầu tiên chỉ định hình dạng của góc **trên-trái**, và giá trị thứ hai chỉ định hình dạng của góc **dưới-trái**.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Bạn có thể tìm các ví dụ liên quan khác trên trang tham chiếu {{cssxref("corner-shape")}}.

### Cách dùng cơ bản của `corner-left-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-usage
<div></div>
```

#### CSS

Chúng ta cho hộp một số kiểu dáng cơ bản, được ẩn để ngắn gọn. Chúng ta cũng áp dụng {{cssxref("box-shadow")}}, `border-radius` là `20px 40px / 60px 80px`, và `corner-left-shape` là `notch bevel`.

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
  border-radius: 20px 40px / 60px 80px;
  corner-left-shape: notch bevel;
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
- {{cssxref("corner-top-shape")}}, {{cssxref("corner-bottom-shape")}}, and {{cssxref("corner-right-shape")}}
- {{cssxref("corner-block-start-shape")}}, {{cssxref("corner-block-end-shape")}}, {{cssxref("corner-inline-start-shape")}}, and {{cssxref("corner-inline-end-shape")}}
- {{cssxref("border-radius")}} shorthand property
- {{cssxref("border-top-left-radius")}} and {{cssxref("border-bottom-left-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
