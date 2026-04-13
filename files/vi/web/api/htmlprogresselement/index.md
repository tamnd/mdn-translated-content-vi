---
title: HTMLProgressElement
slug: Web/API/HTMLProgressElement
page-type: web-api-interface
browser-compat: api.HTMLProgressElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLProgressElement`** cung cấp các thuộc tính và phương thức đặc biệt (ngoài giao diện {{domxref("HTMLElement")}} thông thường mà nó cũng có thông qua kế thừa) để thao tác bố cục và trình bày của các phần tử {{HTMLElement("progress")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLProgressElement.max")}}
  - : Giá trị `double` phản ánh thuộc tính nội dung có cùng tên, giới hạn ở các số lớn hơn 0. Giá trị mặc định của nó là `1.0`.
- {{domxref("HTMLProgressElement.position")}} {{ReadOnlyInline}}
  - : Trả về giá trị `double` là kết quả chia giá trị hiện tại (`value`) cho giá trị tối đa (`max`); nếu thanh tiến trình là thanh tiến trình không xác định, nó trả về `-1`.
- {{domxref("HTMLProgressElement.value")}}
  - : Giá trị `double` phản ánh giá trị hiện tại; nếu thanh tiến trình là thanh tiến trình không xác định, nó trả về `0`.
- {{domxref("HTMLProgressElement.labels")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("NodeList")}} chứa danh sách các phần tử {{HTMLElement("label")}} là nhãn cho phần tử này.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML thực hiện giao diện này: {{HTMLElement("progress")}}
