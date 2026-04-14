---
title: <font>
slug: Web/HTML/Reference/Elements/font
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.font
sidebar: htmlsidebar
---

{{Deprecated_Header}}

Phần tử **`<font>`** trong [HTML](/en-US/docs/Web/HTML) định nghĩa cỡ chữ, màu sắc và kiểu chữ cho nội dung của nó.

> [!WARNING]
> Không dùng phần tử này. Hãy dùng các thuộc tính [Phông chữ](/en-US/docs/Web/CSS/Guides/Fonts) trong CSS để tạo kiểu văn bản.

## Thuộc tính

Giống như tất cả các phần tử HTML khác, phần tử này hỗ trợ [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `color` {{Deprecated_Inline}}
  - : Thuộc tính này đặt màu văn bản bằng tên màu hoặc màu được chỉ định theo định dạng thập lục phân #RRGGBB.
- `face` {{Deprecated_Inline}}
  - : Thuộc tính này chứa danh sách được phân tách bằng dấu phẩy của một hoặc nhiều tên phông chữ. Văn bản tài liệu theo kiểu mặc định được hiển thị bằng kiểu chữ đầu tiên mà trình duyệt của khách hàng hỗ trợ. Nếu không có phông chữ nào được liệt kê được cài đặt trên hệ thống cục bộ, trình duyệt thường mặc định về phông chữ tỷ lệ hoặc độ rộng cố định cho hệ thống đó.
- `size` {{Deprecated_Inline}}
  - : Thuộc tính này chỉ định cỡ chữ dưới dạng giá trị số hoặc tương đối. Các giá trị số từ `1` đến `7` với `1` là nhỏ nhất và `3` là mặc định. Nó có thể được định nghĩa bằng giá trị tương đối, như `+2` hoặc `-3`, đặt nó tương đối so với `3`, giá trị mặc định.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("HTMLFontElement")}}.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
