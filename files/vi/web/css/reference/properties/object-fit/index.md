---
title: object-fit
slug: Web/CSS/Reference/Properties/object-fit
page-type: css-property
browser-compat: css.properties.object-fit
sidebar: cssref
---

Thuộc tính **`object-fit`** [CSS](/en-US/docs/Web/CSS) xác định cách nội dung của {{ glossary("replaced elements", "phần tử thay thế")}}, chẳng hạn như {{HTMLElement("img")}} hay {{HTMLElement("video")}}, được thay đổi kích thước để vừa với khung chứa của nó.

> [!NOTE]
> Thuộc tính `object-fit` không có hiệu lực với các phần tử {{HTMLElement("iframe")}}, {{HTMLElement("embed")}}, và {{HTMLElement("fencedframe")}}.

Bạn có thể thay đổi căn chỉnh của đối tượng nội dung của phần tử thay thế trong hộp của phần tử bằng cách sử dụng thuộc tính {{cssxref("object-position")}}.

{{InteractiveExample("CSS Demo: object-fit")}}

```css interactive-example-choice
object-fit: fill;
```

```css interactive-example-choice
object-fit: contain;
```

```css interactive-example-choice
object-fit: cover;
```

```css interactive-example-choice
object-fit: none;
```

```css interactive-example-choice
object-fit: scale-down;
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/plumeria-146x200.jpg" />
</section>
```

```css interactive-example
#example-element {
  height: 100%;
  width: 100%;
  border: 2px dotted #888888;
}
```

## Cú pháp

```css
object-fit: contain;
object-fit: cover;
object-fit: fill;
object-fit: none;
object-fit: scale-down;

/* Giá trị toàn cục */
object-fit: inherit;
object-fit: initial;
object-fit: revert;
object-fit: revert-layer;
object-fit: unset;
```

Thuộc tính `object-fit` được chỉ định là một từ khóa đơn được chọn từ danh sách các giá trị bên dưới.

### Giá trị

- `contain`
  - : Nội dung thay thế được thu phóng để duy trì {{glossary("aspect ratio", "tỉ lệ khung hình")}} của nó trong khi vừa với hộp nội dung của phần tử. Toàn bộ đối tượng được lấp đầy hộp, trong khi vẫn giữ nguyên tỉ lệ khung hình, vì vậy đối tượng sẽ có [thanh đen trên dưới](<https://en.wikipedia.org/wiki/Letterboxing_(filming)>) hoặc [thanh đen hai bên](https://en.wikipedia.org/wiki/Pillarbox) nếu tỉ lệ khung hình của nó không khớp với tỉ lệ khung hình của hộp.
- `cover`
  - : Nội dung thay thế được thu phóng để duy trì tỉ lệ khung hình trong khi lấp đầy toàn bộ hộp nội dung của phần tử. Nếu tỉ lệ khung hình của đối tượng không khớp với tỉ lệ khung hình của hộp, đối tượng sẽ bị cắt xén để vừa.
- `fill`
  - : Nội dung thay thế được thu phóng để lấp đầy hộp nội dung của phần tử. Đây là giá trị {{cssxref("initial", "ban đầu")}}. Toàn bộ đối tượng sẽ lấp đầy hoàn toàn hộp. Nếu {{glossary("aspect ratio", "tỉ lệ khung hình")}} của đối tượng không khớp với tỉ lệ khung hình của hộp, đối tượng sẽ bị kéo giãn để vừa.
- `none`
  - : Nội dung thay thế không được thay đổi kích thước.
- `scale-down`
  - : Nội dung được thu phóng như thể `none` hoặc `contain` được chỉ định, tùy theo giá trị nào cho kết quả kích thước đối tượng cụ thể nhỏ hơn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập object-fit cho hình ảnh

#### HTML

```html
<section>
  <h2>object-fit: fill</h2>
  <img class="fill" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <img class="fill narrow" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <h2>object-fit: contain</h2>
  <img class="contain" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <img class="contain narrow" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <h2>object-fit: cover</h2>
  <img class="cover" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <img class="cover narrow" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <h2>object-fit: none</h2>
  <img class="none" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <img class="none narrow" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <h2>object-fit: scale-down</h2>
  <img class="scale-down" src="mdn_logo_only_color.png" alt="MDN Logo" />

  <img class="scale-down narrow" src="mdn_logo_only_color.png" alt="MDN Logo" />
</section>
```

#### CSS

```css
h2 {
  font-family: "Courier New", monospace;
  font-size: 1em;
  margin: 1em 0 0.3em;
}

img {
  width: 150px;
  height: 100px;
  border: 1px solid black;
  margin: 10px 0;
}

.narrow {
  width: 100px;
  height: 150px;
}

.fill {
  object-fit: fill;
}

.contain {
  object-fit: contain;
}

.cover {
  object-fit: cover;
}

.none {
  object-fit: none;
}

.scale-down {
  object-fit: scale-down;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_object-fit_for_an_image', 500, 1100) }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến hình ảnh khác: {{cssxref("object-position")}}, {{cssxref("image-orientation")}}, {{cssxref("image-rendering")}}, {{cssxref("image-resolution")}}.
- {{cssxref("background-size")}}
- [Hiểu về tỉ lệ khung hình](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
