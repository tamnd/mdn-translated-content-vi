---
title: HTMLLIElement
slug: Web/API/HTMLLIElement
page-type: web-api-interface
browser-compat: api.HTMLLIElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLLIElement`** hiển thị các thuộc tính và phương thức đặc thù (ngoài những gì được định nghĩa bởi giao diện {{domxref("HTMLElement")}} thông thường mà nó cũng có thể truy cập thông qua kế thừa) để thao tác với các phần tử danh sách.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLLIElement.type")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho kiểu của dấu đầu dòng, `"disc"`, `"square"` hoặc `"circle"`. Vì cách chuẩn để định nghĩa kiểu danh sách là thông qua thuộc tính CSS {{cssxref("list-style-type")}}, hãy sử dụng các phương thức CSSOM để đặt nó qua script.
- {{domxref("HTMLLIElement.value")}}
  - : Một số nguyên cho biết vị trí thứ tự của _phần tử danh sách_ trong {{HTMLElement("ol")}} đã cho. Nó phản ánh thuộc tính `value` của phần tử HTML {{HTMLElement("li")}} và có thể nhỏ hơn `0`. Nếu phần tử {{HTMLElement("li")}} không phải là con của phần tử {{HTMLElement("ol")}}, thuộc tính này không có ý nghĩa.

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("li")}}
