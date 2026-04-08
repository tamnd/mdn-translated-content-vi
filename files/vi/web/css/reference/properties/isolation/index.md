---
title: isolation
slug: Web/CSS/Reference/Properties/isolation
page-type: css-property
browser-compat: css.properties.isolation
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`isolation`** xác định liệu một phần tử có phải tạo một {{glossary("stacking context")}} mới hay không.

{{InteractiveExample("CSS Demo: isolation")}}

```css interactive-example-choice
isolation: auto;
```

```css interactive-example-choice
isolation: isolate;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="background-container">
    <div id="example-element">
      <img src="/shared-assets/images/examples/firefox-logo.svg" />
      <p><code>mix-blend-mode: multiply;</code></p>
    </div>
  </div>
</section>
```

```css interactive-example
.background-container {
  background-color: #f4f460;
  width: 250px;
}

#example-element {
  border: 1px solid black;
  margin: 2em;
}

#example-element * {
  mix-blend-mode: multiply;
  color: #8245a3;
}
```

Thuộc tính này đặc biệt hữu ích khi dùng kết hợp với {{cssxref("mix-blend-mode")}} và {{cssxref("z-index")}}.

## Cú pháp

```css
/* Giá trị từ khóa */
isolation: auto;
isolation: isolate;

/* Giá trị toàn cục */
isolation: inherit;
isolation: initial;
isolation: revert;
isolation: revert-layer;
isolation: unset;
```

Thuộc tính `isolation` được chỉ định là một trong các giá trị từ khóa liệt kê bên dưới.

### Giá trị

- `auto`
  - : Một stacking context mới chỉ được tạo khi một trong các thuộc tính áp dụng cho phần tử yêu cầu điều đó.
- `isolate`
  - : Phải tạo một stacking context mới.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Buộc tạo stacking context mới cho phần tử

#### HTML

```html
<div class="big-square">
  <div class="isolation-auto">
    <div class="small-square">auto</div>
  </div>
  <div class="isolation-isolate">
    <div class="small-square">isolate</div>
  </div>
</div>
```

#### CSS

```css
.isolation-auto {
  isolation: auto;
}

.isolation-isolate {
  isolation: isolate;
}

.big-square {
  background-color: lime;
  width: 200px;
  height: 210px;
}

.small-square {
  background-color: lime;
  width: 100px;
  height: 100px;
  border: 1px solid black;
  padding: 2px;
  mix-blend-mode: difference;
}
```

#### Kết quả

{{ EmbedLiveSample('Forcing_a_new_stacking_context_for_an_element', 230, 230) }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;blend-mode&gt;")}}
- {{cssxref("mix-blend-mode")}}, {{cssxref("background-blend-mode")}}
