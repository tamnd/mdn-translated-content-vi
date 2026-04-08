---
title: font-feature-settings
slug: Web/CSS/Reference/Properties/font-feature-settings
page-type: css-property
browser-compat: css.properties.font-feature-settings
sidebar: cssref
---

Thuộc tính **`font-feature-settings`** [CSS](/en-US/docs/Web/CSS) kiểm soát các tính năng kiểu chữ nâng cao trong font OpenType.

{{InteractiveExample("CSS Demo: font-feature-settings")}}

```css interactive-example-choice
font-feature-settings: normal;
```

```css interactive-example-choice
font-feature-settings: "liga" 0;
```

```css interactive-example-choice
font-feature-settings: "tnum";
```

```css interactive-example-choice
font-feature-settings: "smcp", "zero";
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>Difficult waffles</p>
    <table>
      <tbody>
        <tr>
          <td><span class="tabular">0O</span></td>
        </tr>
        <tr>
          <td><span class="tabular">3.14</span></td>
        </tr>
        <tr>
          <td><span class="tabular">2.71</span></td>
        </tr>
      </tbody>
    </table>
  </div>
</section>
```

```css interactive-example
@font-face {
  font-family: "Fira Sans";
  src:
    local("FiraSans-Regular"),
    url("/shared-assets/fonts/FiraSans-Regular.woff2") format("woff2");
  font-weight: normal;
  font-style: normal;
}

section {
  font-family: "Fira Sans", sans-serif;
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
/* Sử dụng cài đặt mặc định */
font-feature-settings: normal;

/* Đặt giá trị cho thẻ tính năng OpenType */
font-feature-settings: "smcp";
font-feature-settings: "smcp" on;
font-feature-settings: "swsh" 2;
font-feature-settings:
  "smcp",
  "swsh" 2;

/* Giá trị toàn cục */
font-feature-settings: inherit;
font-feature-settings: initial;
font-feature-settings: revert;
font-feature-settings: revert-layer;
font-feature-settings: unset;
```

Bất cứ khi nào có thể, các tác giả web nên dùng thuộc tính viết tắt {{cssxref("font-variant")}} hoặc thuộc tính dài liên quan như {{cssxref("font-variant-ligatures")}}, {{cssxref("font-variant-caps")}}, {{cssxref("font-variant-east-asian")}}, {{cssxref("font-variant-alternates")}}, {{cssxref("font-variant-numeric")}} hoặc {{cssxref("font-variant-position")}}.

Các thuộc tính này cho kết quả hiệu quả, có thể dự đoán và dễ hiểu hơn `font-feature-settings`, vốn là tính năng cấp thấp được thiết kế để xử lý các trường hợp đặc biệt khi không có cách nào khác để bật hoặc truy cập tính năng font OpenType. Đặc biệt, `font-feature-settings` không nên được dùng để bật chữ hoa nhỏ.

### Các giá trị

Thuộc tính này được chỉ định là từ khóa `normal` hoặc danh sách các giá trị `<feature-tag-value>` phân cách bằng dấu phẩy. Khi hiển thị văn bản, danh sách các giá trị `<feature-tag-value>` OpenType được truyền tới công cụ bố cục văn bản để bật hoặc tắt các tính năng font.

- `normal`
  - : Chỉ ra rằng văn bản được bố cục bằng các cài đặt font mặc định. Đây là giá trị mặc định.
- `<feature-tag-value>`
  - : Biểu diễn một bộ phân cách bằng khoảng trắng gồm tên thẻ và một giá trị tùy chọn.
    - Tên thẻ
      - : Tên thẻ luôn là một {{cssxref("&lt;string&gt;")}} gồm bốn ký tự {{Glossary("ASCII")}}. Nếu tên thẻ có nhiều hoặc ít hơn bốn ký tự hoặc chứa các ký tự ngoài phạm vi mã điểm `U+20` – `U+7E`, bộ mô tả không hợp lệ.
    - Giá trị tùy chọn
      - : Giá trị tùy chọn có thể là số nguyên dương hoặc từ khóa `on` hay `off`. Các từ khóa `on` và `off` là từ đồng nghĩa với các giá trị `1` và `0` tương ứng. Nếu không có giá trị được đặt, giá trị mặc định là `1`. Đối với các tính năng OpenType không phải boolean (ví dụ: [kiểu chữ thay thế](https://learn.microsoft.com/en-ca/typography/opentype/spec/features_pt#tag-salt)), giá trị ám chỉ một glyph cụ thể được chọn; đối với các tính năng boolean, giá trị bật hoặc tắt tính năng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bật các tính năng font khác nhau

```css
/* dùng glyph chữ hoa nhỏ thay thế */
.small-caps {
  font-feature-settings: "smcp" on;
}

/* chuyển cả chữ hoa và thường thành chữ hoa nhỏ (ảnh hưởng đến dấu câu) */
.all-small-caps {
  font-feature-settings: "c2sc", "smcp";
}

/* dùng số 0 có gạch chéo để phân biệt với "O" */
.nice-zero {
  font-feature-settings: "zero";
}

/* bật các dạng lịch sử */
.historical {
  font-feature-settings: "hist";
}

/* tắt ligaturs thông thường, thường bật theo mặc định */
.no-ligatures {
  font-feature-settings: "liga" 0;
}

/* bật các chữ số dạng bảng (monospaced) */
td.tabular {
  font-feature-settings: "tnum";
}

/* bật phân số tự động */
.fractions {
  font-feature-settings: "frac";
}

/* dùng ký tự swash thứ hai khả dụng */
.swash {
  font-feature-settings: "swsh" 2;
}

/* bật bộ phong cách 7 */
.fancy-style {
  font-family: "Gabriola", cursive;
  font-feature-settings: "ss07";
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}}
- Danh sách [thẻ tính năng OpenType](https://learn.microsoft.com/en-us/typography/opentype/spec/featurelist)
- [Các tính năng OpenType trong CSS](https://sparanoid.com/lab/opentype-features/)
