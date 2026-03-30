---
title: Phần tử thay thế
slug: Glossary/Replaced_elements
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong phát triển web, **replaced elements** (phần tử thay thế) là các phần tử HTML mà nội dung của chúng được thay thế bởi tài nguyên bên ngoài hoặc nội dung được định nghĩa bên ngoài cấu trúc tài liệu, và không được xem xét trong mô hình kết xuất CSS. Chúng là các đối tượng bên ngoài mà cách biểu diễn của chúng độc lập với mô hình định dạng CSS.

Các phần tử sau đây có thể là replaced elements:

- {{HTMLElement("img")}}
- {{HTMLElement("video")}}
- {{HTMLElement("iframe")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("fencedframe")}}

Các phần tử sau đây được xử lý như replaced elements chỉ trong một số trường hợp cụ thể:

- {{HTMLElement("audio")}}
- {{HTMLElement("canvas")}}
- {{HTMLElement("object")}}
- {{HTMLElement("input")}} (chỉ kiểu input `image`)

Replaced elements thường có {{glossary("intrinsic size", "kích thước nội tại")}} và {{glossary("aspect ratio", "tỷ lệ nội tại")}}. Ví dụ, nội dung của phần tử `<img>` thường được thay thế bằng hình ảnh được định nghĩa bởi thuộc tính `src` của nó. Hình ảnh đó có chiều rộng nội tại và chiều cao nội tại được chỉ định bằng đơn vị tuyệt đối, xác định tỷ lệ khung hình.

Các điều khiển biểu mẫu thường là các widget không thay thế, ngoại trừ `<input type="image">`, được thay thế bằng một hình ảnh. Các đối tượng được chèn bằng thuộc tính CSS {{cssxref("content")}} là _anonymous replaced elements_ (phần tử thay thế ẩn danh). Chúng là "ẩn danh" vì chúng không tồn tại trong đánh dấu HTML.

## Xem thêm

- {{glossary("void element", "Void elements")}}
- {{glossary("Inline-level content")}}
- [Replaced elements trong đặc tả CSS display](https://drafts.csswg.org/css-display/#replaced-element)
- [Replaced elements trong đặc tả HTML](https://html.spec.whatwg.org/multipage/rendering.html#replaced-elements)
