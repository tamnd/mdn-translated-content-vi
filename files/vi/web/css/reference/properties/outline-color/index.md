---
title: outline-color
slug: Web/CSS/Reference/Properties/outline-color
page-type: css-property
browser-compat: css.properties.outline-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`outline-color`** đặt màu của outline một phần tử.

{{InteractiveExample("CSS Demo: outline-color")}}

```css interactive-example-choice
outline-color: red;
```

```css interactive-example-choice
outline-color: #32a1ce;
```

```css interactive-example-choice
outline-color: rgb(170 50 220 / 0.6);
```

```css interactive-example-choice
outline-color: hsl(60 90% 50% / 0.8);
```

```css interactive-example-choice
outline-color: currentColor;
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

## Cú pháp

```css
/* Giá trị <color> */
outline-color: #f92525;
outline-color: rgb(30 222 121);
outline-color: blue;

/* Giá trị toàn cục */
outline-color: inherit;
outline-color: initial;
outline-color: revert;
outline-color: revert-layer;
outline-color: unset;
```

Thuộc tính `outline-color` được chỉ định là bất kỳ một trong các giá trị liệt kê bên dưới.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của outline, được chỉ định là `<color>`.

Đặc tả cũng liệt kê một giá trị bổ sung là `auto`, hiện không được hỗ trợ trong bất kỳ trình duyệt nào. Khi được triển khai, `auto` sẽ tính toán thành [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword) trừ khi {{cssxref("outline-style")}} được đặt thành `auto`, thì nó sẽ tính toán thành [accent color](/en-US/docs/Web/CSS/Reference/Properties/accent-color).

## Mô tả

Outline là đường kẻ được vẽ xung quanh một phần tử, bên ngoài {{cssxref("border")}}. Không giống như border của phần tử, outline được vẽ bên ngoài khung của phần tử và có thể chồng lên nội dung khác. Mặt khác, border sẽ thực sự thay đổi bố cục của trang để đảm bảo nó vừa vặn mà không chồng lên bất cứ thứ gì khác (trừ khi bạn đặt nó rõ ràng để chồng lên).

Thường tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("outline")}} khi xác định giao diện của outline.

## Khả năng tiếp cận

[Kiểu tiêu điểm](/en-US/docs/Web/CSS/Reference/Selectors/:focus) tùy chỉnh thường liên quan đến việc điều chỉnh thuộc tính {{cssxref("outline")}}. Nếu màu của outline được điều chỉnh, điều quan trọng là phải đảm bảo tỷ lệ tương phản giữa nó và nền mà outline được đặt trên đủ cao để những người có thị lực kém có thể nhận ra nó.

Tỷ lệ tương phản màu sắc được xác định bằng cách so sánh độ sáng của các giá trị màu văn bản và nền. Để đáp ứng [Hướng dẫn Tiếp cận Nội dung Web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện tại, cần tỷ lệ 4,5:1 cho nội dung văn bản và 3:1 cho văn bản lớn hơn như tiêu đề. Văn bản lớn được định nghĩa là 18,66px và [đậm](/en-US/docs/Web/CSS/Reference/Properties/font-weight) trở lên, hoặc 24px trở lên.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt outline màu xanh đặc

#### HTML

```html
<p>My outline is blue, as you can see.</p>
```

#### CSS

```css
p {
  outline: 2px solid; /* Set the outline width and style */
  outline-color: blue; /* Set the outline color */
  margin: 5px;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_a_solid_blue_outline') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("outline")}}
- {{cssxref("outline-width")}}
- {{cssxref("outline-style")}}
- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Các thuộc tính liên quan đến màu khác: {{cssxref("color")}}, {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}}, và {{cssxref("column-rule-color")}}
