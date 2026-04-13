---
title: "XSLTProcessor: setParameter() method"
short-title: setParameter()
slug: Web/API/XSLTProcessor/setParameter
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.setParameter
---

{{APIRef("DOM")}}

Phương thức `setParameter()` của giao diện {{domxref("XSLTProcessor")}} đặt giá trị của một tham số (`<xsl:param>`) trong biểu định kiểu XSLT đã được nhập vào bộ xử lý.

## Cú pháp

```js-nolint
setParameter(namespaceURI, localName, value)
```

### Tham số

- `namespaceURI`
  - : Không gian tên liên kết với tên tham số. Giá trị ["null"](/en-US/docs/Web/JavaScript/Reference/Operators/null) được xử lý giống như chuỗi rỗng (`""`).
- `localName`
  - : Tên của tham số trong không gian tên liên kết.
- `value`
  - : Giá trị của tham số.
    > [!NOTE]
    > Firefox hỗ trợ mọi kiểu tham số. Chrome, Edge và Safari chỉ hỗ trợ tham số chuỗi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng setParameter()

Ví dụ này minh họa cách truyền tham số từ JavaScript sang biểu định kiểu XSLT bằng `setParameter()`, cho phép sửa đổi động kết quả biến đổi dựa trên các tham số này.

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
  <xsl:param name="highlightColor" select="'yellow'"/>
  <xsl:template match="/">
    <ul>
      <xsl:if test="$showItems = 'yes'">
        <xsl:for-each select="items/item">
          <li style="background-color: {$highlightColor};">
            <xsl:value-of select="."/>
          </li>
        </xsl:for-each>
      </xsl:if>
    </ul>
  </xsl:template>
</xsl:stylesheet>
`;

const parser = new DOMParser();
const xmlDoc = parser.parseFromString(xmlString, "application/xml");
const xsltDoc = parser.parseFromString(xsltString, "application/xml");

const xsltProcessor = new XSLTProcessor();
xsltProcessor.importStylesheet(xsltDoc);

xsltProcessor.setParameter(null, "showItems", "yes");
xsltProcessor.setParameter(null, "highlightColor", "lightblue");

// Perform the transformation from XML to HTML
const resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);

// Display the transformed result in the page
document.getElementById("result").appendChild(resultFragment);
```

#### Kết quả

{{EmbedLiveSample("using_setParameter", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XSLTProcessor.getParameter()")}}
- {{domxref("XSLTProcessor.removeParameter()")}}
- {{domxref("XSLTProcessor.clearParameters()")}}
- {{domxref("XSLTProcessor.reset()")}}
