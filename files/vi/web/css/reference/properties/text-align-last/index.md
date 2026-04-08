---
title: text-align-last
slug: Web/CSS/Reference/Properties/text-align-last
page-type: css-property
browser-compat: css.properties.text-align-last
sidebar: cssref
---

Thuộc tính **`text-align-last`** của [CSS](/vi/docs/Web/CSS) đặt cách căn chỉnh dòng cuối cùng của khối hoặc dòng, ngay trước khi xuống dòng bắt buộc.

{{InteractiveExample("CSS Demo: text-align-last")}}

```css interactive-example-choice
text-align-last: right;
```

```css interactive-example-choice
text-align-last: center;
```

```css interactive-example-choice
text-align-last: left;
```

```html interactive-example
<section id="default-example">
  <div>
    <p id="example-element">
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
      aliquip ex ea commodo consequat.
    </p>
  </div>
</section>
```

```css interactive-example
section {
  font-size: 1.5em;
}

#default-example > div {
  width: 250px;
}

#example-element {
  text-align: justify;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
text-align-last: auto;
text-align-last: start;
text-align-last: end;
text-align-last: left;
text-align-last: right;
text-align-last: center;
text-align-last: justify;

/* Giá trị toàn cục */
text-align-last: inherit;
text-align-last: initial;
text-align-last: revert;
text-align-last: revert-layer;
text-align-last: unset;
```

### Giá trị

- `auto`
  - : Dòng bị ảnh hưởng được căn chỉnh theo giá trị của {{cssxref("text-align")}}, trừ khi {{cssxref("text-align")}} là `justify`, trong trường hợp đó hiệu ứng giống như đặt `text-align-last` thành `start`.
- `start`
  - : Tương tự như `left` nếu hướng là từ trái sang phải và `right` nếu hướng là từ phải sang trái.
- `end`
  - : Tương tự như `right` nếu hướng là từ trái sang phải và `left` nếu hướng là từ phải sang trái.
- `left`
  - : Nội dung nội tuyến được căn chỉnh về cạnh trái của hộp dòng.
- `right`
  - : Nội dung nội tuyến được căn chỉnh về cạnh phải của hộp dòng.
- `center`
  - : Nội dung nội tuyến được căn giữa trong hộp dòng.
- `justify`
  - : Văn bản được căn đều hai bên. Văn bản cần căn chỉnh cạnh trái và phải với cạnh trái và phải của nội dung đoạn văn.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Căn đều dòng cuối

```html hidden
<p>
  Integer elementum massa at nulla placerat varius. Suspendisse in libero risus,
  in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque.
  Nullam est eros, suscipit sed dictum quis, accumsan a ligula.
</p>
```

#### CSS

```css
p {
  font-size: 1.4em;
  text-align: justify;
  text-align-last: center;
}
```

#### Kết quả

{{EmbedLiveSample('Justifying_the_last_line','560')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-align")}}
