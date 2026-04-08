---
title: font-variation-settings
slug: Web/CSS/Reference/At-rules/@font-face/font-variation-settings
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-variation-settings
sidebar: cssref
---

Descriptor **`font-variation-settings`** trong [CSS](/en-US/docs/Web/CSS) cho phép tác giả chỉ định các biến thể phông chữ OpenType hoặc TrueType cấp thấp trong quy tắc at-rule {{cssxref("@font-face")}}. Các giá trị cho descriptor này giống với thuộc tính {{cssxref("font-variation-settings")}}, ngoại trừ các giá trị từ khóa toàn cục.

Vì descriptor này đặt các giá trị biến thể trên đối tượng phông chữ trong quy tắc at-rule `@font-face` chứ không phải trên toàn bộ phần tử, nên chỉ một số glyph trong một phần tử có thể được hiển thị bằng descriptor này.

## Cú pháp

```css
/* Sử dụng cài đặt mặc định */
font-variation-settings: normal;

/* Đặt giá trị cho tên trục OpenType */
font-variation-settings: "xhgt" 0.7;
```

### Giá trị

- `normal`
  - : Văn bản được trình bày với các cài đặt mặc định.
- `<string> <number>`
  - : Khi hiển thị văn bản, danh sách tên trục OpenType được truyền cho công cụ trình bày văn bản để bật hoặc tắt các tính năng phông chữ. Mỗi cài đặt luôn là một {{cssxref("&lt;string&gt;")}} gồm 4 ký tự {{Glossary("ASCII")}}, theo sau là một {{cssxref("number")}} chỉ định giá trị trục. Nếu `<string>` có nhiều hơn hoặc ít hơn số ký tự hoặc chứa ký tự nằm ngoài dải mã U+20 - U+7E, toàn bộ thuộc tính không hợp lệ. `<number>` có thể là số thập phân hoặc số âm.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt độ đậm và độ rộng phông chữ trong quy tắc @font-face

```css
@font-face {
  font-family: "OpenTypeFont";
  src: url("open_type_font.woff2") format("woff2");
  font-weight: normal;
  font-style: normal;
  font-variation-settings:
    "wght" 400,
    "wdth" 300;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor `@font-face` khác: {{cssxref("@font-face/font-display", "font-display")}}, {{cssxref("@font-face/font-family", "font-family")}}, {{cssxref("font-feature-settings", "font-feature-settings")}}, {{cssxref("@font-face/font-stretch", "font-stretch")}}, {{cssxref("@font-face/font-style", "font-style")}}, {{cssxref("@font-face/font-weight", "font-weight")}}, {{cssxref("@font-face/src", "src")}}, {{cssxref("@font-face/unicode-range", "unicode-range")}}
- Các thuộc tính phông chữ liên quan: {{cssxref("font-feature-settings")}}, {{cssxref("font-variation-settings")}}
