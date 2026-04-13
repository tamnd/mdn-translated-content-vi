---
title: DOMParser
slug: Web/API/DOMParser
page-type: web-api-interface
browser-compat: api.DOMParser
---

{{APIRef("DOM")}}

Giao diện **`DOMParser`** cung cấp khả năng phân tích cú pháp mã nguồn {{Glossary("XML")}} hoặc {{Glossary("HTML")}} từ một chuỗi thành một {{domxref("Document")}} DOM.

Bạn có thể thực hiện thao tác ngược lại, chuyển đổi cây DOM thành nguồn XML hoặc HTML, bằng cách sử dụng giao diện {{domxref("XMLSerializer")}}.

Trong trường hợp tài liệu HTML, bạn cũng có thể thay thế các phần của DOM bằng các cây DOM mới được xây dựng từ HTML bằng cách đặt giá trị của thuộc tính {{domxref("Element.innerHTML")}} và {{domxref("Element.outerHTML", "outerHTML")}}. Các thuộc tính này cũng có thể được đọc để lấy các đoạn HTML tương ứng với cây con DOM.

Lưu ý rằng {{domxref("XMLHttpRequest")}} có thể phân tích cú pháp XML và HTML trực tiếp từ tài nguyên có thể địa chỉ URL, trả về một `Document` trong thuộc tính {{domxref("XMLHttpRequest.response", "response")}} của nó.

> [!NOTE]
> Lưu ý rằng [các phần tử cấp khối](/en-US/docs/Glossary/Block-level_content) như `<p>` sẽ tự động đóng nếu một phần tử cấp khối khác được lồng bên trong và do đó được phân tích trước thẻ đóng `</p>`.

## Hàm khởi tạo

- {{domxref("DOMParser.DOMParser","DOMParser()")}}
  - : Tạo một đối tượng `DOMParser` mới.

## Phương thức phiên bản

- {{domxref("DOMParser.parseFromString()")}}
  - : Phân tích cú pháp một phiên bản {{domxref("TrustedHTML")}} hoặc chuỗi đầu vào dưới dạng HTML hoặc XML và trả về một {{domxref("Document")}}.

## Ví dụ

Tài liệu về {{domxref("DOMParser.parseFromString()")}}, phương thức duy nhất của giao diện này, chứa các ví dụ về phân tích cú pháp chuỗi XML, SVG và HTML.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Parsing and serializing XML](/en-US/docs/Web/XML/Guides/Parsing_and_serializing_XML)
- {{domxref("XMLHttpRequest")}}
- {{domxref("XMLSerializer")}}
- {{jsxref("JSON.parse()")}} - tương đương cho tài liệu {{jsxref("JSON")}}.
