---
title: transform
slug: Web/CSS/Reference/Properties/transform
page-type: css-property
browser-compat: css.properties.transform
sidebar: cssref
---

Thuộc tính **`transform`** của [CSS](/vi/docs/Web/CSS) cho phép bạn xoay, co giãn, nghiêng hoặc dịch chuyển một phần tử.
Nó chỉnh sửa không gian tọa độ của [mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model) CSS.

Nếu thuộc tính có giá trị khác `none`, một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) sẽ được tạo ra.
Trong trường hợp đó, phần tử sẽ hoạt động như một [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) cho bất kỳ phần tử `position: fixed;` hoặc `position: absolute;` nào mà nó chứa.

Bạn cũng có thể sử dụng các thuộc tính transform riêng lẻ: {{cssxref('translate')}}, {{cssxref('rotate')}} và {{cssxref('scale')}}. Các thuộc tính này được áp dụng theo thứ tự: `translate`, `rotate`, `scale` và cuối cùng là `transform`.

> [!WARNING]
> Chỉ những phần tử có thể biến đổi mới có thể được `transform`.
> Đó là tất cả các phần tử có bố cục được điều chỉnh bởi mô hình hộp CSS, ngoại trừ: [hộp inline không được thay thế](/en-US/docs/Glossary/Inline-level_content), [hộp cột bảng](/en-US/docs/Web/HTML/Reference/Elements/col) và [hộp nhóm cột bảng](/en-US/docs/Web/HTML/Reference/Elements/colgroup).

{{InteractiveExample("CSS Demo: transform")}}

```css interactive-example-choice
transform: matrix(1, 2, 3, 4, 5, 6);
```

```css interactive-example-choice
transform: translate(120px, 50%);
```

```css interactive-example-choice
transform: scale(2, 0.5);
```

```css interactive-example-choice
transform: rotate(0.5turn);
```

```css interactive-example-choice
transform: skew(30deg, 20deg);
```

```css interactive-example-choice
transform: scale(0.5) translate(-100%, -100%);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

## Cú pháp

```css
/* Giá trị từ khóa */
transform: none;

/* Giá trị hàm */
transform: matrix(1, 2, 3, 4, 5, 6);
transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
transform: perspective(17px);
transform: rotate(0.5turn);
transform: rotate3d(1, 2, 3, 10deg);
transform: rotateX(10deg);
transform: rotateY(10deg);
transform: rotateZ(10deg);
transform: translate(12px, 50%);
transform: translate3d(12px, 50%, 3em);
transform: translateX(2em);
transform: translateY(3in);
transform: translateZ(2px);
transform: scale(2, 0.5);
transform: scale3d(2.5, 1.2, 0.3);
transform: scaleX(2);
transform: scaleY(0.5);
transform: scaleZ(0.3);
transform: skew(30deg, 20deg);
transform: skewX(30deg);
transform: skewY(1.07rad);

/* Nhiều giá trị hàm */
transform: translateX(10px) rotate(10deg) translateY(5px);
transform: perspective(500px) translate3d(10px, 0, 20px) rotateY(30deg);

/* Giá trị toàn cục */
transform: inherit;
transform: initial;
transform: revert;
transform: revert-layer;
transform: unset;
```

Thuộc tính `transform` có thể được chỉ định là giá trị từ khóa `none` hoặc một hay nhiều giá trị `<transform-function>`.

### Giá trị

- {{cssxref("&lt;transform-function&gt;")}}
  - : Một hoặc nhiều [hàm biến đổi CSS](/en-US/docs/Web/CSS/Reference/Values/transform-function) được áp dụng.
    Các hàm biến đổi được nhân theo thứ tự từ trái sang phải, có nghĩa là các biến đổi tổng hợp được [áp dụng theo thứ tự từ phải sang trái](#transform_order).
- `none`
  - : Chỉ định rằng không có biến đổi nào được áp dụng.

## Khả năng tiếp cận

Các hoạt ảnh thu phóng/co giãn gây vấn đề về khả năng tiếp cận, vì chúng là tác nhân phổ biến gây ra một số loại đau nửa đầu.
Nếu bạn cần đưa các hoạt ảnh như vậy vào trang web, bạn nên cung cấp tùy chọn để người dùng tắt hoạt ảnh, tốt nhất là trên toàn bộ trang web.

Ngoài ra, hãy cân nhắc sử dụng tính năng media {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}} — dùng nó để viết [truy vấn media](/en-US/docs/Web/CSS/Guides/Media_queries) sẽ tắt hoạt ảnh nếu người dùng đã chỉ định giảm hoạt ảnh trong tùy chọn hệ thống.

Tìm hiểu thêm:

- [MDN Giải thích WCAG, Hướng dẫn 2.3](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.3_—_seizures_and_physical_reactions_do_not_design_content_in_a_way_that_is_known_to_cause_seizures_or_physical_reactions)
- [Hiểu Tiêu chí Thành công 2.3.3 | W3C Hiểu WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/animation-from-interactions)

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Dịch chuyển và xoay một phần tử

#### HTML

```html
<div>Transformed element</div>
```

#### CSS

```css
div {
  border: solid red;
  transform: translate(30px, 20px) rotate(20deg);
  width: 140px;
  height: 60px;
}
```

#### Kết quả

{{EmbedLiveSample("Translating_and_rotating_an_element", "400", "160")}}

### Thứ tự transform

Thứ tự của các hàm biến đổi có vai trò quan trọng. Trong ví dụ này, hai hộp được xoay và dịch chuyển theo cùng giá trị; chỉ thứ tự hàm biến đổi là khác nhau.

#### HTML

```html
<div class="original"></div>
<div class="one">1</div>
<div class="two">2</div>
```

#### CSS

```css hidden
div {
  height: 200px;
  width: 200px;
  position: absolute;
  left: 200px;
  top: 50px;
  font-size: 4rem;
  line-height: 200px;
  text-align: center;
}
.original {
  border: 1px dashed;
}
.original::before,
.original::after {
  content: "";
  position: absolute;
  top: 100px;
  width: 500px;
  left: -150px;
  height: 1px;
  border-top: 2px dotted;
}
.original::after {
  transform: rotate(135deg);
}
.one {
  background-color: #cccccc;
}
.two {
  background-color: #d6bb72;
}
```

```css
.one {
  transform: translateX(200px) rotate(135deg);
}
.two {
  transform: rotate(135deg) translateX(200px);
}
```

#### Kết quả

{{EmbedLiveSample("Transform_order", "400", "460")}}

Khi một phần tử được xoay trước khi dịch chuyển, hướng dịch chuyển nằm trên trục đã xoay. Trục được chỉ ra bằng các đường chấm.

### Thêm ví dụ

Vui lòng xem [Sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using) và {{cssxref("&lt;transform-function&gt;")}} để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
- Kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}} với tất cả các hàm biến đổi được giải thích.
- Các thuộc tính CSS riêng lẻ: {{cssxref('translate')}}, {{cssxref('rotate')}} và {{cssxref('scale')}} (không có thuộc tính `skew`).
- Thuộc tính SVG {{SVGAttr("transform")}}
- Công cụ trực tuyến để trực quan hóa các hàm CSS Transform: [CSS Transform Playground](https://css-transform.moro.es/)
