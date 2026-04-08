---
title: size-adjust
slug: Web/CSS/Reference/At-rules/@font-face/size-adjust
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.size-adjust
sidebar: cssref
---

Descriptor **`size-adjust`** trong [CSS](/en-US/docs/Web/CSS) cho quy tắc at-rule {{cssxref("@font-face")}} định nghĩa một hệ số nhân cho phác thảo glyph và các chỉ số liên quan đến phông chữ này. Điều này giúp dễ dàng hài hòa thiết kế của các phông chữ khác nhau khi được hiển thị ở cùng kích cỡ phông chữ.

Descriptor `size-adjust` hoạt động theo cách tương tự như thuộc tính {{cssxref("font-size-adjust")}}. Nó tính toán sự điều chỉnh theo từng phông chữ bằng cách khớp các chiều cao ex.

## Cú pháp

```css
size-adjust: 90%;
```

### Giá trị

- `<percentage>`
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} với giá trị khởi tạo là 100%.

Tất cả các chỉ số liên quan đến phông chữ này được chia tỷ lệ theo phần trăm đã cho. Điều này bao gồm các bước nhảy glyph, bảng đường cơ sở, và các giá trị ghi đè được cung cấp bởi các descriptor {{cssxref("@font-face")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ghi đè các chỉ số của phông chữ dự phòng

Thuộc tính `size-adjust` có thể hữu ích khi ghi đè các chỉ số của phông chữ dự phòng để chúng khớp tốt hơn với phông chữ web chính.

```css
@font-face {
  font-family: "web-font";
  src: url("https://example.com/font.woff");
}

@font-face {
  font-family: "local-font";
  src: local("Local Font");
  size-adjust: 90%;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Descriptor {{cssxref("@font-face/font-display", "font-display")}}
- Descriptor {{cssxref("@font-face/font-family", "font-family")}}
- Descriptor {{cssxref("@font-face/font-weight", "font-weight")}}
- Descriptor {{cssxref("@font-face/font-style", "font-style")}}
- Descriptor {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- Descriptor {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- Descriptor {{cssxref("@font-face/src", "src")}}
- Descriptor {{cssxref("@font-face/unicode-range", "unicode-range")}}
- Thuộc tính {{cssxref('font-size-adjust')}}
