---
title: "XSLTProcessor: clearParameters() method"
short-title: clearParameters()
slug: Web/API/XSLTProcessor/clearParameters
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.clearParameters
---

{{APIRef("DOM")}}

Phương thức `clearParameters()` của giao diện {{domxref("XSLTProcessor")}} xóa tất cả tham số (`<xsl:param>`) và giá trị của chúng khỏi biểu định kiểu XSLT đã được nhập vào bộ xử lý. `XSLTProcessor` sau đó sẽ sử dụng các giá trị mặc định được chỉ định trong biểu định kiểu XSLT.

## Cú pháp

```js-nolint
clearParameters()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng clearParameters()

Ví dụ này cho thấy cách `clearParameters()` có thể được sử dụng để đặt lại tất cả tham số về giá trị mặc định của chúng như được chỉ định trong biểu định kiểu XSLT.

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
  <item>Item 3</item>
</items>
`;

const xsltString = `
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="showItems" select="'yes'"/>
  <xsl:template match="/">
    <!-- If showItems is 'yes', display the list of items -->
    <xsl:if test="$showItems = 'yes'">
      <ul>
        <xsl:for-each select="items/item">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <!-- If showItems is 'no', display a message -->
    <xsl:if test="$showItems = 'no'">
      <div>No content to show</div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
`;

const parser = new DOMParser();
const xmlDoc = parser.parseFromString(xmlString, "application/xml");
const xsltDoc = parser.parseFromString(xsltString, "application/xml");

const xsltProcessor = new XSLTProcessor();
xsltProcessor.importStylesheet(xsltDoc);

// Set the 'showItems' parameter to 'no' and perform the first transformation
xsltProcessor.setParameter(null, "showItems", "no");
let resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);
document.getElementById("result").appendChild(resultFragment);

// Add a horizontal rule to separate the results
document.getElementById("result").appendChild(document.createElement("hr"));

// Clear all parameters, resetting 'showItems' to its default value ('yes')
xsltProcessor.clearParameters();
resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);
document.getElementById("result").appendChild(resultFragment);
```

#### Kết quả

{{EmbedLiveSample("using_clearParameters", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XSLTProcessor.getParameter()")}}
- {{domxref("XSLTProcessor.setParameter()")}}
- {{domxref("XSLTProcessor.removeParameter()")}}
- {{domxref("XSLTProcessor.reset()")}}
