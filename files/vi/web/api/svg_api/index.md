---
title: SVG API
slug: Web/API/SVG_API
page-type: web-api-overview
spec-urls: https://svgwg.org/svg2-draft/
---

{{DefaultAPISidebar("SVG")}}

SVG cung cấp các phần tử cho hình tròn, hình chữ nhật và các đường cong đơn giản lẫn phức tạp. Các giá trị thuộc tính của phần tử xác định cách vẽ chúng. **SVG API** là tập hợp con của **DOM** kết nối các phần tử SVG và giá trị thuộc tính của chúng với các tập lệnh hoặc ngôn ngữ lập trình bằng cách biểu diễn chúng trong bộ nhớ. Do đó, SVG API cung cấp các phương thức cho phép truy cập lập trình vào các phần tử SVG và giá trị thuộc tính của chúng.

SVG API là một tập hợp các giao diện được phân loại vào các nhóm lớn sau:

1. [Các giao diện phần tử](#svg_element_interfaces) cung cấp quyền truy cập vào các thuộc tính của phần tử SVG và các phương thức để thao tác với chúng.
2. Các giao diện [kiểu dữ liệu tĩnh](#svg_data_type_interfaces) cung cấp quyền truy cập vào các giá trị thuộc tính phần tử và các phương thức để thao tác với chúng.
3. Đối với các thuộc tính có thể hoạt hình, các [giao diện kiểu dữ liệu hoạt hình](#svg_data_type_interfaces) cung cấp quyền truy cập chỉ đọc vào giá trị hoạt hình hiện tại của thuộc tính.
4. [Các giao diện SMIL (Synchronized Multimedia Integration Language)](#smil-related_interfaces)
5. [Các giao diện khác](#other_svg_interfaces)

## Giao diện

### Giao diện phần tử SVG

- {{DOMxRef("SVGAElement")}}
- {{DOMxRef("SVGAnimationElement")}}
- {{DOMxRef("SVGAnimateElement")}}
- {{DOMxRef("SVGAnimateMotionElement")}}
- {{DOMxRef("SVGAnimateTransformElement")}}
- {{DOMxRef("SVGCircleElement")}}
- {{DOMxRef("SVGClipPathElement")}}
- {{DOMxRef("SVGComponentTransferFunctionElement")}}
- {{DOMxRef("SVGDefsElement")}}
- {{DOMxRef("SVGDescElement")}}
- {{DOMxRef("SVGDiscardElement")}}
- {{DOMxRef("SVGElement")}}
- {{DOMxRef("SVGEllipseElement")}}
- {{DOMxRef("SVGFEBlendElement")}}
- {{DOMxRef("SVGFEColorMatrixElement")}}
- {{DOMxRef("SVGFEComponentTransferElement")}}
- {{DOMxRef("SVGFECompositeElement")}}
- {{DOMxRef("SVGFEConvolveMatrixElement")}}
- {{DOMxRef("SVGFEDiffuseLightingElement")}}
- {{DOMxRef("SVGFEDisplacementMapElement")}}
- {{DOMxRef("SVGFEDistantLightElement")}}
- {{DOMxRef("SVGFEDropShadowElement")}}
- {{DOMxRef("SVGFEFloodElement")}}
- {{DOMxRef("SVGFEFuncAElement")}}
- {{DOMxRef("SVGFEFuncBElement")}}
- {{DOMxRef("SVGFEFuncGElement")}}
- {{DOMxRef("SVGFEFuncRElement")}}
- {{DOMxRef("SVGFEGaussianBlurElement")}}
- {{DOMxRef("SVGFEImageElement")}}
- {{DOMxRef("SVGFEMergeElement")}}
- {{DOMxRef("SVGFEMergeNodeElement")}}
- {{DOMxRef("SVGFEMorphologyElement")}}
- {{DOMxRef("SVGFEOffsetElement")}}
- {{DOMxRef("SVGFEPointLightElement")}}
- {{DOMxRef("SVGFESpecularLightingElement")}}
- {{DOMxRef("SVGFESpotLightElement")}}
- {{DOMxRef("SVGFETileElement")}}
- {{DOMxRef("SVGFETurbulenceElement")}}
- {{DOMxRef("SVGFilterElement")}}
- {{DOMxRef("SVGForeignObjectElement")}}
- {{DOMxRef("SVGGElement")}}
- {{DOMxRef("SVGGeometryElement")}}
- {{DOMxRef("SVGGradientElement")}}
- {{DOMxRef("SVGGraphicsElement")}}
- {{DOMxRef("SVGImageElement")}}
- {{DOMxRef("SVGLinearGradientElement")}}
- {{DOMxRef("SVGLineElement")}}
- {{DOMxRef("SVGMarkerElement")}} {{Experimental_Inline}}
- {{DOMxRef("SVGMaskElement")}}
- {{DOMxRef("SVGMetadataElement")}}
- {{DOMxRef("SVGMPathElement")}}
- {{DOMxRef("SVGPathElement")}}
- {{DOMxRef("SVGPatternElement")}}
- {{DOMxRef("SVGPolylineElement")}}
- {{DOMxRef("SVGPolygonElement")}}
- {{DOMxRef("SVGRadialGradientElement")}}
- {{DOMxRef("SVGRectElement")}}
- {{DOMxRef("SVGScriptElement")}}
- {{DOMxRef("SVGSetElement")}}
- {{DOMxRef("SVGStopElement")}}
- {{DOMxRef("SVGStyleElement")}}
- {{DOMxRef("SVGSVGElement")}}
- {{DOMxRef("SVGSwitchElement")}}
- {{DOMxRef("SVGSymbolElement")}}
- {{DOMxRef("SVGTextContentElement")}}
- {{DOMxRef("SVGTextElement")}}
- {{DOMxRef("SVGTextPathElement")}}
- {{DOMxRef("SVGTextPositioningElement")}}
- {{DOMxRef("SVGTitleElement")}}
- {{DOMxRef("SVGTSpanElement")}}
- {{DOMxRef("SVGUseElement")}}
- {{DOMxRef("SVGViewElement")}}

### Giao diện kiểu dữ liệu SVG

Đây là các DOM API cho các kiểu dữ liệu được sử dụng trong định nghĩa các thuộc tính và giá trị thuộc tính SVG.

#### Kiểu tĩnh

- {{DOMxRef("SVGAngle")}}
- {{DOMxRef("SVGLength")}}
- {{DOMxRef("SVGLengthList")}}
- {{DOMxRef("SVGNumber")}}
- {{DOMxRef("SVGNumberList")}}
- {{DOMxRef("SVGPreserveAspectRatio")}}
- {{DOMxRef("SVGStringList")}}
- {{DOMxRef("SVGTransform")}}
- {{DOMxRef("SVGTransformList")}}

#### Kiểu hoạt hình

- {{DOMxRef("SVGAnimatedAngle")}}
- {{DOMxRef("SVGAnimatedBoolean")}}
- {{DOMxRef("SVGAnimatedEnumeration")}}
- {{DOMxRef("SVGAnimatedInteger")}}
- {{DOMxRef("SVGAnimatedLength")}}
- {{DOMxRef("SVGAnimatedLengthList")}}
- {{DOMxRef("SVGAnimatedNumber")}}
- {{DOMxRef("SVGAnimatedNumberList")}}
- {{DOMxRef("SVGAnimatedPreserveAspectRatio")}}
- {{DOMxRef("SVGAnimatedRect")}}
- {{DOMxRef("SVGAnimatedString")}}
- {{DOMxRef("SVGAnimatedTransformList")}}

### Giao diện liên quan đến SMIL

- {{DOMxRef("TimeEvent")}}

### Các giao diện SVG khác

- {{DOMxRef("ShadowAnimation")}}
- {{DOMxRef("SVGUnitTypes")}}
- {{DOMxRef("SVGUseElementShadowRoot")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Bắt đầu với SVG](/en-US/docs/Web/SVG)
