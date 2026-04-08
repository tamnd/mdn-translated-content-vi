---
title: font-variant-ligatures
slug: Web/CSS/Reference/Properties/font-variant-ligatures
page-type: css-property
browser-compat: css.properties.font-variant-ligatures
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-variant-ligatures`** kiểm soát các {{Glossary("ligature", "chữ ghép")}} và {{Glossary("contextual forms", "dạng ngữ cảnh")}} nào được sử dụng trong nội dung văn bản của các phần tử mà nó áp dụng. Điều này dẫn đến các dạng hài hòa hơn trong văn bản kết quả.

{{InteractiveExample("CSS Demo: font-variant-ligatures")}}

```css interactive-example-choice
font-variant-ligatures: normal;
```

```css interactive-example-choice
font-variant-ligatures: no-common-ligatures;
```

```css interactive-example-choice
font-variant-ligatures: common-ligatures;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>Difficult waffles</p>
  </div>
</section>
```

```css interactive-example
@font-face {
  font-family: "Fira Sans";
  src:
    local("FiraSans-Regular"),
    url("/shared-assets/fonts/FiraSans-Regular.woff2") format("woff2");
  font-weight: normal;
  font-style: normal;
}

section {
  font-family: "Fira Sans", sans-serif;
  margin-top: 10px;
  font-size: 1.5em;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
font-variant-ligatures: normal;
font-variant-ligatures: none;
font-variant-ligatures: common-ligatures; /* <common-lig-values> */
font-variant-ligatures: no-common-ligatures; /* <common-lig-values> */
font-variant-ligatures: discretionary-ligatures; /* <discretionary-lig-values> */
font-variant-ligatures: no-discretionary-ligatures; /* <discretionary-lig-values> */
font-variant-ligatures: historical-ligatures; /* <historical-lig-values> */
font-variant-ligatures: no-historical-ligatures; /* <historical-lig-values> */
font-variant-ligatures: contextual; /* <contextual-alt-values> */
font-variant-ligatures: no-contextual; /* <contextual-alt-values> */

/* Hai giá trị từ khóa */
font-variant-ligatures: no-contextual common-ligatures;

/* Bốn giá trị từ khóa */
font-variant-ligatures: common-ligatures no-discretionary-ligatures
  historical-ligatures contextual;

/* Giá trị toàn cục */
font-variant-ligatures: inherit;
font-variant-ligatures: initial;
font-variant-ligatures: revert;
font-variant-ligatures: revert-layer;
font-variant-ligatures: unset;
```

Thuộc tính `font-variant-ligatures` được chỉ định là `normal`, `none`, hoặc một hoặc nhiều loại giá trị khác được liệt kê bên dưới. Các giá trị nhiều được phân tách bằng dấu cách.

### Giá trị

- `normal`
  - : Từ khóa này kích hoạt các chữ ghép thông thường và các dạng ngữ cảnh cần thiết để hiển thị chính xác. Các chữ ghép và dạng được kích hoạt phụ thuộc vào phông chữ, ngôn ngữ và loại chữ viết. Đây là giá trị mặc định.
- `none`
  - : Từ khóa này chỉ định rằng tất cả các chữ ghép và dạng ngữ cảnh đều bị vô hiệu hóa, kể cả các chữ ghép thông thường.
- _`<common-lig-values>`_
  - : Các giá trị này kiểm soát các chữ ghép phổ biến nhất, như `fi`, `ffi`, `th`, hoặc tương tự. Chúng tương ứng với các giá trị OpenType `liga` và `clig`. Có hai giá trị có thể:
    - `common-ligatures` kích hoạt các chữ ghép này. Lưu ý rằng từ khóa `normal` kích hoạt các chữ ghép này.
    - `no-common-ligatures` hủy kích hoạt các chữ ghép này.

- _`<discretionary-lig-values>`_
  - : Các giá trị này kiểm soát các chữ ghép cụ thể, đặc trưng cho phông chữ và được xác định bởi nhà thiết kế kiểu chữ. Chúng tương ứng với các giá trị OpenType `dlig`. Có hai giá trị có thể:
    - `discretionary-ligatures` kích hoạt các chữ ghép này.
    - `no-discretionary-ligatures` hủy kích hoạt các chữ ghép. Lưu ý rằng từ khóa `normal` thường hủy kích hoạt các chữ ghép này.

- _`<historical-lig-values>`_
  - : Các giá trị này kiểm soát các chữ ghép được sử dụng trong lịch sử, trong các sách cũ, như chữ ghép tz tiếng Đức được hiển thị là ꜩ. Chúng tương ứng với các giá trị OpenType `hlig`. Có hai giá trị có thể:
    - `historical-ligatures` kích hoạt các chữ ghép này.
    - `no-historical-ligatures` hủy kích hoạt các chữ ghép. Lưu ý rằng từ khóa `normal` thường hủy kích hoạt các chữ ghép này.

- _`<contextual-alt-values>`_
  - : Các giá trị này kiểm soát liệu các chữ cái có thích nghi với ngữ cảnh của chúng hay không — tức là, liệu chúng có thích nghi với các chữ cái xung quanh hay không. Các giá trị này tương ứng với các giá trị OpenType `calt`. Có hai giá trị có thể:
    - `contextual` chỉ định rằng các biến thể ngữ cảnh sẽ được sử dụng. Lưu ý rằng từ khóa `normal` thường cũng kích hoạt các chữ ghép này.
    - `no-contextual` ngăn không cho sử dụng chúng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt chữ ghép và dạng ngữ cảnh phông chữ

#### HTML

```html
<link href="//fonts.googleapis.com/css?family=Lora" rel="stylesheet" />
<p class="normal">
  normal<br />
  if fi ff tf ft jf fj
</p>
<p class="none">
  none<br />
  if fi ff tf ft jf fj
</p>
<p class="common-ligatures">
  common-ligatures<br />
  if fi ff tf ft jf fj
</p>
<p class="no-common-ligatures">
  no-common-ligatures<br />
  if fi ff tf ft jf fj
</p>
<p class="discretionary-ligatures">
  discretionary-ligatures<br />
  if fi ff tf ft jf fj
</p>
<p class="no-discretionary-ligatures">
  no-discretionary-ligatures<br />
  if fi ff tf ft jf fj
</p>
<p class="historical-ligatures">
  historical-ligatures<br />
  if fi ff tf ft jf fj
</p>
<p class="no-historical-ligatures">
  no-historical-ligatures<br />
  if fi ff tf ft jf fj
</p>
<p class="contextual">
  contextual<br />
  if fi ff tf ft jf fj
</p>
<p class="no-contextual">
  no-contextual<br />
  if fi ff tf ft jf fj
</p>
```

#### CSS

```css
p {
  font-family: "Lora", serif;
}
.normal {
  font-variant-ligatures: normal;
}

.none {
  font-variant-ligatures: none;
}

.common-ligatures {
  font-variant-ligatures: common-ligatures;
}

.no-common-ligatures {
  font-variant-ligatures: no-common-ligatures;
}

.discretionary-ligatures {
  font-variant-ligatures: discretionary-ligatures;
}

.no-discretionary-ligatures {
  font-variant-ligatures: no-discretionary-ligatures;
}

.historical-ligatures {
  font-variant-ligatures: historical-ligatures;
}

.no-historical-ligatures {
  font-variant-ligatures: no-historical-ligatures;
}

.contextual {
  font-variant-ligatures: contextual;
}

.no-contextual {
  font-variant-ligatures: no-contextual;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting font ligatures and contextual forms', '', '700') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-numeric")}}
- {{cssxref("font-variant-position")}}
- [CSS fonts module](/en-US/docs/Web/CSS/Guides/Fonts)
