---
title: font-feature-settings
slug: Web/CSS/Reference/At-rules/@font-face/font-feature-settings
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-feature-settings
sidebar: cssref
---

Descriptor CSS **`font-feature-settings`** cho phép bạn định nghĩa các cài đặt ban đầu để sử dụng cho font được định nghĩa bởi at-rule {{cssxref("@font-face")}}. Bạn có thể sử dụng descriptor này để kiểm soát các tính năng font typographic như ligature, chữ hoa nhỏ, và swash cho font được định nghĩa bởi `@font-face`. Các giá trị cho descriptor này giống với thuộc tính {{cssxref("font-feature-settings")}}, ngoại trừ các giá trị từ khóa toàn cục.

Vì descriptor này đặt các giá trị tính năng trên đối tượng font trong at-rule `@font-face` chứ không phải trên toàn bộ phần tử, nên chỉ một số glyph trong một phần tử có thể được kết xuất bằng descriptor này.

## Cú pháp

```css
/* Sử dụng cài đặt mặc định */
font-feature-settings: normal;

/* Đặt giá trị cho các tag tính năng OpenType */
font-feature-settings: "smcp";
font-feature-settings: "smcp" on;
font-feature-settings: "swsh" 2;
```

### Giá trị

Descriptor này được chỉ định là từ khóa `normal` hoặc là một danh sách phân cách bằng dấu phẩy của các giá trị `<feature-tag-value>`. Khi kết xuất văn bản, danh sách các giá trị OpenType `<feature-tag-value>` được chuyển đến engine bố cục văn bản để bật hoặc tắt các tính năng font.

- `normal`
  - : Chỉ ra rằng văn bản được bố cục bằng cài đặt font mặc định. Đây là giá trị mặc định.
- `<feature-tag-value>`
  - : Đại diện cho một tuple phân cách bằng khoảng trắng bao gồm tên tag và một giá trị tùy chọn.

    Tên tag luôn là {{cssxref("&lt;string&gt;")}} gồm bốn ký tự {{Glossary("ASCII")}}. Nếu tên tag có nhiều hơn hoặc ít hơn bốn ký tự hoặc nếu nó chứa các ký tự nằm ngoài phạm vi điểm code `U+20` – `U+7E`, descriptor là không hợp lệ.

    Giá trị tùy chọn có thể là một số nguyên dương hoặc từ khóa `on` hoặc `off`. Các từ khóa `on` và `off` là từ đồng nghĩa với các giá trị `1` và `0` tương ứng. Nếu không có giá trị nào được đặt, mặc định là `1`. Đối với các tính năng OpenType không phải boolean (ví dụ: [các lựa chọn thay thế theo phong cách](https://learn.microsoft.com/en-ca/typography/opentype/spec/features_pt#tag-salt)), giá trị ngụ ý một glyph cụ thể sẽ được chọn; đối với các tính năng boolean, giá trị bật hoặc tắt tính năng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bật các glyph swash bằng at-rule @font-face

Trong ví dụ này, tên tag `swsh` và giá trị boolean `1` được sử dụng làm giá trị cho descriptor `font-feature-settings` trong at-rule `@font-face`.

#### HTML

```html
<p class="swash-off">Swash is off here</p>
<p class="swash-on">Swash is on here</p>
```

#### CSS

```css
@font-face {
  font-family: "MonteCarlo";
  src: url("/shared-assets/fonts/monte-carlo/monte-carlo-regular.woff2");
}
@font-face {
  font-family: "MonteCarlo2";
  src: url("/shared-assets/fonts/monte-carlo/monte-carlo-regular.woff2");
  font-feature-settings: "swsh" 1;
}
p {
  font-size: 3rem;
  margin: 0.7rem 3rem;
}
.swash-off {
  font-family: "MonteCarlo", cursive;
}
.swash-on {
  font-family: "MonteCarlo2", cursive;
}
```

#### Kết quả

{{EmbedLiveSample("Enabling swash glyphs using the @font-face rule", 0, 230)}}

Dòng 1 hiển thị thiết kế trang trí mặc định của font [MonteCarlo](https://github.com/googlefonts/monte-carlo), và dòng 2 hiển thị các glyph mặc định được thay thế bằng các glyph [swash](https://learn.microsoft.com/en-ca/typography/opentype/spec/features_pt#tag-swsh).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor `@font-face` khác: {{cssxref("@font-face/font-family", "font-family")}}, {{cssxref("@font-face/font-style", "font-style")}}, {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}, {{cssxref("@font-face/font-weight", "font-weight")}}, {{cssxref("@font-face/src", "src")}}
- Các thuộc tính font liên quan: {{cssxref("font-feature-settings")}}, {{cssxref("font-variant-alternates")}}, {{cssxref("font-variation-settings")}}
