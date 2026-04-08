---
title: border-collapse
slug: Web/CSS/Reference/Properties/border-collapse
page-type: css-property
browser-compat: css.properties.border-collapse
sidebar: cssref
---

Thuộc tính **`border-collapse`** trong [CSS](/en-US/docs/Web/CSS) xác định xem các ô trong {{htmlElement("table")}} có dùng chung đường viền hay có đường viền riêng.

Khi các ô được thu gọn, giá trị `inset` của {{cssxref("border-style")}} sẽ hoạt động như `ridge`, và `outset` hoạt động như `groove`.

Khi các ô được tách biệt, khoảng cách giữa các ô được xác định bởi thuộc tính {{cssxref("border-spacing")}}.

{{InteractiveExample("CSS Demo: border-collapse")}}

```css interactive-example-choice
border-collapse: collapse;
```

```css interactive-example-choice
border-collapse: separate;
```

```html interactive-example
<section class="default-example" id="default-example">
  <table class="transition-all" id="example-element">
    <tbody>
      <tr>
        <td>Cell 1.1</td>
        <td>Cell 1.2</td>
      </tr>
      <tr>
        <td>Cell 2.1</td>
        <td>Cell 2.2</td>
      </tr>
      <tr>
        <td>Cell 3.1</td>
        <td>Cell 3.2</td>
      </tr>
    </tbody>
  </table>
</section>
```

```css interactive-example
table {
  width: 15rem;
  table-layout: fixed;
}

td {
  border: 5px solid;
  border-color: crimson dodgerblue orange limegreen;
  padding: 0.75rem;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
border-collapse: collapse;
border-collapse: separate;

/* Giá trị toàn cục */
border-collapse: inherit;
border-collapse: initial;
border-collapse: revert;
border-collapse: revert-layer;
border-collapse: unset;
```

Thuộc tính `border-collapse` được chỉ định bằng một từ khóa duy nhất, có thể chọn từ danh sách bên dưới.

### Giá trị

- `collapse`
  - : Các ô liền kề dùng chung đường viền (mô hình hiển thị bảng với đường viền thu gọn).
- `separate`
  - : Các ô liền kề có đường viền riêng biệt (mô hình hiển thị bảng với đường viền tách biệt).

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bảng màu sắc về các trình duyệt

#### HTML

```html
<table class="separate">
  <caption>
    <code>border-collapse: separate</code>
  </caption>
  <tbody>
    <tr>
      <th>Browser</th>
      <th>Layout Engine</th>
    </tr>
    <tr>
      <td class="fx">Firefox</td>
      <td class="gk">Gecko</td>
    </tr>
    <tr>
      <td class="ed">Edge</td>
      <td class="tr">EdgeHTML</td>
    </tr>
    <tr>
      <td class="sa">Safari</td>
      <td class="wk">WebKit</td>
    </tr>
    <tr>
      <td class="ch">Chrome</td>
      <td class="bk">Blink</td>
    </tr>
    <tr>
      <td class="op">Opera</td>
      <td class="bk">Blink</td>
    </tr>
  </tbody>
</table>
<table class="collapse">
  <caption>
    <code>border-collapse: collapse</code>
  </caption>
  <tbody>
    <tr>
      <th>Browser</th>
      <th>Layout Engine</th>
    </tr>
    <tr>
      <td class="fx">Firefox</td>
      <td class="gk">Gecko</td>
    </tr>
    <tr>
      <td class="ed">Edge</td>
      <td class="tr">EdgeHTML</td>
    </tr>
    <tr>
      <td class="sa">Safari</td>
      <td class="wk">WebKit</td>
    </tr>
    <tr>
      <td class="ch">Chrome</td>
      <td class="bk">Blink</td>
    </tr>
    <tr>
      <td class="op">Opera</td>
      <td class="bk">Blink</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
.collapse {
  border-collapse: collapse;
}

.separate {
  border-collapse: separate;
}

table {
  display: inline-table;
  margin: 1em;
  border: dashed 5px;
}

table th,
table td {
  border: solid 3px;
}

.fx {
  border-color: orange blue;
}
.gk {
  border-color: black red;
}
.ed {
  border-color: blue gold;
}
.tr {
  border-color: aqua;
}
.sa {
  border-color: silver blue;
}
.wk {
  border-color: gold blue;
}
.ch {
  border-color: red yellow green blue;
}
.bk {
  border-color: navy blue teal aqua;
}
.op {
  border-color: red;
}
```

#### Kết quả

{{ EmbedLiveSample('A_colorful_table_of_browser_engines', 400, 300) }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border-spacing")}}, {{cssxref("border-style")}}
- Thuộc tính `border-collapse` thay đổi giao diện của phần tử HTML {{htmlelement("table")}}.
- Module [CSS table](/en-US/docs/Web/CSS/Guides/Table)
