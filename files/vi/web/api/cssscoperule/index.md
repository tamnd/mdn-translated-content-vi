---
title: CSSScopeRule
slug: Web/API/CSSScopeRule
page-type: web-api-interface
browser-compat: api.CSSScopeRule
---

{{ APIRef("CSSOM") }}

Giao diện **`CSSScopeRule`** của [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) biểu thị at-rule CSS {{CSSxRef("@scope")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ các lớp tổ tiên {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

- {{domxref("CSSScopeRule.end", "end")}}
  - : Trả về một chuỗi chứa giá trị giới hạn phạm vi của at-rule `@scope`.
- {{domxref("CSSScopeRule.start", "start")}}
  - : Trả về một chuỗi chứa giá trị gốc phạm vi của at-rule `@scope`.

## Phương thức phiên bản

_Kế thừa phương thức từ các lớp tổ tiên {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Ví dụ

### Truy cập thông tin @scope trong JavaScript

Giả sử đây là stylesheet duy nhất được gắn vào tài liệu:

```css
@scope (.outer) to (.inner) {
  :scope {
    background: yellow;
  }
}
```

JavaScript sau có thể được sử dụng để truy cập thông tin về khối `@scope` được chứa:

```js
const scopeBlock = document.styleSheets[0].cssRules[0];

console.log(scopeBlock.start); // Returns ".outer"
console.log(scopeBlock.end); // Returns ".inner"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("@scope")}}
- {{CSSxRef(":scope")}}
