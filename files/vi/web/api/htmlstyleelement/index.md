---
title: HTMLStyleElement
slug: Web/API/HTMLStyleElement
page-type: web-api-interface
browser-compat: api.HTMLStyleElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLStyleElement`** đại diện cho phần tử {{HTMLElement("style")}}. Nó kế thừa các thuộc tính và phương thức từ phần tử cha, {{domxref("HTMLElement")}}.

Giao diện này không cho phép thao tác CSS chứa bên trong nó (trong hầu hết các trường hợp). Để thao tác CSS, xem [Sử dụng thông tin kiểu dáng động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information) để có tổng quan về các đối tượng được sử dụng để thao tác với các thuộc tính CSS đã chỉ định bằng DOM.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLStyleElement.blocking")}}
  - : Một chuỗi cho biết rằng một số thao tác nhất định nên bị chặn khi tải các tài nguyên con quan trọng. Nó phản ánh thuộc tính `blocking` của phần tử {{HTMLElement("style")}}.
- {{domxref("HTMLStyleElement.media")}}
  - : Một chuỗi phản ánh thuộc tính HTML đại diện cho phương tiện đích dự kiến cho thông tin kiểu dáng.
- {{domxref("HTMLStyleElement.type")}} {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML đại diện cho loại kiểu dáng được áp dụng bởi câu lệnh này.
- {{domxref("HTMLStyleElement.disabled")}}
  - : Một giá trị boolean cho biết stylesheet liên quan có bị tắt hay không.
- {{domxref("HTMLStyleElement.sheet")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("CSSStyleSheet")}} liên quan đến phần tử đã cho, hoặc `null` nếu không có.

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("style")}}.
- [Sử dụng thông tin kiểu dáng động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information) để xem cách thao tác CSS.
