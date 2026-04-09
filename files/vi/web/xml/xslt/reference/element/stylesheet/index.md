---
title: <xsl:stylesheet>
slug: Web/XML/XSLT/Reference/Element/stylesheet
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:stylesheet>` (hoặc phần tử tương đương `<xsl:transform>`) là phần tử ngoài cùng của một stylesheet.

## Namespace Declaration

Một pseudo-attribute bắt buộc để xác định tài liệu là một stylesheet XSLT. Thông thường đây là `xmlns:xsl="http://www.w3.org/1999/XSL/Transform"`.

## Syntax

```xml
<xsl:stylesheet
  version="NUMBER"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  id="NAME"
  extension-element-prefixes="LIST-OF-NAMES"
  exclude-result-prefixes="LIST-OF-NAMES">
    ENTIRE STYLESHEET
</xsl:stylesheet>
```

### Required Attributes

- `version`
  - : Chỉ định phiên bản XSLT mà stylesheet này yêu cầu.

### Optional Attributes

- `exclude-result-prefixes`
  - : Chỉ định mọi namespace được dùng trong tài liệu này nhưng không nên được gửi ra tài liệu đầu ra. Danh sách được phân tách bằng khoảng trắng.
- `extension-element-prefixes`
  - : Chỉ định một danh sách các tiền tố namespace, được phân tách bằng khoảng trắng, cho các extension element trong tài liệu này.
- `default-collation`
  - : Chỉ định collation mặc định được dùng cho tất cả các biểu thức {{Glossary("XPath")}} xuất hiện trong thuộc tính hoặc text value template có phần tử này là tổ tiên, trừ khi bị ghi đè bởi một thuộc tính `default-collation` khác trên phần tử bên trong. Nó cũng xác định collation được dùng cho một số cấu trúc XSLT nhất định (chẳng hạn [`<xsl:key>`](/en-US/docs/Web/XML/XSLT/Reference/Element/key) và [`<xsl:for-each-group>`](/en-US/docs/Web/XSLT/Element/for-each-group)) trong phạm vi của nó.
- `default-mode`
  - : Xác định giá trị mặc định cho thuộc tính `mode` của tất cả các phần tử [`<xsl:template>`](/en-US/docs/Web/XML/XSLT/Reference/Element/template) và [`<xsl:apply-templates>`](/en-US/docs/Web/XML/XSLT/Reference/Element/apply-templates) trong phạm vi của nó.
- `default-validation`
  - : Xác định giá trị mặc định của thuộc tính `validation` của tất cả các chỉ thị liên quan xuất hiện trong phạm vi của nó.
- `expand-text`
  - : Xác định liệu các nút văn bản con của phần tử có được coi là text value template hay không.
- `id`
  - : Chỉ định một `id` cho stylesheet này. Điều này thường được dùng nhất khi stylesheet được nhúng trong một tài liệu XML khác.
- `input-type-annotations`
  - : Chỉ định liệu các chú thích kiểu có bị loại bỏ khỏi phần tử hay không để kết quả giống nhau dù tài liệu nguồn có được xác thực theo lược đồ hay không.
- `use-when`
  - : Xác định liệu phần tử và tất cả các nút có nó làm tổ tiên có bị loại khỏi stylesheet hay không.
- `xpath-default-namespace`
  - : Chỉ định namespace sẽ được dùng nếu tên phần tử không có tiền tố hoặc tên kiểu không có tiền tố trong một biểu thức XPath.

### Type

Phần tử ngoài cùng bắt buộc của stylesheet.

## Specifications

{{Specifications}}
