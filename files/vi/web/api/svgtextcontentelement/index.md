---
title: SVGTextContentElement
slug: Web/API/SVGTextContentElement
page-type: web-api-interface
browser-compat: api.SVGTextContentElement
---

{{APIRef("SVG")}}

Giao diện **`SVGTextContentElement`** được triển khai bởi các phần tử hỗ trợ kết xuất nội dung văn bản con. Nó được kế thừa bởi các giao diện liên quan đến văn bản, chẳng hạn như {{domxref("SVGTextElement")}}, {{domxref("SVGTSpanElement")}} và {{domxref("SVGTextPathElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGTextContentElement.textLength")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} phản ánh thuộc tính {{SVGAttr("textLength")}} của phần tử đã cho.
- {{domxref("SVGTextContentElement.lengthAdjust")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} phản ánh thuộc tính {{SVGAttr("lengthAdjust")}} của phần tử đã cho. Các giá trị kiểu số đại diện cho một trong các giá trị hằng số `LENGTHADJUST_*`.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGTextContentElement.getNumberOfChars()")}}
  - : Trả về một số nguyên dài đại diện cho tổng số ký tự có thể định địa chỉ có sẵn để kết xuất trong phần tử hiện tại, bất kể chúng có được kết xuất hay không.
- {{domxref("SVGTextContentElement.getComputedTextLength()")}}
  - : Trả về một số thực đại diện cho độ dài được tính toán của văn bản bên trong phần tử.
- {{domxref("SVGTextContentElement.getSubStringLength()")}}
  - : Trả về một số thực đại diện cho độ dài được tính toán của khoảng cách tiến văn bản định dạng cho một chuỗi con văn bản trong phần tử. Lưu ý rằng phương thức này chỉ tính đến chiều rộng của các nét chữ trong chuỗi con và khoảng cách thêm được chèn bởi các thuộc tính CSS 'letter-spacing' và 'word-spacing'. Các điều chỉnh khoảng cách trực quan do thuộc tính 'x' thực hiện bị bỏ qua.
- {{domxref("SVGTextContentElement.getStartPositionOfChar()")}}
  - : Trả về một {{domxref("DOMPoint")}} đại diện cho vị trí của một ký tự đánh máy sau khi bố cục văn bản đã được thực hiện.
- {{domxref("SVGTextContentElement.getEndPositionOfChar()")}}
  - : Trả về một {{domxref("DOMPoint")}} đại diện cho vị trí kết thúc của một ký tự đánh máy sau khi bố cục văn bản đã được thực hiện.
- {{domxref("SVGTextContentElement.getExtentOfChar()")}}
  - : Trả về một {{domxref("DOMRect")}} đại diện cho hộp giới hạn chặt chẽ được tính toán của ô nét chữ tương ứng với một ký tự đánh máy đã cho.
- {{domxref("SVGTextContentElement.getRotationOfChar()")}}
  - : Trả về một số thực đại diện cho góc xoay của ký tự đánh máy.
- {{domxref("SVGTextContentElement.getCharNumAtPosition()")}}
  - : Trả về một số nguyên dài đại diện cho ký tự đã gây ra một nét chữ văn bản được kết xuất tại một vị trí nhất định trong hệ tọa độ. Vì mối quan hệ giữa các ký tự và nét chữ không phải là một-một, chỉ ký tự đầu tiên của ký tự đánh máy liên quan được trả về.
- {{domxref("SVGTextContentElement.selectSubString()")}} {{deprecated_inline}}
  - : Chọn văn bản trong phần tử.

## Thuộc tính tĩnh

- `LENGTHADJUST_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `LENGTHADJUST_SPACING` (1)
  - : Tương ứng với giá trị `spacing`.
- `LENGTHADJUST_SPACINGANDGLYPHS` (2)
  - : Tương ứng với giá trị `spacingAndGlyphs`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
