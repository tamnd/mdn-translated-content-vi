---
title: font-variant-alternates
slug: Web/CSS/Reference/Properties/font-variant-alternates
page-type: css-property
browser-compat: css.properties.font-variant-alternates
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-variant-alternates`** kiểm soát việc sử dụng các glyph thay thế. Các glyph thay thế này có thể được tham chiếu bằng các tên thay thế được định nghĩa trong {{cssxref("@font-feature-values")}}.

Quy tắc at {{cssxref("@font-feature-values")}} có thể được dùng để liên kết, đối với một mặt phông chữ cụ thể, một tên dễ đọc với một chỉ số số học kiểm soát một tính năng phông chữ OpenType cụ thể. Đối với các tính năng chọn glyph thay thế (`stylistic`, `styleset`, `character-variant`, `swash`, `ornament` hoặc `annotation`), thuộc tính `font-variant-alternates` có thể tham chiếu tên dễ đọc để áp dụng tính năng liên quan.

Điều này cho phép các quy tắc CSS kích hoạt các glyph thay thế mà không cần biết các giá trị chỉ số cụ thể mà phông chữ đó sử dụng để kiểm soát chúng.

## Cú pháp

```css
/* Giá trị từ khóa */
font-variant-alternates: normal;
font-variant-alternates: historical-forms;

/* Giá trị ký hiệu hàm */
font-variant-alternates: stylistic(user-defined-ident);
font-variant-alternates: styleset(user-defined-ident);
font-variant-alternates: character-variant(user-defined-ident);
font-variant-alternates: swash(user-defined-ident);
font-variant-alternates: ornaments(user-defined-ident);
font-variant-alternates: annotation(user-defined-ident);
font-variant-alternates: swash(ident1) annotation(ident2);

/* Giá trị toàn cục */
font-variant-alternates: inherit;
font-variant-alternates: initial;
font-variant-alternates: revert;
font-variant-alternates: revert-layer;
font-variant-alternates: unset;
```

Thuộc tính này có thể có một trong hai dạng:

- hoặc từ khóa `normal`
- hoặc một hoặc nhiều từ khóa và hàm khác được liệt kê bên dưới, phân tách bằng dấu cách, theo bất kỳ thứ tự nào.

### Giá trị

- `normal`
  - : Từ khóa này hủy kích hoạt các glyph thay thế.
- `historical-forms`
  - : Từ khóa này kích hoạt các dạng lịch sử — các glyph phổ biến trong quá khứ nhưng không còn ngày nay. Nó tương ứng với giá trị OpenType `hist`.
- `stylistic()`
  - : Hàm này kích hoạt các biến thể kiểu dáng cho từng ký tự. Tham số là tên đặc trưng của phông chữ được ánh xạ thành một số. Nó tương ứng với giá trị OpenType `salt`, như `salt 2`.
- `styleset()`
  - : Hàm này kích hoạt các biến thể kiểu dáng cho tập hợp các ký tự. Tham số là tên đặc trưng của phông chữ được ánh xạ thành một số. Nó tương ứng với giá trị OpenType `ssXY`, như `ss02`.
- `character-variant()`
  - : Hàm này kích hoạt các biến thể kiểu dáng cụ thể cho các ký tự. Nó tương tự như `styleset()`, nhưng không tạo ra các glyph nhất quán cho một tập hợp ký tự; các ký tự riêng lẻ sẽ có kiểu dáng độc lập và không nhất thiết phải nhất quán. Tham số là tên đặc trưng của phông chữ được ánh xạ thành một số. Nó tương ứng với giá trị OpenType `cvXY`, như `cv02`.
- `swash()`
  - : Hàm này kích hoạt các glyph [swash](https://en.wikipedia.org/wiki/Swash_%28typography%29). Tham số là tên đặc trưng của phông chữ được ánh xạ thành một số. Nó tương ứng với các giá trị OpenType `swsh` và `cswh`, như `swsh 2` và `cswh 2`.
- `ornaments()`
  - : Hàm này kích hoạt các trang trí, như [fleurons](https://en.wikipedia.org/wiki/Fleuron_%28typography%29) và các glyph dingbat khác. Tham số là tên đặc trưng của phông chữ được ánh xạ thành một số. Nó tương ứng với giá trị OpenType `ornm`, như `ornm 2`.

    > [!NOTE]
    > Để bảo toàn ngữ nghĩa văn bản, các nhà thiết kế phông chữ nên bao gồm các trang trí không khớp với các ký tự dingbat Unicode như các biến thể trang trí của ký tự dấu đầu dòng (U+2022). Lưu ý rằng một số phông chữ hiện có không tuân theo khuyến nghị này.

- `annotation()`
  - : Hàm này kích hoạt các chú thích, như các chữ số trong vòng tròn hoặc các ký tự đảo ngược. Tham số là tên đặc trưng của phông chữ được ánh xạ thành một số. Nó tương ứng với giá trị OpenType `nalt`, như `nalt 2`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Kích hoạt các glyph swash

Trong ví dụ này, chúng ta sử dụng quy tắc at `@font-feature-values` để định nghĩa tên cho tính năng `swash` của phông chữ [MonteCarlo](https://github.com/googlefonts/monte-carlo). Quy tắc ánh xạ tên `"fancy"` thành giá trị chỉ số `1`.

Sau đó, chúng ta có thể sử dụng tên đó bên trong `font-variant-alternates` để bật swash cho phông chữ đó. Điều này tương đương với một dòng như `font-feature-settings: "swsh" 1`, ngoại trừ việc CSS áp dụng tính năng không cần phải bao gồm, hoặc thậm chí biết, giá trị chỉ số cần thiết cho phông chữ cụ thể này.

#### HTML

```html
<p>A Fancy Swash</p>
<p class="variant">A Fancy Swash</p>
```

#### CSS

```css
@font-face {
  font-family: "MonteCarlo";
  src: url("/shared-assets/fonts/monte-carlo/monte-carlo-regular.woff2");
}

@font-feature-values "MonteCarlo" {
  @swash {
    fancy: 1;
  }
}

p {
  font-family: "MonteCarlo", cursive;
  font-size: 3rem;
  margin: 0.7rem 3rem;
}

.variant {
  font-variant-alternates: swash(fancy);
}
```

#### Kết quả

{{EmbedLiveSample("Enabling swash glyphs", 0, 230)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-numeric")}}
- {{cssxref("font-variant-position")}}
- {{cssxref("@font-feature-values")}}
- {{cssxref("font-feature-settings")}}
