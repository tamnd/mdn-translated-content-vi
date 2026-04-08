---
title: resize
slug: Web/CSS/Reference/Properties/resize
page-type: css-property
browser-compat: css.properties.resize
sidebar: cssref
---

Thuộc tính **`resize`** của [CSS](/vi/docs/Web/CSS) đặt xem một phần tử có thể thay đổi kích thước hay không, và nếu có thì theo hướng nào.

{{InteractiveExample("CSS Demo: resize")}}

```css interactive-example-choice
resize: both;
```

```css interactive-example-choice
resize: horizontal;
```

```css interactive-example-choice
resize: vertical;
```

```css interactive-example-choice
resize: none;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">Try resizing this element.</div>
</section>
```

```css interactive-example
#example-element {
  background: linear-gradient(135deg, cyan 0%, cyan 94%, white 95%);
  border: 3px solid #c5c5c5;
  overflow: auto;
  width: 250px;
  height: 250px;
  font-weight: bold;
  color: black;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
}
```

`resize` không áp dụng cho những phần tử sau:

- Phần tử inline
- Phần tử block có thuộc tính {{cssxref("overflow")}} được đặt thành `visible` hoặc `clip`

## Cú pháp

```css
/* Giá trị từ khóa */
resize: none;
resize: both;
resize: horizontal;
resize: vertical;
resize: block;
resize: inline;

/* Giá trị toàn cục */
resize: inherit;
resize: initial;
resize: revert;
resize: revert-layer;
resize: unset;
```

Thuộc tính `resize` được chỉ định bằng một giá trị từ khóa từ danh sách dưới đây.

### Giá trị

- `none`
  - : Phần tử không cung cấp phương thức nào để người dùng thay đổi kích thước.
- `both`
  - : Phần tử hiển thị cơ chế cho phép người dùng thay đổi kích thước cả theo chiều ngang lẫn chiều dọc.
- `horizontal`
  - : Phần tử hiển thị cơ chế cho phép người dùng thay đổi kích thước theo chiều _ngang_.
- `vertical`
  - : Phần tử hiển thị cơ chế cho phép người dùng thay đổi kích thước theo chiều _dọc_.
- `block`
  - : Phần tử hiển thị cơ chế cho phép người dùng thay đổi kích thước theo hướng _block_ (ngang hoặc dọc tùy thuộc vào giá trị {{cssxref("writing-mode")}} và {{cssxref("direction")}}).
- `inline`
  - : Phần tử hiển thị cơ chế cho phép người dùng thay đổi kích thước theo hướng _inline_ (ngang hoặc dọc tùy thuộc vào giá trị {{cssxref("writing-mode")}} và {{cssxref("direction")}}).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tắt khả năng thay đổi kích thước của text area

Trong nhiều trình duyệt, các phần tử {{HTMLElement("textarea")}} có thể thay đổi kích thước theo mặc định. Bạn có thể ghi đè hành vi này bằng thuộc tính `resize`.

#### HTML

```html
<textarea>Type some text here.</textarea>
```

#### CSS

```css
textarea {
  resize: none; /* Tắt khả năng thay đổi kích thước */
}
```

#### Kết quả

{{EmbedLiveSample("Disabling_resizability_of_text_areas","200","100")}}

### Sử dụng resize với các phần tử tùy ý

Bạn có thể dùng thuộc tính `resize` để làm cho bất kỳ phần tử nào có thể thay đổi kích thước. Trong ví dụ dưới đây, một {{HTMLElement("div")}} có thể thay đổi kích thước chứa một đoạn văn bản có thể thay đổi kích thước (phần tử {{HTMLElement("p")}}).

#### HTML

```html
<div class="resizable">
  <p class="resizable">
    This paragraph is resizable in all directions, because the CSS `resize`
    property is set to `both` on this element.
  </p>
</div>
```

#### CSS

```css
.resizable {
  resize: both;
  overflow: scroll;
  border: 1px solid black;
}

div {
  height: 300px;
  width: 300px;
}

p {
  height: 200px;
  width: 200px;
}
```

#### Kết quả

{{EmbedLiveSample("Using_resize_with_arbitrary_elements","450","450")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
