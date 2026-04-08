---
title: empty-cells
slug: Web/CSS/Reference/Properties/empty-cells
page-type: css-property
browser-compat: css.properties.empty-cells
sidebar: cssref
---

Thuộc tính **`empty-cells`** trong [CSS](/vi/docs/Web/CSS) xác định xem đường viền và nền có hiển thị xung quanh các ô {{htmlelement("table")}} không có nội dung hiển thị hay không.

Thuộc tính này chỉ có hiệu lực khi thuộc tính {{cssxref("border-collapse")}} có giá trị là `separate`.

{{InteractiveExample("CSS Demo: empty-cells")}}

```css interactive-example-choice
empty-cells: show;
```

```css interactive-example-choice
empty-cells: hide;
```

```html interactive-example
<section class="default-example" id="default-example">
  <table class="transition-all" id="example-element">
    <tbody>
      <tr>
        <th>Client Name</th>
        <th>Age</th>
      </tr>
      <tr>
        <td></td>
        <td>25</td>
      </tr>
      <tr>
        <td>Louise Q.</td>
        <td></td>
      </tr>
      <tr>
        <td>Owen B.</td>
        <td></td>
      </tr>
      <tr>
        <td>Stan L.</td>
        <td>71</td>
      </tr>
    </tbody>
  </table>
</section>
```

```css interactive-example
th,
td {
  border: 2px solid #aa1199;
  padding: 0.25rem 0.5rem;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
empty-cells: show;
empty-cells: hide;

/* Giá trị toàn cục */
empty-cells: inherit;
empty-cells: initial;
empty-cells: revert;
empty-cells: revert-layer;
empty-cells: unset;
```

Thuộc tính `empty-cells` được chỉ định bằng một trong các giá trị từ khóa dưới đây.

### Giá trị

- `show`
  - : Đường viền và nền được vẽ giống như ở các ô bình thường.
- `hide`
  - : Không vẽ đường viền hoặc nền.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Hiển thị và ẩn các ô bảng trống

#### HTML

```html
<table class="table_1">
  <tbody>
    <tr>
      <td>Moe</td>
      <td>Larry</td>
    </tr>
    <tr>
      <td>Curly</td>
      <td></td>
    </tr>
  </tbody>
</table>
<br />
<table class="table_2">
  <tbody>
    <tr>
      <td>Moe</td>
      <td>Larry</td>
    </tr>
    <tr>
      <td>Curly</td>
      <td></td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
.table_1 {
  empty-cells: show;
}

.table_2 {
  empty-cells: hide;
}

td,
th {
  border: 1px solid gray;
  padding: 0.5rem;
}
```

#### Kết quả

{{ EmbedLiveSample('Showing_and_hiding_empty_table_cells', '100%', '200') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border-collapse")}}
- [Học: Tạo kiểu bảng](/vi/docs/Learn_web_development/Core/Styling_basics/Tables)
- Mô-đun [bảng CSS](/vi/docs/Web/CSS/Guides/Table)
