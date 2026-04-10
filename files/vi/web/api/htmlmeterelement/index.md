---
title: HTMLMeterElement
slug: Web/API/HTMLMeterElement
page-type: web-api-interface
browser-compat: api.HTMLMeterElement
---

{{APIRef("HTML DOM")}}

Các phần tử HTML {{HTMLElement("meter")}} triển khai giao diện **`HTMLMeterElement`**, giao diện này cung cấp các thuộc tính và phương thức đặc biệt (bên cạnh giao diện {{domxref("HTMLElement")}} mà chúng cũng có thể truy cập thông qua kế thừa) để thao tác bố cục và trình bày của các phần tử {{HTMLElement("meter")}}.

{{InheritanceDiagram}}

## Thuộc tính instance

_Cũng kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLMeterElement.high")}}
  - : Một số `double` đại diện cho giá trị ngưỡng cao, phản ánh thuộc tính [`high`](/en-US/docs/Web/HTML/Reference/Elements/meter#high).
- {{domxref("HTMLMeterElement.low")}}
  - : Một số `double` đại diện cho giá trị ngưỡng thấp, phản ánh thuộc tính [`low`](/en-US/docs/Web/HTML/Reference/Elements/meter#low).
- {{domxref("HTMLMeterElement.max")}}
  - : Một số `double` đại diện cho giá trị tối đa, phản ánh thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/meter#max).
- {{domxref("HTMLMeterElement.min")}}
  - : Một số `double` đại diện cho giá trị tối thiểu, phản ánh thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/meter#min).
- {{domxref("HTMLMeterElement.optimum")}}
  - : Một số `double` đại diện cho giá trị tối ưu, phản ánh thuộc tính [`optimum`](/en-US/docs/Web/HTML/Reference/Elements/meter#optimum).
- {{domxref("HTMLMeterElement.value")}}
  - : Một số `double` đại diện cho giá trị hiện tại, phản ánh thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/meter#value).
- {{domxref("HTMLMeterElement.labels")}} {{ReadOnlyInline}}
  - : Một {{domxref("NodeList")}} chứa các phần tử {{HTMLElement("label")}} liên kết với phần tử.

## Phương thức instance

_Giao diện này không triển khai phương thức cụ thể nào mà kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("meter")}}
