---
title: HTMLMapElement
slug: Web/API/HTMLMapElement
page-type: web-api-interface
browser-compat: api.HTMLMapElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLMapElement`** cung cấp các thuộc tính và phương thức đặc biệt (ngoài những thuộc tính và phương thức của đối tượng thông thường {{domxref("HTMLElement")}} mà nó cũng có thông qua kế thừa) để thao tác bố cục và hiển thị của các phần tử map.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ thực thể cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLMapElement.name")}}
  - : Một chuỗi đại diện cho phần tử {{HTMLElement("map")}} để tham chiếu đến nó trong ngữ cảnh khác. Nếu thuộc tính `id` được đặt, giá trị này phải giống nhau; và không thể là `null` hay rỗng.
- {{domxref("HTMLMapElement.areas")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLCollection")}} trực tiếp đại diện cho các phần tử {{HTMLElement("area")}} được liên kết với {{HTMLElement("map")}} này.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ thực thể cha, {{domxref("HTMLElement")}} ._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("map") }}.
