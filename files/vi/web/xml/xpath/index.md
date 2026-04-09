---
title: XPath
slug: Web/XML/XPath
page-type: landing-page
sidebar: xmlsidebar
---

XPath là viết tắt của XML Path Language. Nó dùng cú pháp không phải XML để cung cấp một cách linh hoạt nhằm định vị (chỉ tới) các phần khác nhau của tài liệu [XML](/en-US/docs/Web/XML/Guides/XML_introduction). Nó cũng có thể được dùng để kiểm tra các node đã được định vị trong tài liệu xem chúng có khớp với một mẫu nào đó hay không.

XPath chủ yếu được dùng trong [XSLT](/en-US/docs/Web/XML/XSLT), nhưng cũng có thể được dùng như một cách mạnh mẽ hơn nhiều để điều hướng qua [DOM](/en-US/docs/Web/API/Document_Object_Model) của bất kỳ tài liệu ngôn ngữ kiểu XML nào bằng {{DOMxRef("XPathExpression")}}, chẳng hạn như [HTML](/en-US/docs/Web/HTML) và [SVG](/en-US/docs/Web/SVG), thay vì phụ thuộc vào các phương thức {{DOMxRef("Document.getElementById()")}} hoặc {{DOMxRef("Document.querySelectorAll()")}}, các thuộc tính {{DOMxRef("Node.childNodes")}} và các tính năng DOM Core khác.

XPath dùng ký hiệu dạng đường dẫn (như trong URL) để điều hướng qua cấu trúc phân cấp của tài liệu XML. Nó dùng cú pháp không phải XML để có thể được sử dụng trong URI và các giá trị thuộc tính XML.

## Hướng dẫn

Các [hướng dẫn XPath](/en-US/docs/Web/XML/XPath/Guides) bao gồm các đoạn mã thực hành và mô tả cách dùng XPath trong JavaScript.

- [Giới thiệu về việc sử dụng XPath trong JavaScript](/en-US/docs/Web/XML/XPath/Guides/Introduction_to_using_XPath_in_JavaScript)
  - : Mô tả một cách dùng XPath không thông qua XSLT.
- [Các đoạn mã XPath](/en-US/docs/Web/XML/XPath/Guides/Snippets)
  - : Đây là các hàm tiện ích JavaScript, có thể được dùng trong mã của bạn, dựa trên các API XPath.

## Tham khảo

Phần [tham khảo XPath](/en-US/docs/Web/XML/XPath/Reference) bao gồm tất cả các axis và hàm XPath được tài liệu hóa trên MDN.

- [XPath:Axes](/en-US/docs/Web/XML/XPath/Reference/Axes)
  - : Danh sách và định nghĩa các axis được xác định trong đặc tả XPath. Axis được dùng để mô tả quan hệ giữa các node.
- [XPath:Functions](/en-US/docs/Web/XML/XPath/Reference/Functions)
  - : Danh sách và mô tả các hàm XPath cốt lõi và các phần bổ sung dành riêng cho XSLT.

## Xem thêm

- [XSLT](/en-US/docs/Web/XML/XSLT), [XML](/en-US/docs/Web/XML), [DOM](/en-US/docs/Web/API/Document_Object_Model)
- [Biến đổi XML bằng XSLT](/en-US/docs/Web/XML/XSLT/Guides/Transforming_XML_with_XSLT)
- [So sánh CSS Selector và XPath](/en-US/docs/Web/XML/XPath/Guides/Comparison_with_CSS_selectors)
- [XSLT là gì?](https://www.xml.com/pub/a/2000/08/holman/) giới thiệu XSLT và XPath, bao gồm bối cảnh, cấu trúc, khái niệm và thuật ngữ - xml.com (2000)
- [XPath tester](https://extendsclass.com/xpath-tester.html) trình xây dựng/gỡ lỗi XPath trực tuyến
