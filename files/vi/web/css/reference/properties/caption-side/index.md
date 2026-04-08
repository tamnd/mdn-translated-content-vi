---
title: caption-side
slug: Web/CSS/Reference/Properties/caption-side
page-type: css-property
browser-compat: css.properties.caption-side
sidebar: cssref
---

Thuộc tính **`caption-side`** trong [CSS](/en-US/docs/Web/CSS) đặt nội dung của phần tử {{HTMLElement("caption")}} trong bảng vào phía được chỉ định. Các giá trị có liên quan đến {{cssxref("writing-mode")}} của bảng.

{{InteractiveExample("CSS Demo: caption-side")}}

```css interactive-example-choice
caption-side: top;
```

```css interactive-example-choice
caption-side: bottom;
```

```html interactive-example
<section class="default-example" id="default-example">
  <table class="transition-all" id="example-element">
    <caption>
      Famous animals
    </caption>
    <tbody>
      <tr>
        <th>Name</th>
        <th>Location</th>
      </tr>
      <tr>
        <td>Giraffe</td>
        <td>Africa</td>
      </tr>
      <tr>
        <td>Penguin</td>
        <td>Antarctica</td>
      </tr>
      <tr>
        <td>Sloth</td>
        <td>South America</td>
      </tr>
      <tr>
        <td>Tiger</td>
        <td>Asia</td>
      </tr>
    </tbody>
  </table>
</section>
```

```css interactive-example
table {
  font-size: 1.2rem;
  text-align: left;
  color: black;
}

th,
td {
  padding: 0.2rem 1rem;
}

caption {
  background: #ffcc33;
  padding: 0.5rem 1rem;
}

tr {
  background: #eeeeee;
}

tr:nth-child(even) {
  background: #cccccc;
}
```

## Cú pháp

```css
/* Giá trị theo hướng */
caption-side: top;
caption-side: bottom;

/* Giá trị toàn cục */
caption-side: inherit;
caption-side: initial;
caption-side: revert;
caption-side: revert-layer;
caption-side: unset;
```

Thuộc tính `caption-side` được chỉ định bằng một trong các giá trị từ khóa liệt kê dưới đây.

### Giá trị

- `top`
  - : Hộp caption nên được đặt ở phía đầu khối của bảng.
- `bottom`
  - : Hộp caption nên được đặt ở phía cuối khối của bảng.

> [!NOTE]
> Mô-đun [thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) định nghĩa hai giá trị logic, `inline-start` và `inline-end`, để đặt hộp caption ở cạnh đầu inline và cạnh cuối inline của bảng tương ứng. Các giá trị này hiện không được bất kỳ trình duyệt nào hỗ trợ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt caption ở trên và dưới bảng

#### HTML

```html
<table class="top">
  <caption>
    Caption ABOVE the table
  </caption>
  <tbody>
    <tr>
      <td>Some data</td>
      <td>Some more data</td>
    </tr>
  </tbody>
</table>

<br />

<table class="bottom">
  <caption>
    Caption BELOW the table
  </caption>
  <tbody>
    <tr>
      <td>Some data</td>
      <td>Some more data</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
.top caption {
  caption-side: top;
}

.bottom caption {
  caption-side: bottom;
}

table {
  border: 1px solid red;
}

td {
  border: 1px solid blue;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_captions_above_and_below', 'auto', 160)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLelement("caption")}}
- Mô-đun [CSS table](/en-US/docs/Web/CSS/Guides/Table)
- Mô-đun [thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
