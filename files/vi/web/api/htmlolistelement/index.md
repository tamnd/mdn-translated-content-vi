---
title: HTMLOListElement
slug: Web/API/HTMLOListElement
page-type: web-api-interface
browser-compat: api.HTMLOListElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLOListElement`** cung cấp các thuộc tính đặc biệt (ngoài các thuộc tính được xác định trên giao diện {{domxref("HTMLElement")}} thông thường mà nó cũng có thông qua kế thừa) để thao tác các phần tử danh sách có thứ tự.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLOListElement.reversed")}}
  - : Giá trị boolean phản ánh [`reversed`](/en-US/docs/Web/HTML/Reference/Elements/ol#reversed) và xác định xem đánh số có giảm dần hay không, tức là giá trị của nó là `true`, hoặc tăng dần (`false`).
- {{domxref("HTMLOListElement.start")}}
  - : Giá trị `long` phản ánh [`start`](/en-US/docs/Web/HTML/Reference/Elements/ol#start) và xác định giá trị của số đầu tiên của phần tử đầu tiên trong danh sách.
- {{domxref("HTMLOListElement.type")}}
  - : Giá trị chuỗi phản ánh [`type`](/en-US/docs/Web/HTML/Reference/Elements/ol#type) và xác định loại dấu hiệu được sử dụng để hiển thị. Có thể có các giá trị sau:
    - `'1'` nghĩa là sử dụng số thập phân: `1`, `2`, `3`, `4`, `5`, …
    - `'a'` nghĩa là sử dụng bảng chữ cái latinh viết thường: `a`, `b`, `c`, `d`, `e`, …
    - `'A'` nghĩa là sử dụng bảng chữ cái latinh viết hoa: `A`, `B`, `C`, `D`, `E`, …
    - `'i'` nghĩa là sử dụng chữ số La Mã viết thường: `i`, `ii`, `iii`, `iv`, `v`, …
    - `'I'` nghĩa là sử dụng chữ số La Mã viết hoa: `I`, `II`, `III`, `IV`, `V`, …

- {{domxref("HTMLOListElement.compact")}} {{deprecated_inline}}
  - : Giá trị boolean cho biết rằng khoảng cách giữa các mục danh sách nên được giảm. Thuộc tính này chỉ phản ánh thuộc tính [`compact`](/en-US/docs/Web/HTML/Reference/Elements/ol#compact), không xem xét thuộc tính CSS {{cssxref("line-height")}} được sử dụng cho hành vi đó trong các trang hiện đại.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML thực hiện giao diện này: {{ HTMLElement("ol") }}.
