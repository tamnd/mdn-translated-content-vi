---
title: ::-moz-focus-inner
slug: Web/CSS/Reference/Selectors/::-moz-focus-inner
page-type: css-pseudo-element
status:
  - deprecated
  - non-standard
browser-compat: css.selectors.-moz-focus-inner
sidebar: cssref
---

{{non-standard_header}}{{deprecated_header}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-focus-inner`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho vòng focus bên trong của phần tử {{HTMLElement("button")}} cũng như các kiểu {{HTMLElement("input/button","button")}}, {{HTMLElement("input/submit","submit")}}, {{HTMLElement("input/reset","reset")}} và {{HTMLElement("input/color","color")}} của phần tử {{HTMLElement("input")}}.

> [!NOTE]
> Sử dụng `::-moz-focus-inner` với bất kỳ thứ gì khác ngoài các nút hỗ trợ nó sẽ không khớp với bất cứ thứ gì và không có hiệu lực.

## Cú pháp

```css
::-moz-focus-inner {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<input type="submit" value="Input" /> <button type="submit">Button</button>
```

### CSS

```css
button::-moz-focus-inner,
input[type="color"]::-moz-focus-inner,
input[type="reset"]::-moz-focus-inner,
input[type="button"]::-moz-focus-inner,
input[type="submit"]::-moz-focus-inner {
  padding-block-start: 0px;
  padding-inline-end: 2px;
  padding-block-end: 0px;
  padding-inline-start: 2px;
  border: 2px dotted red;
}
```

### Kết quả

{{EmbedLiveSample("Example", 300, 50)}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Phần mở rộng CSS của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions)
- Thuộc tính CSS liên quan:
  - {{cssxref("-moz-user-focus")}}

- Bộ chọn CSS liên quan:
  - {{cssxref(":focus")}}
  - {{cssxref(":focus-visible")}}
  - {{cssxref(":focus-within")}}
