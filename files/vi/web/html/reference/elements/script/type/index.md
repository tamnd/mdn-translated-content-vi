---
title: Thuộc tính type của <script>
slug: Web/HTML/Reference/Elements/script/type
page-type: html-attribute
browser-compat: html.elements.script.type
sidebar: htmlsidebar
---

Thuộc tính **`type`** của phần tử [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) chỉ ra _loại_ script được biểu diễn bởi phần tử: một script cổ điển, một import map, một JavaScript module, speculation rules, hoặc một khối dữ liệu.

## Thuộc tính

Giá trị của thuộc tính này chỉ ra loại dữ liệu được biểu diễn bởi script, và sẽ là một trong những giá trị sau:

- **Thuộc tính không được đặt (mặc định), một chuỗi rỗng, hoặc một MIME type JavaScript**
  - : Chỉ ra rằng script là một "script cổ điển", chứa mã JavaScript.
    Các tác giả được khuyến khích bỏ qua thuộc tính nếu script tham chiếu đến mã JavaScript thay vì chỉ định một MIME type.
    Các MIME type JavaScript được [liệt kê trong đặc tả kiểu phương tiện IANA](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript).
- [`importmap`](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap)
  - : Giá trị này chỉ ra rằng phần thân của phần tử chứa một import map.
    Import map là một đối tượng JSON mà các nhà phát triển có thể sử dụng để kiểm soát cách trình duyệt giải quyết các chỉ định module khi nhập [các JavaScript module](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps).
- `module`
  - : Giá trị này khiến mã được xử lý như là một JavaScript module.
    Việc xử lý nội dung script bị trì hoãn.
    Các thuộc tính `charset` và `defer` không có hiệu lực.
    Để biết thông tin về việc sử dụng `module`, hãy xem hướng dẫn [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules) của chúng tôi.
    Không giống như các script cổ điển, các module script yêu cầu sử dụng giao thức CORS để tải từ nguồn gốc khác.
- [`speculationrules`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules) {{experimental_inline}}
  - : Giá trị này chỉ ra rằng phần thân của phần tử chứa speculation rules.
    Speculation rules có dạng một đối tượng JSON xác định những tài nguyên nào nên được tải trước hoặc prerender bởi trình duyệt. Đây là một phần của {{domxref("Speculation Rules API", "", "", "nocode")}}.
- **Bất kỳ giá trị nào khác**
  - : Nội dung được nhúng được xử lý như là một khối dữ liệu, và sẽ không được xử lý bởi trình duyệt.
    Các nhà phát triển phải sử dụng một MIME type hợp lệ không phải là MIME type JavaScript để biểu thị các khối dữ liệu.
    Tất cả các thuộc tính khác sẽ bị bỏ qua, bao gồm thuộc tính `src`.

> [!NOTE]
> Trong các trình duyệt cũ hơn, loại xác định ngôn ngữ scripting của mã được nhúng hoặc nhập (qua thuộc tính `src`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
