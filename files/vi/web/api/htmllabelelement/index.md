---
title: HTMLLabelElement
slug: Web/API/HTMLLabelElement
page-type: web-api-interface
browser-compat: api.HTMLLabelElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLLabelElement`** cung cấp quyền truy cập vào các thuộc tính đặc thù của các phần tử {{HTMLElement("label")}}. Nó kế thừa các phương thức và thuộc tính từ giao diện cơ sở {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLLabelElement.control")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLElement")}} đại diện cho điều khiển được liên kết với nhãn.
- {{domxref("HTMLLabelElement.form")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("HTMLFormElement")}} đại diện cho biểu mẫu mà điều khiển được gắn nhãn liên kết, hoặc `null` nếu không có điều khiển liên kết, hoặc điều khiển đó không liên kết với biểu mẫu. Nói cách khác, đây chỉ là lối tắt cho `HTMLLabelElement.control.form`.
- {{domxref("HTMLLabelElement.htmlFor")}}
  - : Một chuỗi chứa ID của điều khiển được gắn nhãn. Điều này phản ánh thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Elements/label#for).

> [!NOTE]
> Để đặt thuộc tính `for` theo chương trình, hãy sử dụng [`htmlFor`](/en-US/docs/Web/API/HTMLLabelElement/htmlFor).

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("label")}}
- {{HTMLElement("form")}}
- {{domxref("HTMLFormElement")}}
