---
title: "XSLTProcessor: reset() method"
short-title: reset()
slug: Web/API/XSLTProcessor/reset
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.reset
---

{{APIRef("DOM")}}

Phương thức `reset()` của giao diện {{domxref("XSLTProcessor")}} xóa tất cả tham số (`<xsl:param>`) và biểu định kiểu XSLT khỏi bộ xử lý. `XSLTProcessor` sau đó sẽ ở trạng thái ban đầu khi nó được tạo ra.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng reset()

Ví dụ này minh họa cách phương thức `reset()` cho phép cùng một đối tượng `XSLTProcessor` được tái sử dụng cho nhiều phép biến đổi với các biểu định kiểu khác nhau.

#### HTML

```html
<div id="result"></div>
```

#### JavaScript

```js
const xmlString1 = `
<items>
  <item>Item A</item>
  <item>Item B</item>
</items>
`;

const xsltString1 = `
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

const xmlString2 = `
<fruits>
  <fruit>Apple</fruit>
  <fruit>Banana</fruit>
</fruits>
`;

const xsltString2 = `
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <ol>
      <xsl:for-each select="fruits/fruit">
        <li><xsl:value-of select="."/></li>
      </xsl:for-each>
    </ol>
  </xsl:template>
</xsl:stylesheet>
`;

const parser = new DOMParser();
const xmlDoc1 = parser.parseFromString(xmlString1, "application/xml");
const xsltDoc1 = parser.parseFromString(xsltString1, "application/xml");
const xmlDoc2 = parser.parseFromString(xmlString2, "application/xml");
const xsltDoc2 = parser.parseFromString(xsltString2, "application/xml");

const xsltProcessor = new XSLTProcessor();

// Import the first XSLT stylesheet and transform the first XML
xsltProcessor.importStylesheet(xsltDoc1);
let resultFragment = xsltProcessor.transformToFragment(xmlDoc1, document);
document.getElementById("result").appendChild(resultFragment);

// Reset the XSLTProcessor instance
xsltProcessor.reset();

// Import the second XSLT stylesheet and transform the second XML
xsltProcessor.importStylesheet(xsltDoc2);
resultFragment = xsltProcessor.transformToFragment(xmlDoc2, document);
document.getElementById("result").appendChild(document.createElement("hr"));
document.getElementById("result").appendChild(resultFragment);
```

#### Kết quả

{{EmbedLiveSample("using_reset", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XSLTProcessor.getParameter()")}}
- {{domxref("XSLTProcessor.setParameter()")}}
- {{domxref("XSLTProcessor.removeParameter()")}}
- {{domxref("XSLTProcessor.clearParameters()")}}
