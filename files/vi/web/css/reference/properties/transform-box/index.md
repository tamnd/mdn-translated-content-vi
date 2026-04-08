---
title: transform-box
slug: Web/CSS/Reference/Properties/transform-box
page-type: css-property
browser-compat: css.properties.transform-box
sidebar: cssref
---

Thuộc tính **`transform-box`** của [CSS](/vi/docs/Web/CSS) xác định hộp bố cục mà các thuộc tính {{cssxref("transform")}}, các thuộc tính transform riêng lẻ {{cssxref("translate")}}, {{cssxref("scale")}} và {{cssxref("rotate")}}, cũng như thuộc tính {{cssxref("transform-origin")}} liên quan đến.

## Cú pháp

```css
/* Giá trị từ khóa */
transform-box: content-box;
transform-box: border-box;
transform-box: fill-box;
transform-box: stroke-box;
transform-box: view-box;

/* Giá trị toàn cục */
transform-box: inherit;
transform-box: initial;
transform-box: revert;
transform-box: revert-layer;
transform-box: unset;
```

Thuộc tính `transform-box` được chỉ định là một trong các giá trị từ khóa liệt kê bên dưới.

### Giá trị

- `content-box`
  - : Hộp nội dung được sử dụng làm hộp tham chiếu. Hộp tham chiếu của một {{htmlElement("table")}} là hộp viền của [hộp bao bảng](/en-US/docs/Glossary/Table_Wrapper_Box), không phải hộp bảng của nó.
- `border-box`
  - : Hộp viền được sử dụng làm hộp tham chiếu. Hộp tham chiếu của một {{htmlElement("table")}} là hộp viền của [hộp bao bảng](/en-US/docs/Glossary/Table_Wrapper_Box), không phải hộp bảng của nó.
- `fill-box`
  - : Hộp bao đối tượng được sử dụng làm hộp tham chiếu. Đối với các phần tử có hộp bố cục CSS liên kết, hoạt động như `content-box`.
- `stroke-box`
  - : Hộp bao nét viền được sử dụng làm hộp tham chiếu. Đối với các phần tử có hộp bố cục CSS liên kết, hoạt động như `border-box`.
- `view-box`
  - : Viewport {{Glossary("SVG")}} gần nhất được sử dụng làm hộp tham chiếu. Nếu thuộc tính {{SVGAttr("viewBox")}} được chỉ định cho phần tử tạo viewport SVG, hộp tham chiếu được đặt ở gốc tọa độ do thuộc tính `viewBox` thiết lập, và kích thước hộp tham chiếu được đặt theo các giá trị chiều rộng và chiều cao của thuộc tính `viewBox`. Đối với các phần tử có hộp bố cục CSS liên kết, hoạt động như `border-box`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Phạm vi transform-origin trong SVG

Trong ví dụ này, chúng ta có một SVG:

```html
<svg id="svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
  <g>
    <circle id="center" fill="red" r="1" transform="translate(25 25)" />
    <circle id="boxcenter" fill="blue" r=".5" transform="translate(15 15)" />
    <rect
      id="box"
      x="10"
      y="10"
      width="10"
      height="10"
      rx="1"
      ry="1"
      stroke="black"
      fill="none" />
  </g>
</svg>
```

Trong CSS, chúng ta có một hoạt ảnh sử dụng transform để xoay hình chữ nhật vô hạn. `transform-box: fill-box` được sử dụng để làm cho `transform-origin` là tâm của hộp bao, vì vậy hình chữ nhật quay tại chỗ. Không có nó, điểm gốc transform là tâm của canvas SVG và bạn sẽ nhận được hiệu ứng rất khác.

```css
svg {
  width: 80vh;
  border: 1px solid #d9d9d9;
  position: absolute;
  margin: auto;
  inset: 0;
}

#box {
  transform-origin: 50% 50%; /* bất kỳ giá trị nào khác `0 0` để thấy hiệu ứng */
  transform-box: fill-box;
  animation: rotate-box 3s linear infinite;
}

@keyframes rotate-box {
  to {
    transform: rotate(360deg);
  }
}
```

{{EmbedLiveSample("SVG transform-origin scoping", "", 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
- {{cssxref("transform")}}, {{cssxref("transform-origin")}}
- Các thuộc tính transform riêng lẻ:
  - {{cssxref("translate")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
