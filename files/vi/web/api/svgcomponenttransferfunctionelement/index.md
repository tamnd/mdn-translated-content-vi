---
title: SVGComponentTransferFunctionElement
slug: Web/API/SVGComponentTransferFunctionElement
page-type: web-api-interface
browser-compat: api.SVGComponentTransferFunctionElement
---

{{APIRef("SVG")}}

Giao diện **`SVGComponentTransferFunctionElement`** đại diện cho giao diện cơ sở được sử dụng bởi các giao diện hàm chuyển đổi thành phần.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("SVGElement")}}._

- {{domxref("SVGComponentTransferFunctionElement.type")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("type")}} của phần tử đã cho. Nó nhận một trong các hằng số `SVG_FECOMPONENTTRANSFER_TYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGComponentTransferFunctionElement.tableValues")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumberList")}} tương ứng với thuộc tính {{SVGAttr("tableValues")}} của phần tử đã cho.
- {{domxref("SVGComponentTransferFunctionElement.slope")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("slope")}} của phần tử đã cho.
- {{domxref("SVGComponentTransferFunctionElement.intercept")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("intercept")}} của phần tử đã cho.
- {{domxref("SVGComponentTransferFunctionElement.amplitude")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("amplitude")}} của phần tử đã cho.
- {{domxref("SVGComponentTransferFunctionElement.exponent")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("exponent")}} của phần tử đã cho.
- {{domxref("SVGComponentTransferFunctionElement.offset")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("offset")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức cụ thể nào, nhưng triển khai các phương thức của cha nó là {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_FECOMPONENTTRANSFER_TYPE_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được định nghĩa trước. Việc cố định nghĩa một giá trị mới có kiểu này hoặc chuyển đổi một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_FECOMPONENTTRANSFER_TYPE_IDENTITY` (1)
  - : Tương ứng với giá trị `identity`.
- `SVG_FECOMPONENTTRANSFER_TYPE_TABLE` (2)
  - : Tương ứng với giá trị `table`.
- `SVG_FECOMPONENTTRANSFER_TYPE_DISCRETE` (3)
  - : Tương ứng với giá trị `discrete`.
- `SVG_FECOMPONENTTRANSFER_TYPE_LINEAR` (4)
  - : Tương ứng với giá trị `linear`.
- `SVG_FECOMPONENTTRANSFER_TYPE_GAMMA` (5)
  - : Tương ứng với giá trị `gamma`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEFuncAElement")}}
- {{domxref("SVGFEFuncBElement")}}
- {{domxref("SVGFEFuncGElement")}}
- {{domxref("SVGFEFuncRElement")}}
