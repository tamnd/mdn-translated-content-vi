---
title: <xsl:output>
slug: Web/XML/XSLT/Reference/Element/output
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:output>` điều khiển các đặc tính của tài liệu đầu ra. Để hoạt động đúng trong Netscape, phải dùng phần tử này cùng với thuộc tính method. Từ phiên bản 7.0, `method="text"` hoạt động như mong đợi.

## Syntax

```xml
<xsl:output
  method="xml" | "html" | "text"
  version=STRING
  encoding=STRING
  omit-xml-declaration="yes" | "no"
  standalone="yes" | "no"
  doctype-public=STRING
  doctype-system=STRING
  cdata-section-elements=LIST-OF-NAMES
  indent="yes" | "no"
  media-type=STRING />
```

### Required Attributes

Không có.

### Optional Attributes

- `method`
  - : Chỉ định định dạng đầu ra.
- `version`
  - : Chỉ định giá trị của thuộc tính version của khai báo XML hoặc HTML trong tài liệu đầu ra. Thuộc tính này chỉ được dùng khi `method="html"` hoặc `method="xml"`.
- `encoding`
  - : Chỉ định giá trị của thuộc tính `encoding` trong tài liệu đầu ra.
- `omit-xml-declaration`
  - : Cho biết có bao gồm khai báo XML trong đầu ra hay không. Các giá trị chấp nhận là `yes` hoặc `no`.
- `standalone` (Không được hỗ trợ.)
  - : Nếu có, cho biết khai báo standalone nên xuất hiện trong tài liệu đầu ra và cung cấp giá trị của nó. Các giá trị chấp nhận là `yes` hoặc `no`.
- `doctype-public`
  - : Chỉ định giá trị của thuộc tính `PUBLIC` của khai báo `DOCTYPE` trong tài liệu đầu ra.
- `doctype-system`
  - : Chỉ định giá trị của thuộc tính `SYSTEM` của khai báo `DOCTYPE` trong tài liệu đầu ra.
- `cdata-section-elements`
  - : Liệt kê các phần tử mà nội dung văn bản của chúng nên được ghi dưới dạng các phần `CDATA`. Các phần tử nên được phân tách bằng khoảng trắng.
- `indent` (Không được hỗ trợ.)
  - : Chỉ định liệu đầu ra có nên được thụt dòng để thể hiện cấu trúc phân cấp của nó hay không.
- `media-type` (Không được hỗ trợ.)
  - : Chỉ định MIME type của tài liệu đầu ra.

### Type

Top-level, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Specifications

XSLT, section 16.

## Gecko support

Hỗ trợ một phần. Xem phần ghi chú ở trên.
