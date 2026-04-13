---
title: HTMLTitleElement
slug: Web/API/HTMLTitleElement
page-type: web-api-interface
browser-compat: api.HTMLTitleElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLTitleElement`** được triển khai bởi {{ HTMLElement( "title" )}} của tài liệu. Phần tử này kế thừa tất cả các thuộc tính và phương thức của giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLTitleElement.text")}}
  - : Một chuỗi đại diện cho văn bản của tiêu đề tài liệu.

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Ví dụ

Đừng nhầm lẫn: `document.title` với `document.querySelector('title')`

Cái trước chỉ là phương thức setter/getter để đặt hoặc lấy giá trị văn bản bên trong tiêu đề tài liệu, trong khi cái sau là đối tượng `HTMLTitleElement`. Vì vậy bạn không thể viết: `document.title.text = "Hello world!";`

Thay vào đó, bạn có thể đơn giản viết: `document.title = "Hello world!";` tương đương với `document.querySelector('title').text = "Hello world!";`

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("title") }}.
