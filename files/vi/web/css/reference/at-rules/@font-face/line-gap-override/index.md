---
title: line-gap-override
slug: Web/CSS/Reference/At-rules/@font-face/line-gap-override
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.line-gap-override
sidebar: cssref
---

Descriptor **`line-gap-override`** trong [CSS](/en-US/docs/Web/CSS) cho quy tắc at-rule {{cssxref("@font-face")}} định nghĩa chỉ số khoảng cách dòng cho phông chữ. Chỉ số khoảng cách dòng là khoảng cách dòng được đề xuất của phông chữ hoặc khoảng cách bên ngoài (external leading).

## Cú pháp

```css
line-gap-override: normal;
line-gap-override: 90%;
```

### Giá trị

- `normal`
  - : Giá trị mặc định. Khi sử dụng, giá trị chỉ số được lấy từ tệp phông chữ.
- `<percentage>`
  - : Giá trị {{cssxref("&lt;percentage&gt;")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ghi đè các chỉ số của phông chữ dự phòng

Thuộc tính `line-gap-override` có thể hữu ích khi ghi đè các chỉ số của phông chữ dự phòng để chúng khớp tốt hơn với phông chữ web chính.

```css
@font-face {
  font-family: "web-font";
  src: url("https://example.com/font.woff");
}

@font-face {
  font-family: "local-font";
  src: local("Local Font");
  line-gap-override: 125%;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/descent-override", "descent-override")}}
- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/size-adjust", "size-adjust")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}} descriptor
