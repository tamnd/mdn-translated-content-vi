---
title: descent-override
slug: Web/CSS/Reference/At-rules/@font-face/descent-override
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.descent-override
sidebar: cssref
---

Descriptor CSS **`descent-override`** cho at-rule {{cssxref("@font-face")}} định nghĩa chỉ số descent cho font. Chỉ số descent là chiều cao phía dưới đường cơ sở (baseline) mà CSS sử dụng để căn chỉnh các hộp dòng (line box) trong ngữ cảnh định dạng nội tuyến (inline formatting context).

## Cú pháp

```css
descent-override: normal;
descent-override: 90%;
```

### Giá trị

- `normal`
  - : Giá trị mặc định. Khi được sử dụng, giá trị chỉ số được lấy từ tệp font.
- `<percentage>`
  - : Một giá trị {{cssxref("&lt;percentage&gt;")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ghi đè chỉ số của font dự phòng

Thuộc tính `descent-override` có thể hữu ích khi ghi đè các chỉ số của font dự phòng để phù hợp hơn với font web chính.

```css
@font-face {
  font-family: "web-font";
  src: url("https://example.com/font.woff");
}

@font-face {
  font-family: "local-font";
  src: local("Local Font");
  descent-override: 125%;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/ascent-override", "ascent-override")}}
- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/line-gap-override", "line-gap-override")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/size-adjust", "size-adjust")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}} descriptor
