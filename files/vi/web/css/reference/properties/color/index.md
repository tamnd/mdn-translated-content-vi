---
title: color
slug: Web/CSS/Reference/Properties/color
page-type: css-property
browser-compat: css.properties.color
sidebar: cssref
---

Thuộc tính **`color`** trong [CSS](/en-US/docs/Web/CSS) thiết lập giá trị [màu sắc](/en-US/docs/Web/CSS/Reference/Values/color_value) cho phần tử nền trước (foreground) bao gồm văn bản và [trang trí văn bản](/en-US/docs/Web/CSS/Reference/Properties/text-decoration), đồng thời thiết lập giá trị [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword). `currentColor` có thể được dùng làm giá trị gián tiếp trên các thuộc tính _khác_ và là giá trị mặc định cho các thuộc tính màu sắc khác, chẳng hạn như {{cssxref("border-color")}}.

Để có cái nhìn tổng quan về việc sử dụng màu sắc trong HTML, hãy xem [Áp dụng màu sắc cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color).

{{InteractiveExample("CSS Demo: color")}}

```css interactive-example-choice
color: rebeccapurple;
```

```css interactive-example-choice
color: #00a400;
```

```css interactive-example-choice
color: rgb(214 122 127);
```

```css interactive-example-choice
color: hsl(30deg 82% 43%);
```

```css interactive-example-choice
color: hsl(237deg 74% 33% / 61%);
```

```css interactive-example-choice
color: hwb(152deg 0% 58% / 70%);
```

```html interactive-example
<section id="default-example">
  <div class="example-container">
    <p id="example-element">
      London. Michaelmas term lately over, and the Lord Chancellor sitting in
      Lincoln's Inn Hall. Implacable November weather.
    </p>
  </div>
</section>
```

```css interactive-example
#example-element {
  font-size: 1.5em;
}

.example-container {
  background-color: white;
  padding: 10px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
color: currentColor;

/* Giá trị <named-color> */
color: red;
color: orange;
color: tan;
color: rebeccapurple;

/* Giá trị <hex-color> */
color: #090;
color: #009900;
color: #090a;
color: #009900aa;

/* Giá trị <rgb()> và giá trị kế thừa <rgba()> */
color: rgb(34, 12, 64);
color: rgb(34, 12, 64, 0.6);
color: rgba(34, 12, 64, 0.6);
color: rgb(34 12 64 / 0.6);
color: rgba(34 12 64 / 0.6);
color: rgb(34.6 12 64 / 60%);
color: rgba(34.6 12 64 / 60%);

/* Giá trị <hsl()> và giá trị kế thừa <hsla()> */
color: hsl(30, 100%, 50%);
color: hsl(30, 100%, 50%, 0.6);
color: hsla(30, 100%, 50%, 0.6);
color: hsl(30 100% 50% / 0.6);
color: hsla(30 100% 50% / 0.6);
color: hsl(30.2 100% 50% / 60%);
color: hsla(30.2 100% 50% / 60%);

/* Giá trị <hwb()> */
color: hwb(90 10% 10%);
color: hwb(90 10% 10% / 0.5);
color: hwb(90deg 10% 10%);
color: hwb(1.5708rad 60% 0%);
color: hwb(0.25turn 0% 40% / 50%);

/* Giá trị toàn cục */
color: inherit;
color: initial;
color: revert;
color: revert-layer;
color: unset;
```

Thuộc tính `color` được chỉ định dưới dạng một giá trị {{cssxref("&lt;color&gt;")}} duy nhất.

Lưu ý rằng giá trị phải là một màu đồng nhất. Không thể là một {{cssxref("gradient")}}, vốn thực ra là một loại {{cssxref("image")}}.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Thiết lập màu sắc cho các phần văn bản và trang trí của phần tử.
- [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword)
  - : Thiết lập màu sắc theo giá trị thuộc tính `color` của phần tử. Tuy nhiên, nếu được đặt làm giá trị của `color`, `currentColor` sẽ được xử lý như `inherit`.

## Khả năng truy cập

Điều quan trọng là phải đảm bảo tỷ lệ tương phản giữa màu của văn bản và nền mà văn bản được đặt lên đủ cao để những người có thị lực kém có thể đọc được nội dung của trang.

Tỷ lệ tương phản màu sắc được xác định bằng cách so sánh độ sáng (luminosity) của các giá trị màu văn bản và màu nền. Để đáp ứng [Hướng dẫn khả năng truy cập nội dung web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện hành, cần có tỷ lệ 4.5:1 đối với nội dung văn bản và 3:1 đối với văn bản lớn hơn như tiêu đề. Văn bản lớn được định nghĩa là 18.66px và [đậm](/en-US/docs/Web/CSS/Reference/Properties/font-weight) trở lên, hoặc 24px trở lên.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Làm cho văn bản có màu đỏ

Dưới đây là tất cả các cách để làm cho văn bản của đoạn văn có màu đỏ:

```css
p {
  color: red;
}
p {
  color: #f00;
}
p {
  color: #ff0000;
}
p {
  color: rgb(255 0 0);
}
p {
  color: rgb(100% 0% 0%);
}
p {
  color: hsl(0 100% 50%);
}

/* 50% trong suốt */
p {
  color: #ff000080;
}
p {
  color: rgb(255 0 0 / 50%);
}
p {
  color: hsl(0 100% 50% / 50%);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Các thuộc tính liên quan đến màu sắc khác: {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}}, {{cssxref("column-rule-color")}}, và {{cssxref("print-color-adjust")}}
- Thuộc tính SVG {{SVGAttr("color")}}
- Hàm {{CSSXref("color_value/color")}}
- [Áp dụng màu sắc cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
- [WCAG: color contrast](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)
