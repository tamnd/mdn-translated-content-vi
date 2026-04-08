---
title: text-orientation
slug: Web/CSS/Reference/Properties/text-orientation
page-type: css-property
browser-compat: css.properties.text-orientation
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`text-orientation`** xác định hướng của các ký tự văn bản trong một dòng. Nó chỉ ảnh hưởng đến văn bản ở chế độ dọc (khi {{cssxref("writing-mode")}} không phải là `horizontal-tb`). Nó hữu ích để kiểm soát việc hiển thị các ngôn ngữ sử dụng chữ viết dọc, và cũng để tạo tiêu đề bảng dọc.

{{InteractiveExample("CSS Demo: text-orientation")}}

```css interactive-example-choice
writing-mode: vertical-rl;
text-orientation: mixed;
```

```css interactive-example-choice
writing-mode: vertical-rl;
text-orientation: upright;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <p>
      In another moment down went Alice after it, never once considering how in
      the world she was to get out again.
    </p>
  </div>
</section>
```

## Cú pháp

```css
/* Giá trị từ khóa */
text-orientation: mixed;
text-orientation: upright;
text-orientation: sideways-right;
text-orientation: sideways;
text-orientation: use-glyph-orientation;

/* Giá trị toàn cục */
text-orientation: inherit;
text-orientation: initial;
text-orientation: revert;
text-orientation: revert-layer;
text-orientation: unset;
```

Thuộc tính `text-orientation` được chỉ định là một từ khóa duy nhất từ danh sách bên dưới.

### Giá trị

- `mixed`
  - : Xoay các ký tự của chữ viết ngang 90° theo chiều kim đồng hồ. Bố trí các ký tự của chữ viết dọc một cách tự nhiên. Giá trị mặc định.
- `upright`
  - : Bố trí các ký tự của chữ viết ngang một cách tự nhiên (thẳng đứng), cũng như các ký tự cho chữ viết dọc. Lưu ý rằng từ khóa này khiến tất cả các ký tự được coi là từ trái sang phải: giá trị được sử dụng của {{cssxref("direction")}} bị buộc là `ltr`.
- `sideways`
  - : Khiến các ký tự được bố trí như thể chúng nằm ngang, nhưng toàn bộ dòng được xoay 90° theo chiều kim đồng hồ.
- `sideways-right`
  - : Bí danh cho `sideways` được giữ lại vì mục đích tương thích.
- `use-glyph-orientation`
  - : Trên các phần tử SVG, từ khóa này dẫn đến việc sử dụng giá trị của các thuộc tính SVG không còn dùng nữa `glyph-orientation-vertical` và `glyph-orientation-horizontal`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<p>Lorem ipsum dolet semper quisquam.</p>
```

### CSS

```css
p {
  writing-mode: vertical-rl;
  text-orientation: upright;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến chữ viết dọc: {{cssxref("writing-mode")}}, {{cssxref("text-combine-upright")}}, và {{cssxref("unicode-bidi")}}.
- [Thuộc tính logic CSS](/vi/docs/Web/CSS/Guides/Logical_properties_and_values)
- [Định dạng văn bản dọc (Trung Quốc, Nhật Bản, Hàn Quốc và Mông Cổ)](https://www.w3.org/International/articles/vertical-text/)
- Kết quả kiểm tra hỗ trợ trình duyệt mở rộng: <https://w3c.github.io/i18n-tests/results/horizontal-in-vertical.html#text_orientation>
