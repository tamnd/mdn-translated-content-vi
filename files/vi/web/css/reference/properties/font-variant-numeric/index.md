---
title: font-variant-numeric
slug: Web/CSS/Reference/Properties/font-variant-numeric
page-type: css-property
browser-compat: css.properties.font-variant-numeric
sidebar: cssref
---

Thuộc tính **`font-variant-numeric`** [CSS](/en-US/docs/Web/CSS) kiểm soát việc sử dụng các ký tự thay thế cho số, phân số và ký hiệu thứ tự.

{{InteractiveExample("CSS Demo: font-variant-numeric", "taller")}}

```css interactive-example-choice
font-variant-numeric: normal;
```

```css interactive-example-choice
font-variant-numeric: ordinal;
```

```css interactive-example-choice
font-variant-numeric: slashed-zero;
```

```css interactive-example-choice
font-variant-numeric: tabular-nums;
```

```css interactive-example-choice
font-variant-numeric: oldstyle-nums;
```

```css interactive-example-choice
font-variant-numeric: lining-nums;
```

```css interactive-example-choice
font-variant-numeric: proportional-nums;
```

```css interactive-example-choice
font-variant-numeric: diagonal-fractions;
```

<!-- Source Sans Pro doesn't support stacked-fractions -->

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <table>
      <tbody>
        <tr>
          <td><span class="tabular">0</span></td>
        </tr>
        <tr>
          <td><span class="tabular">3.54</span></td>
        </tr>
        <tr>
          <td><span class="tabular">1.71</span></td>
        </tr>
        <tr>
          <td><span class="tabular">1st</span></td>
        </tr>
        <tr>
          <td><span class="tabular">3/4</span></td>
        </tr>
      </tbody>
    </table>
  </div>
</section>
```

```css interactive-example
@font-face {
  font-family: "Source Sans Pro";
  src:
    local("SourceSansPro-Regular"),
    url("/shared-assets/fonts/SourceSansPro-Regular.otf") format("opentype");
  font-weight: normal;
  font-style: normal;
}

section {
  font-family: "Source Sans Pro", sans-serif;
  margin-top: 10px;
  font-size: 1.5em;
}

#example-element table {
  margin-left: auto;
  margin-right: auto;
}

.tabular {
  border: 1px solid;
}
```

## Cú pháp

```css
font-variant-numeric: normal;
font-variant-numeric: ordinal;
font-variant-numeric: slashed-zero;
font-variant-numeric: lining-nums; /* <numeric-figure-values> */
font-variant-numeric: oldstyle-nums; /* <numeric-figure-values> */
font-variant-numeric: proportional-nums; /* <numeric-spacing-values> */
font-variant-numeric: tabular-nums; /* <numeric-spacing-values> */
font-variant-numeric: diagonal-fractions; /* <numeric-fraction-values> */
font-variant-numeric: stacked-fractions; /* <numeric-fraction-values> */
font-variant-numeric: oldstyle-nums stacked-fractions;

/* Giá trị toàn cục */
font-variant-numeric: inherit;
font-variant-numeric: initial;
font-variant-numeric: revert;
font-variant-numeric: revert-layer;
font-variant-numeric: unset;
```

Thuộc tính này có thể nhận một trong hai dạng:

- từ khóa `normal`
- hoặc một hay nhiều giá trị khác trong danh sách bên dưới, cách nhau bởi khoảng trắng, theo bất kỳ thứ tự nào.

### Giá trị

- `normal`
  - : Từ khóa này tắt việc sử dụng các ký tự thay thế.

- `ordinal`
  - : Từ khóa này buộc sử dụng các ký tự đặc biệt cho ký hiệu thứ tự, ví dụ như 1st, 2nd, 3rd, 4th trong tiếng Anh hoặc 1a trong tiếng Ý. Tương ứng với giá trị OpenType `ordn`.

- `slashed-zero`
  - : Từ khóa này buộc sử dụng số 0 có gạch chéo; hữu ích khi cần phân biệt rõ ràng giữa chữ O và số 0. Tương ứng với giá trị OpenType `zero`.

- _`<numeric-figure-values>`_
  - : Các giá trị này kiểm soát kiểu ký tự số được dùng. Có hai giá trị khả dụng:
    - `lining-nums` kích hoạt bộ ký tự số nằm trên đường cơ sở. Tương ứng với giá trị OpenType `lnum`.
    - `oldstyle-nums` kích hoạt bộ ký tự số kiểu cũ, trong đó một số chữ số như 3, 4, 7, 9 có phần kéo xuống. Tương ứng với giá trị OpenType `onum`.

- _`<numeric-spacing-values>`_
  - : Các giá trị này kiểm soát kích thước của ký tự số. Có hai giá trị khả dụng:
    - `proportional-nums` kích hoạt bộ ký tự số có chiều rộng không đều nhau. Tương ứng với giá trị OpenType `pnum`.
    - `tabular-nums` kích hoạt bộ ký tự số có chiều rộng bằng nhau, giúp căn chỉnh dễ dàng như trong bảng. Tương ứng với giá trị OpenType `tnum`.

- _`<numeric-fraction-values>`_
  - : Các giá trị này kiểm soát ký tự dùng để hiển thị phân số. Có hai giá trị khả dụng:
    - `diagonal-fractions` kích hoạt bộ ký tự phân số trong đó tử số và mẫu số thu nhỏ lại và được ngăn cách bởi dấu gạch chéo. Tương ứng với giá trị OpenType `frac`.
    - `stacked-fractions` kích hoạt bộ ký tự phân số trong đó tử số và mẫu số thu nhỏ, xếp chồng và ngăn cách bởi một đường ngang. Tương ứng với giá trị OpenType `afrc`.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thiết lập dạng số thứ tự

Nhấn "Play" trong các khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___font-variant-numeric-example
<p class="ordinal">1st, 2nd, 3rd, 4th, 5th</p>
```

```css live-sample___font-variant-numeric-example
@font-face {
  font-family: "Source Sans Pro";
  src: url("https://mdn.github.io/shared-assets/fonts/SourceSansPro-Regular.otf")
    format("opentype");
  font-weight: normal;
  font-style: normal;
}

.ordinal {
  font-family: "Source Sans Pro", sans-serif;
  font-size: 2rem;
  font-variant-numeric: ordinal;
}
```

{{EmbedLiveSample("font-variant-numeric-example")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
- {{cssxref("font-variant-alternates")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-position")}}
