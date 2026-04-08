---
title: text-decoration-style
slug: Web/CSS/Reference/Properties/text-decoration-style
page-type: css-property
browser-compat: css.properties.text-decoration-style
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-style`** xác định kiểu của các đường được chỉ định bởi {{ cssxref("text-decoration-line") }}. Kiểu áp dụng cho tất cả các đường được đặt bởi `text-decoration-line`.

{{InteractiveExample("CSS Demo: text-decoration-style")}}

```css interactive-example-choice
text-decoration-style: solid;
```

```css interactive-example-choice
text-decoration-style: double;
```

```css interactive-example-choice
text-decoration-style: dotted;
```

```css interactive-example-choice
text-decoration-style: dashed;
```

```css interactive-example-choice
text-decoration-style: wavy;
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

Nếu trang trí được chỉ định có ý nghĩa ngữ nghĩa cụ thể, chẳng hạn như đường gạch ngang có nghĩa là một số văn bản đã bị xóa, các tác giả được khuyến khích biểu thị ý nghĩa này bằng một thẻ HTML, như {{ HTMLElement("del") }} hay {{ HTMLElement("s") }}. Vì trình duyệt có thể vô hiệu hóa tạo kiểu trong một số trường hợp, ý nghĩa ngữ nghĩa sẽ không biến mất trong tình huống đó.

Khi cần đặt nhiều thuộc tính trang trí đường văn bản cùng một lúc, có thể tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("text-decoration")}} thay thế.

## Cú pháp

```css
/* Giá trị từ khóa */
text-decoration-style: solid;
text-decoration-style: double;
text-decoration-style: dotted;
text-decoration-style: dashed;
text-decoration-style: wavy;

/* Giá trị toàn cục */
text-decoration-style: inherit;
text-decoration-style: initial;
text-decoration-style: revert;
text-decoration-style: revert-layer;
text-decoration-style: unset;
```

### Giá trị

- solid
  - : Vẽ một đường đơn.
- double
  - : Vẽ một đường đôi.
- dotted
  - : Vẽ một đường chấm.
- dashed
  - : Vẽ một đường đứt nét.
- wavy
  - : Vẽ một đường gợn sóng.
- \-moz-none
  - : Không vẽ đường nào. Thay vào đó hãy dùng {{cssxref("text-decoration-line", "text-decoration-line: none")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt đường gạch chân gợn sóng

Ví dụ sau tạo ra một đường gạch chân gợn sóng màu đỏ:

#### CSS

```css
.wavy {
  text-decoration-line: underline;
  text-decoration-style: wavy;
  text-decoration-color: red;
}
```

#### HTML

```html
<p class="wavy">This text has a wavy red line beneath it.</p>
```

#### Kết quả

{{EmbedLiveSample('Setting_a_wavy_underline')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Khi cần đặt nhiều thuộc tính trang trí đường văn bản cùng một lúc, có thể tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("text-decoration")}} thay thế.
- {{cssxref("text-decoration-line")}}
- {{cssxref("text-decoration-color")}}
- {{cssxref("text-decoration-thickness")}}
- {{cssxref("text-underline-offset")}}
