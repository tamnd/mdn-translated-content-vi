---
title: HTMLEmbedElement
slug: Web/API/HTMLEmbedElement
page-type: web-api-interface
browser-compat: api.HTMLEmbedElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLEmbedElement`** cung cấp các thuộc tính đặc biệt (ngoài giao diện {{domxref("HTMLElement")}} thông thường mà nó cũng có thể truy cập thông qua kế thừa) để thao tác với các phần tử {{HTMLElement("embed")}}.

> [!NOTE]
> Chủ đề này mô tả giao diện `HTMLEmbedElement` như được định nghĩa trong tiêu chuẩn. Nó không đề cập đến phiên bản cũ hơn, không được chuẩn hóa của giao diện.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLEmbedElement.align")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho một thuộc tính liệt kê chỉ ra căn chỉnh nội dung của phần tử so với ngữ cảnh xung quanh. Các giá trị có thể là `"left"`, `"right"`, `"center"` và `"justify"`.
- {{domxref("HTMLEmbedElement.height")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/embed#height), chứa chiều cao hiển thị của tài nguyên.
- {{domxref("HTMLEmbedElement.name")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho tên của đối tượng nhúng.
- {{domxref("HTMLEmbedElement.src")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/embed#src), chứa địa chỉ của tài nguyên.
- {{domxref("HTMLEmbedElement.type")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`type`](/en-US/docs/Web/HTML/Reference/Elements/embed#type), chứa kiểu của tài nguyên.
- {{domxref("HTMLEmbedElement.width")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/embed#width), chứa chiều rộng hiển thị của tài nguyên.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLEmbedElement.getSVGDocument()")}}
  - : Trả về SVG được nhúng dưới dạng {{domxref("Document")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("embed") }}
