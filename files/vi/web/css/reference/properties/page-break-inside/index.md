---
title: page-break-inside
slug: Web/CSS/Reference/Properties/page-break-inside
page-type: css-property
status:
  - deprecated
browser-compat: css.properties.page-break-inside
sidebar: cssref
---

{{deprecated_header}}

> [!WARNING]
> Thuộc tính này đã được thay thế bởi thuộc tính {{cssxref("break-inside")}}.

Thuộc tính **`page-break-inside`** [CSS](/en-US/docs/Web/CSS) điều chỉnh các ngắt trang _bên trong_ phần tử hiện tại.

{{InteractiveExample("CSS Demo: page-break-inside")}}

```css interactive-example-choice
page-break-inside: auto;
```

```css interactive-example-choice
page-break-inside: avoid;
```

```html interactive-example
<div>
  <p>
    The effect of this property can be noticed when the document is being
    printed or a preview of a print is displayed.
  </p>
  <button id="print-btn">Show Print Preview</button>
  <div class="box-container">
    <div class="box">Content before the property</div>
    <div class="box" id="example-element">Content with 'page-break-inside'</div>
    <div class="box">Content after the property</div>
  </div>
</div>
```

```css interactive-example
.box {
  border: solid #5b6dcd 5px;
  background-color: #5b6dcd;
  margin: 10px 0;
  padding: 5px;
}

#example-element {
  border: solid 5px #ffc129;
  background-color: #ffc129;
  color: black;
}

@media print {
  #example-element {
    height: 25cm;
  }
}
```

```js interactive-example
const btn = document.getElementById("print-btn");

btn.addEventListener("click", () => {
  window.print();
});
```

## Cú pháp

```css
/* Giá trị từ khóa */
page-break-inside: auto;
page-break-inside: avoid;

/* Giá trị toàn cục */
page-break-inside: inherit;
page-break-inside: initial;
page-break-inside: revert;
page-break-inside: revert-layer;
page-break-inside: unset;
```

### Giá trị

- `auto`
  - : Giá trị khởi tạo. Ngắt trang tự động (không bị ép buộc cũng không bị cấm).
- `avoid`
  - : Tránh ngắt trang bên trong phần tử.

## Bí danh ngắt trang

Thuộc tính `page-break-inside` hiện là thuộc tính kế thừa, được thay thế bởi {{cssxref("break-inside")}}.

Để tương thích, `page-break-inside` nên được trình duyệt coi là bí danh của `break-inside`. Điều này đảm bảo rằng các trang web sử dụng `page-break-inside` tiếp tục hoạt động như thiết kế. Một tập hợp con các giá trị nên được đặt bí danh như sau:

| page-break-inside | break-inside |
| ----------------- | ------------ |
| `auto`            | `auto`       |
| `avoid`           | `avoid`      |

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tránh ngắt trang bên trong các phần tử

#### HTML

```html
<div class="page">
  <p>This is the first paragraph.</p>
  <section class="list">
    <span>A list</span>
    <ol>
      <li>one</li>
      <!-- <li>two</li> -->
    </ol>
  </section>
  <ul>
    <li>one</li>
    <!-- <li>two</li> -->
  </ul>
  <p>This is the second paragraph.</p>
  <p>This is the third paragraph, it contains more text.</p>
  <p>
    This is the fourth paragraph. It has a little bit more text than the third
    one.
  </p>
</div>
```

#### CSS

```css
.page {
  background-color: #8cffa0;
  height: 90px;
  width: 200px;
  columns: 1;
  column-width: 100px;
}

.list,
ol,
ul,
p {
  break-inside: avoid;
}

p {
  background-color: #8ca0ff;
}

ol,
ul,
.list {
  margin: 0.5em 0;
  display: block;
  background-color: orange;
}

p:first-child {
  margin-top: 0;
}
```

#### Kết quả

{{EmbedLiveSample("Avoiding_page_breaks_inside_elements", 400, 160)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("break-before")}}, {{cssxref("break-after")}}, {{cssxref("break-inside")}}
- {{cssxref("page-break-after")}}, {{cssxref("page-break-before")}}
- {{cssxref("orphans")}}, {{cssxref("widows")}}
