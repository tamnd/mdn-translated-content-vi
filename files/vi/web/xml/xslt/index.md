---
title: "XSLT: Extensible Stylesheet Language Transformations"
short-title: XSLT
slug: Web/XML/XSLT
page-type: landing-page
sidebar: xmlsidebar
---

**Extensible Stylesheet Language Transformations (XSLT)** là một ngôn ngữ dựa trên [XML](/en-US/docs/Web/XML/Guides/XML_introduction) được dùng, kết hợp với phần mềm xử lý chuyên dụng, để chuyển đổi các tài liệu XML.

Mặc dù quá trình này được gọi là "chuyển đổi", tài liệu gốc không bị thay đổi; thay vào đó, một tài liệu XML mới được tạo dựa trên nội dung của tài liệu hiện có. Sau đó, tài liệu mới có thể được bộ xử lý tuần tự hóa (xuất ra) theo cú pháp XML chuẩn hoặc ở một định dạng khác, chẳng hạn như [HTML](/en-US/docs/Web/HTML) hoặc văn bản thuần.

XSLT thường được dùng để chuyển đổi dữ liệu giữa các lược đồ XML khác nhau hoặc để chuyển dữ liệu XML thành các trang web hay tài liệu PDF.

## Tham khảo

Trang [tham khảo XSLT](/en-US/docs/Web/XML/XSLT/Reference) cung cấp thông tin chi tiết về XSLT, bao gồm các phần tử có sẵn.

- [Tham khảo các phần tử XSLT](/en-US/docs/Web/XML/XSLT/Reference/Element)
  - : Trang này mô tả các phần tử XSLT, tập trung vào các phần tử cấp cao nhất được dùng trong `<xsl:stylesheet>` hoặc `<xsl:transform>` và các chỉ thị cho mẫu.
    Nó cũng tóm lược ngắn gọn các literal result elements (LRE), là những phần tử không phải chỉ thị được sao chép trực tiếp như `<hr>` vào đầu ra, và các attribute value template dùng biểu thức XPath để đặt giá trị thuộc tính.

## Hướng dẫn

Các [hướng dẫn XSLT](/en-US/docs/Web/XML/XSLT/Guides) mô tả cách chuyển đổi XML, cách dùng tham số PI và các lỗi XSLT thường gặp.

- [Chuyển đổi XML bằng XSLT](/en-US/docs/Web/XML/XSLT/Guides/Transforming_XML_with_XSLT)
  - : XSLT cho phép tác giả stylesheet chuyển đổi một tài liệu XML chính theo hai cách quan trọng: thao tác và sắp xếp nội dung, bao gồm cả việc sắp xếp lại toàn bộ nếu muốn, và chuyển đổi nội dung sang một định dạng khác.
- [Chỉ định tham số bằng processing instruction](/en-US/docs/Web/XML/XSLT/Guides/PI_Parameters)
  - : Firefox cho phép chỉ định tham số stylesheet khi dùng processing instruction `<?xml-stylesheet?>`. Việc này được thực hiện bằng PI `<?xslt-param?>` được mô tả trong tài liệu này.
- [Lỗi XSLT thường gặp](/en-US/docs/Web/XML/XSLT/Guides/Common_errors)
  - : Bài viết này liệt kê một số vấn đề thường gặp khi dùng XSLT trong Firefox.

## Xem thêm

- [XML](/en-US/docs/Web/XML)
- [XPath](/en-US/docs/Web/XML/XPath)
- [Giới thiệu XSLT](https://www.w3schools.com/xml/xsl_intro.asp) cách dùng XSLT để chuyển đổi tài liệu XML sang các định dạng khác, như XHTML trên w3schools.com
- [XSLT là gì?](https://www.xml.com/pub/a/2000/08/holman/) giới thiệu về XSLT và XPath, giả định không có kiến thức trước đó về các công nghệ này
