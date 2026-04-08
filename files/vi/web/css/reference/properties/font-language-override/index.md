---
title: font-language-override
slug: Web/CSS/Reference/Properties/font-language-override
page-type: css-property
browser-compat: css.properties.font-language-override
sidebar: cssref
---

Thuộc tính **`font-language-override`** [CSS](/en-US/docs/Web/CSS) kiểm soát việc sử dụng các glyph dành riêng cho ngôn ngữ trong một kiểu chữ.

Theo mặc định, thuộc tính `lang` của HTML nói với trình duyệt hiển thị các glyph được thiết kế đặc biệt cho ngôn ngữ đó. Ví dụ, nhiều font có một ký tự đặc biệt cho cụm hai chữ cái `fi` kết hợp dấu chấm trên "i" với "f." Tuy nhiên, nếu ngôn ngữ được đặt là tiếng Thổ Nhĩ Kỳ, kiểu chữ có thể biết không dùng glyph kết hợp đó; tiếng Thổ Nhĩ Kỳ có hai phiên bản chữ "i", một có chấm (`i`) và một không có (`ı`), và việc dùng ligature sẽ chuyển nhầm chữ "i" có chấm thành chữ "i" không chấm.

Thuộc tính `font-language-override` cho phép bạn ghi đè hành vi kiểu chữ cho một ngôn ngữ cụ thể. Điều này hữu ích, ví dụ, khi kiểu chữ bạn đang dùng thiếu hỗ trợ đúng cho ngôn ngữ đó. Ví dụ, nếu một kiểu chữ không có quy tắc đúng cho ngôn ngữ Azerbaijan, bạn có thể buộc font dùng glyph tiếng Thổ Nhĩ Kỳ, vốn tuân theo các quy tắc tương tự.

## Cú pháp

```css
/* Giá trị từ khóa */
font-language-override: normal;

/* Giá trị <string> */
font-language-override: "ENG"; /* Dùng glyph tiếng Anh */
font-language-override: "TRK"; /* Dùng glyph tiếng Thổ Nhĩ Kỳ */

/* Giá trị toàn cục */
font-language-override: inherit;
font-language-override: initial;
font-language-override: revert;
font-language-override: revert-layer;
font-language-override: unset;
```

Thuộc tính `font-language-override` được chỉ định là từ khóa `normal` hoặc một `<string>`.

### Các giá trị

- `normal`
  - : Nói với trình duyệt dùng các glyph font phù hợp cho ngôn ngữ được chỉ định bởi thuộc tính `lang`. Đây là giá trị mặc định.
- {{cssxref("string")}}
  - : Nói với trình duyệt dùng các glyph font phù hợp cho ngôn ngữ được chỉ định bởi chuỗi. Chuỗi phải khớp với thẻ ngôn ngữ tìm thấy trong [hệ thống ngôn ngữ OpenType](https://learn.microsoft.com/en-us/typography/opentype/spec/languagetags). Ví dụ, "ENG" là tiếng Anh, và "KOR" là tiếng Hàn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng glyph tiếng Đan Mạch

#### HTML

```html
<p class="para1">Default language setting.</p>
<p class="para2">
  This is a string with the <code>font-language-override</code> set to Danish.
</p>
```

#### CSS

```css
p.para1 {
  font-language-override: normal;
}

p.para2 {
  font-language-override: "DAN";
}
```

#### Kết quả

{{ EmbedLiveSample('Using Danish glyphs') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}, {{cssxref("font-variant-position")}}, {{cssxref("font-variant-east-asian")}}, {{cssxref("font-variant-caps")}}, {{cssxref("font-variant-ligatures")}}, {{cssxref("font-variant-numeric")}}, {{cssxref("font-variant-alternates")}}, {{cssxref("font-synthesis")}}, {{cssxref("font-kerning")}}.
