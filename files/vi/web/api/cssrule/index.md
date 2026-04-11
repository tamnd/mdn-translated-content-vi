---
title: CSSRule
slug: Web/API/CSSRule
page-type: web-api-interface
browser-compat: api.CSSRule
---

{{APIRef("CSSOM")}}

**`CSSRule`** là một interface đại diện cho một quy tắc CSS đơn lẻ. Có nhiều kiểu quy tắc kế thừa các thuộc tính từ `CSSRule`.

- {{DOMXRef("CSSGroupingRule")}}
- {{DOMXRef("CSSStyleRule")}}
- {{DOMXRef("CSSImportRule")}}
- {{DOMXRef("CSSMediaRule")}}
- {{DOMXRef("CSSFontFaceRule")}}
- {{DOMxRef("CSSFunctionDeclarations")}}
- {{DOMXRef("CSSPageRule")}}
- {{DOMXRef("CSSNamespaceRule")}}
- {{DOMXRef("CSSKeyframesRule")}}
- {{DOMXRef("CSSKeyframeRule")}}
- {{DOMXRef("CSSCounterStyleRule")}}
- {{DOMXRef("CSSSupportsRule")}}
- {{DOMXRef("CSSFontFeatureValuesRule")}}
- {{DOMXRef("CSSFontPaletteValuesRule")}}
- {{DOMXRef("CSSLayerBlockRule")}}
- {{DOMXRef("CSSLayerStatementRule")}}
- {{DOMXRef("CSSPropertyRule")}}
- {{DOMXRef("CSSNestedDeclarations")}}
- {{DOMXRef("CSSViewTransitionRule")}}

## Thuộc tính thể hiện

Interface `CSSRule` xác định các thuộc tính chung cho mọi quy tắc, còn các thuộc tính riêng của từng kiểu quy tắc được xác định trong các interface chuyên biệt hơn tương ứng với từng kiểu đó.

- {{domxref("CSSRule.cssText")}}
  - : Đại diện cho dạng văn bản của quy tắc, ví dụ `"h1,h2 { font-size: 16pt }"` hoặc `"@import 'url'"`. Để truy cập hoặc sửa các phần của quy tắc, ví dụ giá trị `"font-size"` trong ví dụ, hãy dùng các thuộc tính trên interface chuyên biệt của kiểu quy tắc đó (xem ở trên).
- {{domxref("CSSRule.parentRule")}} {{ReadOnlyInline}}
  - : Trả về quy tắc bao chứa, nếu không có thì trả về `null`. Ví dụ, nếu quy tắc này là một style rule bên trong khối {{cssxref("@media")}}, quy tắc cha sẽ là {{domxref("CSSMediaRule")}} đó.
- {{domxref("CSSRule.parentStyleSheet")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("CSSStyleSheet")}} của bảng kiểu chứa quy tắc này.
- {{domxref("CSSRule.type")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Trả về một trong các hằng số Type để xác định quy tắc đang đại diện cho kiểu nào.

## Ví dụ

Bạn có thể lấy tham chiếu đến `CSSRule` bằng cách xem danh sách `cssRules` của một {{domxref("CSSStyleSheet")}}.

```js
let myRules = document.styleSheets[0].cssRules; // Trả về một CSSRuleList
console.log(myRules);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## Xem thêm

- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
