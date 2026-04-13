---
title: HTMLUListElement
slug: Web/API/HTMLUListElement
page-type: web-api-interface
browser-compat: api.HTMLUListElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLUListElement`** cung cấp các thuộc tính đặc biệt (ngoài những thuộc tính được định nghĩa trên giao diện {{domxref("HTMLElement")}} thông thường mà nó kế thừa) để thao tác các phần tử danh sách không có thứ tự ({{HTMLElement("ul")}}).

{{InheritanceDiagram}}

## Thuộc tính phiên _instance_

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLUListElement.type")}} {{deprecated_inline}}
  - : Một chuỗi giá trị phản ánh thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/ul#type) và xác định loại điểm đánh dấu được sử dụng để hiển thị. Các giá trị này phụ thuộc vào trình duyệt và chưa bao giờ được chuẩn hóa.
- {{domxref("HTMLUListElement.compact")}} {{deprecated_inline}}
  - : Một giá trị kiểu logic (boolean) cho biết khoảng cách giữa các mục danh sách có nên được giảm hay không. Thuộc tính này chỉ phản ánh thuộc tính [`compact`](/en-US/docs/Web/HTML/Reference/Elements/ul#compact), nó không xem xét thuộc tính CSS {{cssxref("line-height")}} được sử dụng cho hành vi đó trên các trang hiện đại.

## Phương thức phiên _instance_

_Không có phương thức cụ thể; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("ul") }}.
