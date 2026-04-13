---
title: "XSLTProcessor: removeParameter() method"
short-title: removeParameter()
slug: Web/API/XSLTProcessor/removeParameter
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.removeParameter
---

{{APIRef("DOM")}}

Phương thức `removeParameter()` của giao diện {{domxref("XSLTProcessor")}} xóa tham số (`<xsl:param>`) và giá trị của nó khỏi biểu định kiểu XSLT đã được nhập vào bộ xử lý.

## Cú pháp

```js-nolint
removeParameter(namespaceURI, localName)
```

### Tham số

- `namespaceURI`
  - : Không gian tên liên kết với tên tham số. Giá trị ["null"](/en-US/docs/Web/JavaScript/Reference/Operators/null) được xử lý giống như chuỗi rỗng (`""`).
- `localName`
  - : Tên của tham số trong không gian tên liên kết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng removeParameter()

Đầu tiên, tham số `showItems` được đặt thành `"yes"`, cho phép các mục danh sách hiển thị trong kết quả.

Sau đó, tham số `showItems` được xóa bằng `removeParameter()`, và phép biến đổi được thực hiện lại, dẫn đến không có mục nào được hiển thị.

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

// Set 'showItems' to 'no' and perform the first transformation
xsltProcessor.setParameter(null, "showItems", "no");
const resultContainer = document.getElementById("result");
let resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);
resultContainer.appendChild(resultFragment);

// Add a horizontal rule to separate the results
resultContainer.appendChild(document.createElement("hr"));

// Remove the 'showItems' parameter, reverting it to the default value ('yes')
xsltProcessor.removeParameter(null, "showItems");
resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);
resultContainer.appendChild(resultFragment);
```

#### Kết quả

{{EmbedLiveSample("using_removeparameter", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XSLTProcessor.getParameter()")}}
- {{domxref("XSLTProcessor.setParameter()")}}
- {{domxref("XSLTProcessor.clearParameters()")}}
- {{domxref("XSLTProcessor.reset()")}}
