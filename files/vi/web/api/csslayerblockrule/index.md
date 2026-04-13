---
title: CSSLayerBlockRule
slug: Web/API/CSSLayerBlockRule
page-type: web-api-interface
browser-compat: api.CSSLayerBlockRule
---

{{APIRef("CSSOM")}}

**`CSSLayerBlockRule`** đại diện cho một quy tắc khối {{cssxref("@layer")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ các tổ tiên {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

- {{DOMxRef("CSSLayerBlockRule.name")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa tên của lớp cascade liên quan.

## Phương thức phiên bản

_Kế thừa các phương thức từ các tổ tiên {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Ví dụ

### HTML

```html
<p>I am displayed in <code>color: rebeccapurple</code>.</p>
```

### CSS

```css
@layer special {
  p {
    color: rebeccapurple;
  }
}
```

### JavaScript

```js
const item = document.getElementsByTagName("p")[0];
const rules = document.getElementById("css-output").sheet.cssRules;

const layer = rules[0]; // A CSSLayerBlockRule

item.textContent = `The CSSLayerBlockRule is for the "${layer.name}" layer`;
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@layer")}}
- {{DOMxRef("CSSLayerStatementRule")}}
- [Tìm hiểu về CSS cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
