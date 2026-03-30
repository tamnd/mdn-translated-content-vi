---
title: Attribute
slug: Glossary/Attribute
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thuộc tính** (attribute) mở rộng một {{Glossary("HTML")}} hoặc {{Glossary("XML")}} {{Glossary("element", "phần tử")}}, thay đổi hành vi của nó hoặc cung cấp metadata.

Thuộc tính luôn có dạng `name="value"` (định danh thuộc tính theo sau là giá trị liên kết của nó). Bạn có thể thấy các thuộc tính không có dấu bằng hoặc giá trị. Đó là cách viết tắt để cung cấp chuỗi rỗng trong HTML. Tuy nhiên, điều này không hợp lệ trong XML: XML yêu cầu tất cả các thuộc tính phải có giá trị rõ ràng.

Một số thuộc tính HTML là {{Glossary("Boolean/HTML", "thuộc tính boolean")}}. Giá trị của các thuộc tính này chỉ được kiểm soát bởi sự có mặt hoặc vắng mặt của thuộc tính. Xem {{Glossary("Boolean/HTML", "thuộc tính boolean")}} để biết thêm thông tin.

## Phản ánh của thuộc tính

Thuộc tính có thể được _phản ánh_ vào một thuộc tính cụ thể của giao diện cụ thể.

Điều này có nghĩa là giá trị của thuộc tính có thể được đọc hoặc ghi trực tiếp trong JavaScript thông qua một thuộc tính trên giao diện tương ứng, và ngược lại. Các thuộc tính được phản ánh cung cấp cách tiếp cận lập trình tự nhiên hơn so với việc lấy và đặt thuộc tính bằng các phương thức {{domxref("Element.getAttribute()","getAttribute()")}} và {{domxref("Element.setAttribute()","setAttribute()")}} của giao diện {{domxref("Element")}}.

Để biết thêm thông tin, xem [Phản ánh thuộc tính](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes).

## Xem thêm

- [Tham chiếu thuộc tính HTML](/en-US/docs/Web/HTML/Reference/Attributes)
- [Phản ánh thuộc tính](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes)
- Thông tin về [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) của HTML
- Khuyến nghị W3C XML StartTag Attribute trong [W3C XML Recommendation](https://www.w3.org/TR/xml/#sec-starttags)
- Các thuật ngữ liên quan:
  - {{Glossary("Element")}}
  - {{Glossary("Tag")}}
  - {{Glossary("HTML")}}
  - {{Glossary("XML")}}
  - {{Glossary("Boolean/HTML", "Boolean attributes")}}
  - {{Glossary("Enumerated", "Enumerated attributes")}}
