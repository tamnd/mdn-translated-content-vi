---
title: HTMLLegendElement
slug: Web/API/HTMLLegendElement
page-type: web-api-interface
browser-compat: api.HTMLLegendElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLLegendElement`** cho phép truy cập các thuộc tính của các phần tử {{HTMLElement("legend")}}. Nó kế thừa các thuộc tính và phương thức từ giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLLegendElement.align")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho căn chỉnh so với tập biểu mẫu.
- {{domxref("HTMLLegendElement.form")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLFormElement")}} đại diện cho biểu mẫu mà legend này thuộc về. Nếu legend có phần tử fieldset là phần tử cha, thuộc tính này trả về cùng giá trị với thuộc tính **form** trên phần tử fieldset cha. Ngược lại, nó trả về `null`.

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("legend")}}
