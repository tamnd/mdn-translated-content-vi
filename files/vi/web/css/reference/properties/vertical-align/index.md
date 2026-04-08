---
title: vertical-align
slug: Web/CSS/Reference/Properties/vertical-align
page-type: css-shorthand-property
browser-compat: css.properties.vertical-align
sidebar: cssref
---

Thuộc tính viết tắt **`vertical-align`** của [CSS](/vi/docs/Web/CSS) đặt căn chỉnh theo chiều dọc của một hộp nội tuyến, nội tuyến-khối hoặc ô bảng.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("alignment-baseline")}}
- {{cssxref("baseline-source")}}
- {{cssxref("baseline-shift")}}

{{InteractiveExample("CSS Demo: vertical-align")}}

```css interactive-example-choice
vertical-align: baseline;
```

```css interactive-example-choice
vertical-align: top;
```

```css interactive-example-choice
vertical-align: middle;
```

```css interactive-example-choice
vertical-align: bottom;
```

```css interactive-example-choice
vertical-align: sub;
```

```css interactive-example-choice
vertical-align: text-top;
```

```html interactive-example
<section class="default-example" id="default-example">
  <p>
    Align the star:
    <img id="example-element" src="/shared-assets/images/examples/star2.png" />
  </p>
</section>
```

```css interactive-example
#default-example > p {
  line-height: 3em;
  font-family: monospace;
  font-size: 1.2em;
  text-decoration: underline overline;
}
```

Thuộc tính `vertical-align` có thể được sử dụng trong hai ngữ cảnh:

- Để căn chỉnh theo chiều dọc hộp của một phần tử cấp nội tuyến bên trong hộp dòng chứa nó. Ví dụ, có thể dùng để [căn chỉnh theo chiều dọc một ảnh trong một dòng văn bản](#căn_chỉnh_theo_chiều_dọc_trong_hộp_dòng).
- Để căn chỉnh theo chiều dọc [nội dung của ô trong bảng](#căn_chỉnh_theo_chiều_dọc_trong_ô_bảng).

Dùng thuộc tính viết tắt này (`vertical-align`) thay vì các thuộc tính dài tương ứng, trừ khi bạn cần kế thừa chúng độc lập hoặc (trên các phần tử SVG) để hỗ trợ các triển khai SVG cũ.

Lưu ý rằng `vertical-align` chỉ áp dụng cho các phần tử nội tuyến, nội tuyến-khối và ô bảng: bạn không thể dùng nó để căn chỉnh theo chiều dọc [các phần tử cấp khối](/vi/docs/Glossary/Block-level_content).

## Cú pháp

```css
/* Các giá trị từ khóa */
vertical-align: baseline;
vertical-align: sub;
vertical-align: super;
vertical-align: text-top;
vertical-align: text-bottom;
vertical-align: middle;
vertical-align: top;
vertical-align: bottom;

/* Các giá trị <length> */
vertical-align: 10em;
vertical-align: 4px;

/* Các giá trị <percentage> */
vertical-align: 20%;

/* Giá trị toàn cục */
vertical-align: inherit;
vertical-align: initial;
vertical-align: revert;
vertical-align: revert-layer;
vertical-align: unset;
```

Thuộc tính `vertical-align` được chỉ định là một trong các giá trị liệt kê bên dưới.

### Giá trị cho phần tử nội tuyến

#### Giá trị tương đối so với phần tử cha

Các giá trị này căn chỉnh theo chiều dọc phần tử tương đối so với phần tử cha của nó:

- `baseline`
  - : Căn chỉnh đường cơ sở của phần tử với đường cơ sở của phần tử cha. Đường cơ sở của một số {{glossary("replaced elements", "phần tử thay thế")}}, như {{HTMLElement("textarea")}}, không được thông số kỹ thuật HTML quy định, nghĩa là hành vi của chúng với từ khóa này có thể khác nhau giữa các trình duyệt.
- `sub`
  - : Căn chỉnh đường cơ sở của phần tử với đường cơ sở chỉ số dưới của phần tử cha.
- `super`
  - : Căn chỉnh đường cơ sở của phần tử với đường cơ sở chỉ số trên của phần tử cha.
- `text-top`
  - : Căn chỉnh phần trên của phần tử với phần trên phông chữ của phần tử cha.
- `text-bottom`
  - : Căn chỉnh phần dưới của phần tử với phần dưới phông chữ của phần tử cha.
- `middle`
  - : Căn chỉnh giữa phần tử với đường cơ sở cộng thêm một nửa chiều cao x của phần tử cha.
- {{cssxref("&lt;length&gt;")}}
  - : Căn chỉnh đường cơ sở của phần tử lên trên đường cơ sở của phần tử cha một khoảng bằng độ dài đã cho. Giá trị âm được cho phép.
- {{cssxref("&lt;percentage&gt;")}}
  - : Căn chỉnh đường cơ sở của phần tử lên trên đường cơ sở của phần tử cha một khoảng bằng phần trăm đã cho, với giá trị là phần trăm của thuộc tính {{Cssxref("line-height")}}. Giá trị âm được cho phép.

#### Giá trị tương đối so với dòng

Các giá trị sau căn chỉnh theo chiều dọc phần tử tương đối so với toàn bộ dòng:

- `top`
  - : Căn chỉnh phần trên của phần tử và các phần tử con của nó với phần trên của toàn bộ dòng.
- `bottom`
  - : Căn chỉnh phần dưới của phần tử và các phần tử con của nó với phần dưới của toàn bộ dòng.

Đối với các phần tử không có đường cơ sở, phần dưới của lề sẽ được dùng thay thế.

### Giá trị cho ô bảng

- `baseline` (và `sub`, `super`, `text-top`, `text-bottom`, `<length>`, và `<percentage>`)
  - : Căn chỉnh đường cơ sở của ô với đường cơ sở của tất cả các ô khác trong hàng được căn chỉnh theo đường cơ sở.
- `top`
  - : Căn chỉnh cạnh trên của phần đệm của ô với phần trên của hàng.
- `middle`
  - : Căn giữa hộp đệm của ô trong hàng.
- `bottom`
  - : Căn chỉnh cạnh dưới của phần đệm của ô với phần dưới của hàng.

Giá trị âm được cho phép.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<div>
  An <img src="frame_image.svg" alt="link" width="32" height="32" /> image with
  a default alignment.
</div>
<div>
  An
  <img class="top" src="frame_image.svg" alt="link" width="32" height="32" />
  image with a text-top alignment.
</div>
<div>
  An
  <img class="bottom" src="frame_image.svg" alt="link" width="32" height="32" />
  image with a text-bottom alignment.
</div>
<div>
  An
  <img class="middle" src="frame_image.svg" alt="link" width="32" height="32" />
  image with a middle alignment.
</div>
```

#### CSS

```css
img.top {
  vertical-align: text-top;
}
img.bottom {
  vertical-align: text-bottom;
}
img.middle {
  vertical-align: middle;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

### Căn chỉnh theo chiều dọc trong hộp dòng

#### HTML

```html-nolint
<p>
top:         <img style="vertical-align: top" src="star.png" alt="star"/>
middle:      <img style="vertical-align: middle" src="star.png" alt="star"/>
bottom:      <img style="vertical-align: bottom" src="star.png" alt="star"/>
super:       <img style="vertical-align: super" src="star.png" alt="star"/>
sub:         <img style="vertical-align: sub" src="star.png" alt="star"/>
</p>

<p>
text-top:    <img style="vertical-align: text-top" src="star.png" alt="star"/>
text-bottom: <img style="vertical-align: text-bottom" src="star.png" alt="star"/>
0.2em:       <img style="vertical-align: 0.2em" src="star.png" alt="star"/>
-1em:        <img style="vertical-align: -1em" src="star.png" alt="star"/>
20%:         <img style="vertical-align: 20%" src="star.png" alt="star"/>
-100%:       <img style="vertical-align: -100%" src="star.png" alt="star"/>
</p>
```

```css hidden
#* {
  box-sizing: border-box;
}

img {
  margin-right: 0.5em;
}

p {
  height: 3em;
  padding: 0 0.5em;
  font-family: monospace;
  text-decoration: underline overline;
  margin-left: auto;
  margin-right: auto;
  width: 80%;
}
```

#### Kết quả

{{EmbedLiveSample("Vertical_alignment_in_a_line_box", '100%', 160, "", "")}}

### Căn chỉnh theo chiều dọc trong ô bảng

Trong ví dụ này, chúng ta có một bảng với một hàng chứa sáu ô. Hàng đặt `vertical-align` thành `bottom` làm giá trị mặc định.

- Bốn ô đầu tiên mỗi ô đặt giá trị `vertical-align` riêng, và các giá trị này ghi đè giá trị của hàng.
- Ô thứ năm không đặt bất kỳ giá trị `vertical-align` nào, do đó kế thừa giá trị của hàng.

Ô thứ sáu chỉ được dùng để đảm bảo các ô đủ cao để thấy được hiệu ứng.

#### HTML

```html
<table>
  <tbody>
    <tr class="bottom">
      <td class="baseline">baseline</td>
      <td class="top">top</td>
      <td class="middle">middle</td>
      <td>bottom</td>
      <td>Row's style</td>
      <td>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse
        pretium felis eu sem mattis vulputate.
      </td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  margin-left: auto;
  margin-right: auto;
  width: 80%;
}

table,
th,
td {
  border: 1px solid black;
}

td {
  padding: 0.5em;
  font-family: monospace;
}

.bottom {
  vertical-align: bottom;
}

.baseline {
  vertical-align: baseline;
}

.top {
  vertical-align: top;
}

.middle {
  vertical-align: middle;
}
```

#### Kết quả

{{EmbedLiveSample("Vertical_alignment_in_a_table_cell", '100%', 230, "", "")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các trường hợp sử dụng điển hình của flexbox, phần "Center item"](/vi/docs/Web/CSS/Guides/Flexible_box_layout/Use_cases#center_item)
- {{Cssxref("line-height")}}, {{Cssxref("text-align")}}, {{Cssxref("margin")}}
- [Understanding `vertical-align`, or "How (Not) To Vertically Center Content"](https://phrogz.net/css/vertical-align/index.html)
- [Vertical-Align: All You Need To Know](https://christopheraue.net/design/vertical-align)
