---
title: Thuộc tính toàn cục HTML draggable
short-title: draggable
slug: Web/HTML/Reference/Global_attributes/draggable
page-type: html-attribute
browser-compat: html.global_attributes.draggable
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`draggable`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) là thuộc tính [enumerated](/en-US/docs/Glossary/Enumerated) cho biết liệu phần tử có thể được kéo hay không, bằng hành vi trình duyệt gốc hoặc [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API).

Thuộc tính `draggable` có thể được áp dụng cho các phần tử thuộc chính xác về [không gian tên HTML](/en-US/docs/Glossary/Namespace), có nghĩa là nó không thể được áp dụng cho [SVG](/en-US/docs/Web/SVG).
Để biết thêm thông tin về khai báo không gian tên trông như thế nào và chúng làm gì, xem [Namespace crash course](/en-US/docs/Web/SVG/Guides/Namespaces_crash_course).

`draggable` có thể có các giá trị sau:

- `true`: phần tử có thể được kéo.
- `false`: phần tử không thể được kéo.

> [!WARNING]
> Thuộc tính này là _[enumerated](/en-US/docs/Glossary/Enumerated)_ chứ không phải _Boolean_. Giá trị `true` hoặc `false` là bắt buộc, và viết tắt như `<img draggable>` bị cấm. Cách dùng đúng là `<img draggable="true">`.

Nếu thuộc tính này không được đặt, giá trị mặc định của nó là `auto`, có nghĩa là hành vi kéo là hành vi trình duyệt mặc định: chỉ các vùng chọn văn bản, hình ảnh và liên kết có thể được kéo. Đối với các phần tử khác, sự kiện {{domxref('HTMLElement.dragstart_event', 'ondragstart')}} phải được đặt để kéo và thả hoạt động, như được hiển thị trong [ví dụ toàn diện](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations) này.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
