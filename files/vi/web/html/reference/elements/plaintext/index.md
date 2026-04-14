---
title: "<plaintext>: Phần tử văn bản thuần túy (lỗi thời)"
slug: Web/HTML/Reference/Elements/plaintext
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.plaintext
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<plaintext>`** trong [HTML](/en-US/docs/Web/HTML) hiển thị mọi thứ sau thẻ bắt đầu dưới dạng văn bản thô, bỏ qua bất kỳ HTML nào theo sau. Không có thẻ đóng, vì mọi thứ sau nó đều được coi là văn bản thô.

> [!WARNING]
> Không dùng phần tử này.
>
> - `<plaintext>` đã bị deprecated từ HTML 2, và không phải tất cả các trình duyệt đều triển khai nó. Các trình duyệt có triển khai nó cũng không thống nhất.
> - `<plaintext>` đã lỗi thời; các trình duyệt chấp nhận nó có thể coi nó như một phần tử {{HTMLElement("pre")}} vẫn giải thích HTML bên trong.
> - Nếu `<plaintext>` là phần tử đầu tiên trên trang (ngoại trừ các phần tử không hiển thị, như {{HTMLElement("head")}}), không dùng HTML ở tất cả. Thay vào đó hãy phục vụ một tệp văn bản với [MIME-type](/en-US/docs/Learn_web_development/Extensions/Server-side/Configuring_server_MIME_types) `text/plain`.
> - Thay vì `<plaintext>`, hãy dùng phần tử {{HTMLElement("pre")}} hoặc, nếu đúng ngữ nghĩa (chẳng hạn cho văn bản nội tuyến), phần tử {{HTMLElement("code")}}. Thoát các ký tự `<`, `>` và `&`, để ngăn trình duyệt vô tình phân tích nội dung phần tử dưới dạng HTML.
> - Phông chữ monospace có thể được áp dụng cho bất kỳ phần tử HTML nào qua kiểu [CSS](/en-US/docs/Web/CSS) {{cssxref("font-family")}} với giá trị chung `monospace`.

## Thuộc tính

Phần tử này không có thuộc tính nào khác ngoài [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) chung cho tất cả các phần tử.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref('HTMLElement')}}.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{HTMLElement("pre")}} và {{HTMLElement("code")}} nên được dùng thay thế.
- Phần tử {{HTMLElement("xmp")}}, cũng lỗi thời, tương tự `<plaintext>`.
