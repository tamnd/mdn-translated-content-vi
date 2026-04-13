---
title: HTMLParamElement
slug: Web/API/HTMLParamElement
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.HTMLParamElement
---

{{APIRef("HTML DOM")}}{{Deprecated_Header}}

Giao diện **`HTMLParamElement`** cung cấp các thuộc tính đặc biệt (ngoài những thuộc tính của giao diện đối tượng {{domxref("HTMLElement")}} thông thường mà nó kế thừa) để thao tác các phần tử {{HTMLElement("param")}}, đại diện cho cặp khóa và giá trị hoạt động như tham số cho phần tử {{HTMLElement("object")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha là {{domxref("HTMLElement")}}._

- {{domxref("HTMLParamElement.name")}} {{Deprecated_Inline}}
  - : Chuỗi đại diện cho tên của tham số. Nó phản ánh thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/param#name).
- {{domxref("HTMLParamElement.value")}} {{Deprecated_Inline}}
  - : Chuỗi đại diện cho giá trị liên kết với tham số. Nó phản ánh thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/param#value).
- {{domxref("HTMLParamElement.type")}} {{Deprecated_Inline}}
  - : Chuỗi chứa kiểu của tham số khi `valueType` có giá trị `"ref"`. Nó phản ánh thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/param#type).
- {{domxref("HTMLParamElement.valueType")}} {{Deprecated_Inline}}
  - : Chuỗi chứa kiểu của `value`. Nó phản ánh thuộc tính [valuetype](/en-US/docs/Web/HTML/Reference/Elements/param#valuetype) và có một trong các giá trị: `"data"`, `"ref"` hoặc `"object"`.

## Phương thức phiên bản

_Không có phương thức cụ thể, kế thừa các phương thức từ giao diện cha là {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("param") }}.
