---
title: border-spacing
slug: Web/CSS/Reference/Properties/border-spacing
page-type: css-property
browser-compat: css.properties.border-spacing
sidebar: cssref
---

Thuộc tính **`border-spacing`** trong [CSS](/en-US/docs/Web/CSS) đặt khoảng cách giữa các đường viền của các ô liền kề trong một {{htmlelement("table")}}. Thuộc tính này chỉ áp dụng khi {{cssxref("border-collapse")}} có giá trị là `separate`.

{{InteractiveExample("CSS Demo: border-spacing")}}

```css interactive-example-choice
border-spacing: 0;
```

```css interactive-example-choice
border-spacing: 5px;
```

```css interactive-example-choice
border-spacing: 5px 1rem;
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
  border-color: crimson dodgerblue;
  padding: 0.75rem;
}
```

## Cú pháp

```css
/* <length> */
border-spacing: 2px;

/* horizontal <length> | vertical <length> */
border-spacing: 1cm 2em;

/* Giá trị toàn cục */
border-spacing: inherit;
border-spacing: initial;
border-spacing: revert;
border-spacing: revert-layer;
border-spacing: unset;
```

Thuộc tính `border-spacing` có thể được chỉ định với một hoặc hai giá trị.

- Khi chỉ định **một** giá trị `<length>`, nó định nghĩa cả khoảng cách ngang và dọc giữa các ô.
- Khi chỉ định **hai** giá trị `<length>`, giá trị đầu tiên định nghĩa khoảng cách ngang giữa các ô (tức là khoảng cách giữa các ô trong các _cột_ liền kề), và giá trị thứ hai định nghĩa khoảng cách dọc giữa các ô (tức là khoảng cách giữa các ô trong các _hàng_ liền kề).

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của khoảng cách dưới dạng giá trị cố định.

## Mô tả

Giá trị `border-spacing` cũng được dùng dọc theo cạnh ngoài của bảng, trong đó khoảng cách giữa đường viền bảng và các ô trong cột/hàng đầu tiên hoặc cuối cùng là tổng của `border-spacing` tương ứng (ngang hoặc dọc) và giá trị {{cssxref("padding")}} tương ứng (trên, phải, dưới, hoặc trái) của bảng.

> [!NOTE]
> Thuộc tính `border-spacing` tương đương với thuộc tính `cellspacing` đã lỗi thời của phần tử `<table>`, ngoại trừ việc `border-spacing` có thêm giá trị tùy chọn thứ hai để đặt khoảng cách ngang và dọc khác nhau.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Khoảng cách và phần đệm của ô bảng

Ví dụ này áp dụng khoảng cách `.5em` theo chiều dọc và `1em` theo chiều ngang giữa các ô của bảng. Lưu ý rằng dọc theo các cạnh ngoài, các giá trị `padding` của bảng được cộng vào các giá trị `border-spacing` của nó.

#### HTML

```html
<table>
  <tbody>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <td>4</td>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <td>7</td>
      <td>8</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  border-spacing: 1em 0.5em;
  padding: 0 2em 1em 0;
  border: 1px solid orange;
}

td {
  width: 1.5em;
  height: 1.5em;
  background: #d2d2d2;
  text-align: center;
  vertical-align: middle;
}
```

#### Kết quả

{{ EmbedLiveSample('Spacing_and_padding_table_cells', 400, 200) }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border-collapse")}}, {{cssxref("border-style")}}
- Thuộc tính `border-spacing` thay đổi giao diện của phần tử HTML {{htmlelement("table")}}.
- Module [CSS table](/en-US/docs/Web/CSS/Guides/Table)
