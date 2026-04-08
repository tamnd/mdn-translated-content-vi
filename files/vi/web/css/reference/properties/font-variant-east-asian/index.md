---
title: font-variant-east-asian
slug: Web/CSS/Reference/Properties/font-variant-east-asian
page-type: css-property
browser-compat: css.properties.font-variant-east-asian
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-variant-east-asian`** kiểm soát việc sử dụng các glyph thay thế cho chữ viết Đông Á, như tiếng Nhật và tiếng Trung.

{{InteractiveExample("CSS Demo: font-variant-east-asian")}}

```css interactive-example-choice
font-variant-east-asian: normal;
```

```css interactive-example-choice
font-variant-east-asian: ruby;
```

```css interactive-example-choice
font-variant-east-asian: jis78;
```

```css interactive-example-choice
font-variant-east-asian: proportional-width;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>
      JIS78とJIS83以降では、檜と桧、籠と篭など、一部の文字の入れ替えが行われている。また、「唖然」や「躯体」などの書体が変更されている。
    </p>
  </div>
</section>
```

```css interactive-example
section {
  font-family:
    "YuGothic Medium", "YuGothic", "Yu Gothic Medium", "Yu Gothic", sans-serif;
  margin-top: 10px;
  font-size: 1.5em;
}
```

## Cú pháp

```css
font-variant-east-asian: normal;
font-variant-east-asian: ruby;
font-variant-east-asian: jis78; /* <east-asian-variant-values> */
font-variant-east-asian: jis83; /* <east-asian-variant-values> */
font-variant-east-asian: jis90; /* <east-asian-variant-values> */
font-variant-east-asian: jis04; /* <east-asian-variant-values> */
font-variant-east-asian: simplified; /* <east-asian-variant-values> */
font-variant-east-asian: traditional; /* <east-asian-variant-values> */
font-variant-east-asian: full-width; /* <east-asian-width-values> */
font-variant-east-asian: proportional-width; /* <east-asian-width-values> */
font-variant-east-asian: ruby full-width jis83;

/* Giá trị toàn cục */
font-variant-east-asian: inherit;
font-variant-east-asian: initial;
font-variant-east-asian: revert;
font-variant-east-asian: revert-layer;
font-variant-east-asian: unset;
```

### Giá trị

- `normal`
  - : Từ khóa này dẫn đến việc hủy kích hoạt việc sử dụng các glyph thay thế đó.
- `ruby`
  - : Từ khóa này buộc sử dụng các glyph đặc biệt cho các ký tự ruby. Vì những ký tự này thường nhỏ hơn, các nhà tạo phông chữ thường thiết kế các dạng cụ thể, thường đậm hơn một chút để cải thiện độ tương phản. Từ khóa này tương ứng với các giá trị OpenType `ruby`.
- `<east-asian-variant-values>`
  - : Các giá trị này chỉ định một tập hợp các biến thể glyph biểu tượng học được dùng để hiển thị. Các giá trị có thể là:

    | Từ khóa       | Tiêu chuẩn định nghĩa glyph                                                 | Tương đương OpenType |
    | ------------- | --------------------------------------------------------------------------- | -------------------- |
    | `jis78`       | [JIS X 0208:1978](https://en.wikipedia.org/wiki/JIS_X_0208#First_standard)  | `jp78`               |
    | `jis83`       | [JIS X 0208:1983](https://en.wikipedia.org/wiki/JIS_X_0208#Second_standard) | `jp83`               |
    | `jis90`       | [JIS X 0208:1990](https://en.wikipedia.org/wiki/JIS_X_0208#Third_standard)  | `jp90`               |
    | `jis04`       | [JIS X 0213:2004](https://en.wikipedia.org/wiki/JIS_X_0213)                 | `jp04`               |
    | `simplified`  | Không có, sử dụng các glyph tiếng Trung giản thể                            | `smpl`               |
    | `traditional` | Không có, sử dụng các glyph tiếng Trung phồn thể                            | `trad`               |

- `<east-asian-width-values>`
  - : Các giá trị này kiểm soát kích thước của các ký tự dùng cho ký tự Đông Á. Có hai giá trị có thể:
    - `proportional-width` kích hoạt tập hợp các ký tự Đông Á có chiều rộng thay đổi. Nó tương ứng với các giá trị OpenType `pwid`.
    - `full-width` kích hoạt tập hợp các ký tự Đông Á đều có cùng kích thước gần như vuông. Nó tương ứng với các giá trị OpenType `fwid`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt các biến thể glyph Đông Á

Ví dụ này yêu cầu phông chữ "Yu Gothic" được cài đặt trong hệ điều hành của bạn, các phông chữ khác có thể không hỗ trợ các tính năng OpenType.

#### HTML

```html
<table>
  <thead></thead>
  <tbody>
    <tr>
      <th>normal/jis78:</th>
      <td>麹町</td>
      <td class="jis78">麹町</td>
    </tr>
    <tr>
      <th>normal/ruby:</th>
      <td>しんかんせん</td>
      <td class="ruby">しんかんせん</td>
    </tr>
    <tr>
      <th>normal/traditional:</th>
      <td>大学</td>
      <td class="traditional">大学</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
tbody {
  border: 0;
}

td {
  font-family: "Yu Gothic", fantasy;
  font-size: 20px;
}
th {
  color: grey;
  padding-right: 10px;
}

.ruby {
  font-variant-east-asian: ruby;
}

.jis78 {
  font-variant-east-asian: jis78;
}

.traditional {
  font-variant-east-asian: traditional;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_East_Asian_glyph_variants')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
- {{cssxref("font-variant-alternates")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-numeric")}}
- {{cssxref("font-variant-position")}}
