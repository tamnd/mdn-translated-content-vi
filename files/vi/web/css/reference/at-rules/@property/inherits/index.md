---
title: inherits
slug: Web/CSS/Reference/At-rules/@property/inherits
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.property.inherits
sidebar: cssref
---

Mô tả **`inherits`** của [CSS](/en-US/docs/Web/CSS) trong at-rule {{cssxref("@property")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) kiểm soát liệu [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*) đã đăng ký có kế thừa theo mặc định hay không.
Đây là mô tả bắt buộc; nếu thiếu hoặc không hợp lệ, toàn bộ quy tắc `@property` sẽ không hợp lệ và bị bỏ qua.

## Cú pháp

```css
/* Thuộc tính tùy chỉnh không kế thừa giá trị */
inherits: false;

/* Thuộc tính tùy chỉnh kế thừa giá trị */
inherits: true;
```

### Giá trị

- `true`
  - : Thuộc tính kế thừa theo mặc định.
- `false`
  - : Thuộc tính không kế thừa theo mặc định.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt hành vi kế thừa của thuộc tính tùy chỉnh

Ví dụ này cho thấy cách định nghĩa thuộc tính tùy chỉnh `--my-color` không kế thừa giá trị của nó từ các phần tử cha:

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

- Các mô tả {{cssxref("@property")}} khác: {{cssxref("@property/initial-value", "initial-value")}} và {{cssxref("@property/syntax","syntax")}}
- [Đăng ký thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Properties_and_values_API/Registering_properties)
- [CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
