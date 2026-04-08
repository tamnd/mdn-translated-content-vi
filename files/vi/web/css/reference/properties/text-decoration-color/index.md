---
title: text-decoration-color
slug: Web/CSS/Reference/Properties/text-decoration-color
page-type: css-property
browser-compat: css.properties.text-decoration-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-color`** đặt màu của các trang trí được thêm vào văn bản bởi {{ cssxref("text-decoration-line") }}.

Màu sắc áp dụng cho các trang trí, chẳng hạn như gạch chân, gạch trên, gạch ngang, và đường lượn sóng như những đường dùng để đánh dấu lỗi chính tả, trong phạm vi giá trị của thuộc tính.

{{InteractiveExample("CSS Demo: text-decoration-color")}}

```css interactive-example-choice
text-decoration-color: red;
```

```css interactive-example-choice
text-decoration-color: #21ff21;
```

```css interactive-example-choice
text-decoration-color: rgb(255 90 255);
```

```css interactive-example-choice
text-decoration-color: hsl(70 100% 40%);
```

```css interactive-example-choice
text-decoration-color: currentColor;
```

```html interactive-example
<section id="default-example">
  <p>
    I'd far rather be
    <span class="transition-all" id="example-element">happy than right</span>
    any day.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}

#example-element {
  text-decoration-line: underline;
}
```

CSS không cung cấp cơ chế trực tiếp để chỉ định màu riêng biệt cho từng loại đường. Tuy nhiên, hiệu ứng này vẫn có thể đạt được bằng cách lồng các phần tử, áp dụng các loại đường khác nhau cho mỗi phần tử (với thuộc tính {{cssxref("text-decoration-line")}}), và chỉ định màu đường (với `text-decoration-color`) theo từng phần tử riêng biệt.

## Cú pháp

```css
/* Giá trị <color> */
text-decoration-color: currentColor;
text-decoration-color: red;
text-decoration-color: #00ff00;
text-decoration-color: rgb(255 128 128 / 50%);
text-decoration-color: transparent;

/* Giá trị toàn cục */
text-decoration-color: inherit;
text-decoration-color: initial;
text-decoration-color: revert;
text-decoration-color: revert-layer;
text-decoration-color: unset;
```

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của đường trang trí.

## Khả năng tiếp cận

Điều quan trọng là đảm bảo tỷ lệ tương phản giữa màu của văn bản, nền mà văn bản được đặt trên và đường trang trí văn bản đủ cao để người có thị lực kém có thể đọc được nội dung của trang. Tỷ lệ tương phản màu được xác định bằng cách so sánh độ sáng của giá trị màu văn bản và màu nền.

Màu sắc không nên được sử dụng một mình để truyền đạt ý nghĩa. Ví dụ, chỉ thay đổi văn bản và text-decoration-color là không đủ để chỉ ra rằng một liên kết đang được focus.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

```html
<p>
  This paragraph has <s>some erroneous text</s> inside it that I want to call
  attention to.
</p>
```

```css
p {
  text-decoration-line: underline;
  text-decoration-color: cyan;
}

s {
  text-decoration-line: line-through;
  text-decoration-color: red;
  text-decoration-style: wavy;
}
```

{{ EmbedLiveSample('Examples') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Khi đặt nhiều thuộc tính trang trí đường cùng một lúc, có thể thuận tiện hơn khi dùng thuộc tính viết tắt {{cssxref("text-decoration")}}.
- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Các thuộc tính liên quan đến màu sắc khác: {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}, {{cssxref("caret-color")}} và {{cssxref("column-rule-color")}}
