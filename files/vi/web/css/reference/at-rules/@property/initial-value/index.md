---
title: initial-value
slug: Web/CSS/Reference/At-rules/@property/initial-value
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.property.initial-value
sidebar: cssref
---

Mô tả **`initial-value`** của at-rule {{cssxref("@property")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) chỉ định giá trị ban đầu cho [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*) đã đăng ký.
Đây là mô tả bắt buộc trừ khi giá trị của mô tả {{cssxref("@property/syntax", "syntax")}} là cú pháp phổ quát (`*`).
Nếu cần nhưng bị thiếu hoặc không hợp lệ, toàn bộ quy tắc `@property` sẽ không hợp lệ và bị bỏ qua.

## Cú pháp

```css
/* Đặt giá trị màu ban đầu */
initial-value: rebeccapurple;

/* Đặt giá trị độ dài ban đầu */
initial-value: 16px;
```

### Giá trị

Một giá trị khớp với kiểu được chỉ định trong mô tả {{cssxref("@property/syntax", "syntax")}}.
Ví dụ, nếu `syntax` là `<color>`, thì `initial-value` phải là giá trị {{cssxref("color")}} hợp lệ.

Nếu giá trị của mô tả `syntax` không phải là định nghĩa cú pháp phổ quát, mô tả `initial-value` phải là giá trị [độc lập về mặt tính toán](https://drafts.css-houdini.org/css-properties-values-api-1/#computationally-independent). Điều này có nghĩa là giá trị có thể được chuyển đổi thành giá trị tính toán mà không phụ thuộc vào các giá trị khác, ngoại trừ các định nghĩa "toàn cục" độc lập với CSS. Ví dụ, `10px` là độc lập về mặt tính toán - nó không thay đổi khi được chuyển đổi thành giá trị tính toán. `2in` cũng hợp lệ, vì `1in` luôn tương đương với `96px`. Tuy nhiên, `3em` không hợp lệ, vì giá trị của `em` phụ thuộc vào {{cssxref("font-size")}} của phần tử cha.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt giá trị ban đầu cho thuộc tính tùy chỉnh

Ví dụ này cho thấy cách định nghĩa thuộc tính tùy chỉnh `--my-color` với giá trị màu ban đầu là `#c0ffee`. Giá trị ban đầu này sẽ được sử dụng khi thuộc tính không được kế thừa (`inherits: false`) và không có giá trị nào khác được đặt trên phần tử.

```css
@property --my-color {
  syntax: "<color>";
  inherits: false;
  initial-value: #c0ffee;
}
```

Sử dụng [JavaScript](/en-US/docs/Web/JavaScript) {{domxref('CSS.registerProperty_static', 'CSS.registerProperty()')}}:

```js
window.CSS.registerProperty({
  name: "--my-color",
  syntax: "<color>",
  inherits: false,
  initialValue: "#c0ffee",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các mô tả {{cssxref("@property")}} khác: {{cssxref("@property/inherits","inherits")}} và {{cssxref("@property/syntax", "syntax")}}
- [Đăng ký thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
- [CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
