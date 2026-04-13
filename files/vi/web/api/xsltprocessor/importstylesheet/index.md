---
title: "XSLTProcessor: importStylesheet() method"
short-title: importStylesheet()
slug: Web/API/XSLTProcessor/importStylesheet
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.importStylesheet
---

{{APIRef("DOM")}}

Phương thức `importStylesheet()` của giao diện {{domxref("XSLTProcessor")}} nhập một biểu định kiểu XSLT vào bộ xử lý.

## Cú pháp

```js-nolint
importStylesheet(style)
```

### Tham số

- `style`
  - : {{DOMxRef("Node")}} cần nhập. Có thể là một tài liệu XML (tức là {{domxref("Document")}} với {{domxref("Document.doctype", "doctype")}} có {{domxref("DocumentType.name", "name")}} là `"xml"`) chứa biểu định kiểu XSLT hoặc [phép biến đổi phần tử kết quả literal](https://www.w3.org/TR/xslt-30/#literal-result-element), hoặc một {{domxref("Element")}} đại diện cho `<xsl:stylesheet>` hoặc `<xsl:transform>`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng importStylesheet()

Ví dụ này cho thấy cách `importStylesheet()` tải một biểu định kiểu XSLT vào `XSLTProcessor` để sử dụng trong việc biến đổi dữ liệu XML.

#### HTML

```html
<div id="result"></div>
```

#### JavaScript

```js
const xmlString = `
<items>
  <item>Item 1</item>
  <item>Item 2</item>
</items>
`;

const xsltString = `
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <ul>
      <xsl:for-each select="items/item">
        <li><xsl:value-of select="."/></li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
`;

const parser = new DOMParser();
const xmlDoc = parser.parseFromString(xmlString, "application/xml");
const xsltDoc = parser.parseFromString(xsltString, "application/xml");

const xsltProcessor = new XSLTProcessor();

// Import the XSLT stylesheet into the XSLTProcessor
xsltProcessor.importStylesheet(xsltDoc);

// Perform the transformation from XML to HTML
const resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);

// Display the transformed result in the page
document.getElementById("result").appendChild(resultFragment);
```

#### Kết quả

{{EmbedLiveSample("using_importStylesheet", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
