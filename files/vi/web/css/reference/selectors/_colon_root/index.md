---
title: :root
slug: Web/CSS/Reference/Selectors/:root
page-type: css-pseudo-class
browser-compat: css.selectors.root
sidebar: cssref
---

**`:root`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) khớp với phần tử gốc của cây đại diện cho tài liệu. Trong HTML, `:root` đại diện cho phần tử {{HTMLElement("html")}} và giống hệt với bộ chọn `html`, ngoại trừ [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của nó (0-1-0) cao hơn của `html` (0-0-1).

```css
/* Chọn phần tử gốc của tài liệu:
   <html> trong trường hợp HTML */
:root {
  background: yellow;
}
```

## Cú pháp

```css
:root {
  /* ... */
}
```

## Ví dụ

### Khai báo biến CSS toàn cục

`:root` có thể hữu ích để khai báo [biến CSS](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) toàn cục:

```css
:root {
  --main-color: hotpink;
  --pane-padding: 5px 42px;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("html")}}
- {{domxref("Document.rootElement")}}
- {{domxref("Node.getRootNode()")}}
- {{domxref("Element.shadowRoot")}}
- {{domxref("ShadowRoot")}}
