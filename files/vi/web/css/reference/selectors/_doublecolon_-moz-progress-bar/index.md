---
title: ::-moz-progress-bar
slug: Web/CSS/Reference/Selectors/::-moz-progress-bar
page-type: css-pseudo-element
status:
  - experimental
  - non-standard
browser-compat: css.selectors.-moz-progress-bar
sidebar: cssref
---

{{Non-standard_header}}{{SeeCompatTable}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-progress-bar`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho thanh tiến trình bên trong phần tử {{HTMLElement("progress")}}. (Thanh này đại diện cho lượng tiến trình đã hoàn thành.)

Nếu bạn muốn chọn phần chưa hoàn thành của {{HTMLElement("progress")}} trong Mozilla, hãy chọn trực tiếp phần tử {{HTMLElement("progress")}}.

## Cú pháp

```css
::-moz-progress-bar {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<progress value="30" max="100">30%</progress>
<progress max="100">Indeterminate</progress>
```

### CSS

```css
::-moz-progress-bar {
  background-color: red;
}

/* Force indeterminate bars to have zero width */
:indeterminate::-moz-progress-bar {
  width: 0;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("progress")}}
- {{ cssxref("::-webkit-progress-bar") }}
- {{ cssxref("::-webkit-progress-value") }}
- {{ cssxref("::-webkit-progress-inner-element") }}
