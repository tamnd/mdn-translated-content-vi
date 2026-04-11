---
title: Mô hình đối tượng CSS (CSSOM)
slug: Web/API/CSS_Object_Model
page-type: web-api-overview
spec-urls:
  - https://drafts.csswg.org/cssom/
  - https://drafts.csswg.org/cssom-view/
  - https://drafts.css-houdini.org/css-typed-om/
---

{{DefaultAPISidebar("CSSOM")}}

**Mô hình đối tượng CSS** là một tập hợp các API cho phép thao tác CSS bằng JavaScript. Nó giống với DOM, nhưng dành cho CSS thay vì HTML. Nó cho phép người dùng đọc và sửa kiểu CSS một cách động.

Các giá trị CSS được biểu diễn không có kiểu, tức là bằng các đối tượng {{JSxRef("String")}}.

## Tham khảo

- {{DOMxRef("AnimationEvent")}}
- {{DOMxRef("CaretPosition")}}
- {{DOMxRef("CSS")}}
- {{DOMxRef("CSSConditionRule")}}
- {{DOMxRef("CSSCounterStyleRule")}}
- {{DOMxRef("CSSFontFaceDescriptors")}}
- {{DOMxRef("CSSFontFaceRule")}}
- {{DOMxRef("CSSFontFeatureValuesMap")}}
- {{DOMxRef("CSSFontFeatureValuesRule")}}
- {{DOMxRef("CSSFunctionDeclarations")}}
- {{DOMxRef("CSSFunctionDescriptors")}}
- {{DOMxRef("CSSFunctionRule")}}
- {{DOMxRef("CSSGroupingRule")}}
- {{DOMxRef("CSSImportRule")}}
- {{DOMxRef("CSSKeyframeRule")}}
- {{DOMxRef("CSSKeyframesRule")}}
- {{DOMxRef("CSSMarginRule")}}
- {{DOMxRef("CSSMediaRule")}}
- {{DOMxRef("CSSNamespaceRule")}}
- {{DOMxRef("CSSPageRule")}}
- {{DOMxRef("CSSPositionTryRule")}}
- {{DOMxRef("CSSPositionTryDescriptors")}}
- {{DOMxRef("CSSRule")}}
- {{DOMxRef("CSSRuleList")}}
- {{DOMxRef("CSSStartingStyleRule")}}
- {{DOMxRef("CSSStyleDeclaration")}}
- {{DOMxRef("CSSStyleSheet")}}
- {{DOMxRef("CSSStyleRule")}}
- {{DOMxRef("CSSSupportsRule")}}
- {{DOMXRef("CSSNestedDeclarations")}}
- {{DOMxRef("FontFace")}}
- {{DOMxRef("FontFaceSet")}}
- {{DOMxRef("FontFaceSetLoadEvent")}}
- {{DOMxRef("MediaList")}}
- {{DOMxRef("MediaQueryList")}}
- {{DOMxRef("MediaQueryListEvent")}}
- {{DOMxRef("Screen")}}
- {{DOMxRef("StyleSheet")}}
- {{DOMxRef("StyleSheetList")}}
- {{DOMxRef("TransitionEvent")}}
- {{DOMxRef("VisualViewport")}}

Một số giao diện khác cũng được các đặc tả liên quan đến CSSOM mở rộng: {{DOMxRef("Document")}}, {{DOMxRef("Window")}}, {{DOMxRef("Element")}}, {{DOMxRef("HTMLElement")}}, {{DOMxRef("HTMLImageElement")}}, {{DOMxRef("Range")}}, {{DOMxRef("MouseEvent")}}, và {{DOMxRef("SVGElement")}}.

### CSS Typed Object Model

- {{DOMxRef("CSSImageValue")}}
- {{DOMxRef("CSSKeywordValue")}}
- {{DOMxRef("CSSMathInvert")}}
- {{DOMxRef("CSSMathMax")}}
- {{DOMxRef("CSSMathMin")}}
- {{DOMxRef("CSSMathNegate")}}
- {{DOMxRef("CSSMathProduct")}}
- {{DOMxRef("CSSMathSum")}}
- {{DOMxRef("CSSMathValue")}}
- {{DOMxRef("CSSMatrixComponent")}}
- {{DOMxRef("CSSNumericArray")}}
- {{DOMxRef("CSSNumericValue")}}
- {{DOMxRef("CSSPerspective")}}
- {{DOMxRef("CSSPositionValue")}}
- {{DOMxRef("CSSRotate")}}
- {{DOMxRef("CSSScale")}}
- {{DOMxRef("CSSSkew")}}
- {{DOMxRef("CSSSkewX")}}
- {{DOMxRef("CSSSkewY")}}
- {{DOMxRef("CSSStyleValue")}}
- {{DOMxRef("CSSTransformComponent")}}
- {{DOMxRef("CSSTransformValue")}}
- {{DOMxRef("CSSTranslate")}}
- {{DOMxRef("CSSUnitValue")}}
- {{DOMxRef("CSSUnparsedValue")}}
- {{DOMxRef("CSSVariableReferenceValue")}}
- {{DOMxRef("StylePropertyMap")}}
- {{DOMxRef("StylePropertyMapReadOnly")}}

### Các giao diện CSSOM cũ {{deprecated_inline}}

{{deprecated_header}}

- {{DOMxRef("CSSPrimitiveValue")}} {{deprecated_inline}}
- {{DOMxRef("CSSValue")}} {{deprecated_inline}}
- {{DOMxRef("CSSValueList")}} {{deprecated_inline}}

## Bài hướng dẫn

- [Xác định kích thước của phần tử](/en-US/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Tất cả các tính năng này đã được bổ sung dần dần qua nhiều năm trên các trình duyệt khác nhau: đây là một quá trình khá phức tạp, không thể tóm gọn trong một bảng đơn giản. Vui lòng tham khảo từng giao diện cụ thể để biết khả năng hỗ trợ của nó.

## Xem thêm

- [Mô hình đối tượng tài liệu (DOM)](/en-US/docs/Web/API/Document_Object_Model)
- [Các API Houdini](/en-US/docs/Web/API/Houdini_APIs)
