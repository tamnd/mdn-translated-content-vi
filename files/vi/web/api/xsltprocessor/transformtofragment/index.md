---
title: "XSLTProcessor: transformToFragment() method"
short-title: transformToFragment()
slug: Web/API/XSLTProcessor/transformToFragment
page-type: web-api-instance-method
browser-compat: api.XSLTProcessor.transformToFragment
---

{{APIRef("DOM")}}

Phương thức `transformToFragment()` của giao diện {{domxref("XSLTProcessor")}} biến đổi một {{DOMxRef("Node")}} nguồn thành {{domxref("DocumentFragment")}} bằng cách sử dụng biểu định kiểu XSLT liên kết với `XSLTProcessor`.

## Cú pháp

```js-nolint
transformToFragment(source, document)
```

### Tham số

- `source`
  - : {{DOMxRef("Node")}} nguồn để áp dụng biểu định kiểu XSLT lên.
- `document`
  - : {{DOMxRef("Document")}} mà đoạn tài liệu sẽ được liên kết với. (Mọi đoạn tài liệu đều được liên kết với một tài liệu mà nó có thể được thêm vào).

### Giá trị trả về

Một {{domxref("DocumentFragment")}}.

## Ví dụ

### Sử dụng transformToFragment()

Ví dụ này minh họa cách sử dụng `transformToFragment()` để biến đổi dữ liệu XML thành HTML, sau đó có thể được chèn trực tiếp vào DOM dưới dạng đoạn tài liệu.

#### HTML

```html
<div id="result"></div>
```

#### JavaScript

```js
const xmlString = `
<books>
  <book>
    <title>Book 1</title>
    <author>Author 1</author>
  </book>
  <book>
    <title>Book 2</title>
    <author>Author 2</author>
  </book>
</books>
`;

const xsltString = `
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <ul>
      <xsl:for-each select="books/book">
        <li>
          <strong><xsl:value-of select="title"/></strong>
          by <em><xsl:value-of select="author"/></em>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
`;

const parser = new DOMParser();
const xmlDoc = parser.parseFromString(xmlString, "application/xml");
const xsltDoc = parser.parseFromString(xsltString, "application/xml");

const xsltProcessor = new XSLTProcessor();
xsltProcessor.importStylesheet(xsltDoc);

// Perform the transformation, returning the result as a document fragment
const resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);

// Insert the result into the page
document.getElementById("result").appendChild(resultFragment);
```

#### Kết quả

{{EmbedLiveSample("using_transformToFragment", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XSLTProcessor.transformToDocument()")}}
