---
title: CSS compositing and blending
short-title: Compositing and blending
slug: Web/CSS/Guides/Compositing_and_blending
page-type: css-module
spec-urls: https://drafts.csswg.org/compositing-1/
sidebar: cssref
---

Module **CSS compositing and blending** định nghĩa cách các lớp nền của một phần tử có thể được pha trộn với nhau, cách một phần tử có thể được pha trộn với container của nó, và liệu phần tử có cần tạo [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới hay không.

Các thuộc tính trong module CSS này có thể được dùng để định nghĩa chế độ blending nào cần sử dụng, nếu có, để pha trộn các hình ảnh nền và màu sắc của một phần tử thành một hình ảnh nền duy nhất. Module này cung cấp 16 chế độ blending. Bạn cũng có thể định nghĩa cách viền, nền, và nội dung của phần tử, bao gồm văn bản, emoji, và hình ảnh, sẽ được pha trộn với nền của container của nó.

## Compositing và blending trong thực tế

Trong ví dụ này, mỗi hộp có viền, hai hình ảnh nền có sọc, và nền màu đồng nhất. Nền chung cho tất cả các hộp chứa mẫu vòng tròn. Ba hộp ở hàng thứ hai được thiết lập để pha trộn với nền của container.

```html hidden live-sample___compositing
<section>
  <div><span>Normal, with no blending</span></div>
  <div><span>Multiplies colors</span></div>
  <div><span>Multiplies based on background color</span></div>
  <div>Normal, with no blending</div>
  <div>Multiplies colors</div>
  <div>Multiplies based on background color</div>
</section>
```

```css hidden live-sample___compositing
/* Creates a div with two offset striped background images and a background color. */
div {
  width: 200px;
  height: 200px;
  background-image:
    repeating-linear-gradient(45deg, red 0 15px, pink 15px 30px),
    repeating-linear-gradient(-45deg, blue 0 15px, lightblue 15px 30px);
  background-size: 150px 150px;
  background-repeat: no-repeat;
  background-position:
    top left,
    bottom right;
  background-color: palegoldenrod;
  text-align: center;
  padding-top: 150px;
  font-family: sans-serif;
  box-sizing: border-box;
  border: 5px solid black;
}
div:nth-of-type(3n + 1) {
  background-blend-mode: normal;
}
div:nth-of-type(3n + 2) {
  background-blend-mode: multiply;
}
div:nth-of-type(3n + 3) {
  background-blend-mode: overlay;
}
div:nth-of-type(n + 4) {
  mix-blend-mode: difference;
}
/* Put a pink background with transparent round holes that covers the 
  entire element, and lay the examples in two rows with three columns each */
section {
  padding: 0.75em;
  background: radial-gradient(
    circle,
    transparent 0 20px,
    rgb(255 200 200) 20px
  );
  background-size: 60px 60px;
  background-position: center;
  display: inline-grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 1em;
}
/* Make some of the text more legible */
span {
  background-color: #ffffff99;
}
```

{{EmbedLiveSample("compositing", "", "450px")}}

Lưu ý cách nền, viền, và nội dung đều bị ảnh hưởng bởi blending.
Nhấn "Play" trong ví dụ trên để xem hoặc chỉnh sửa code cho hoạt hình trong MDN Playground.

## Tham chiếu

### Thuộc tính

- {{cssxref("background-blend-mode")}}
- {{cssxref("isolation")}}
- {{cssxref("mix-blend-mode")}}

## Khái niệm liên quan

- Kiểu dữ liệu {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("backdrop-filter")}}
- Thuộc tính CSS {{cssxref("filter")}}
- Thuộc tính CSS {{cssxref("mask-composite")}}
- Thuộc tính CSS {{cssxref("background-color")}}
- Thuộc tính CSS {{cssxref("background-image")}}
- Thuật ngữ glossary {{glossary("stacking context")}}
- SVG filter primitive {{ SVGElement("feBlend")}}
- SVG filter primitive {{ SVGElement("feComposite")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính trong module [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) cho phép áp dụng các hiệu ứng lọc, chẳng hạn như làm mờ và thay đổi cường độ màu, cho hình ảnh, nền, và viền.
- [Compositing And Blending In CSS](https://www.sarasoueidan.com/blog/compositing-and-blending-in-css/) (2015)
- [Editing Images in CSS: Blend Modes](https://webdesign.tutsplus.com/editing-images-in-css-blend-modes--cms-26058t) (2022)
- [web.dev: blend modes](https://web.dev/learn/css/blend-modes) (2021)
