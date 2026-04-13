---
title: XSLTProcessor
slug: Web/API/XSLTProcessor
page-type: web-api-interface
browser-compat: api.XSLTProcessor
---

{{APIRef("DOM")}}

**`XSLTProcessor`** áp dụng phép biến đổi biểu định kiểu [XSLT](/vi/docs/Web/XML/XSLT) lên một tài liệu XML để tạo ra một tài liệu XML mới. Nó có các phương thức để tải biểu định kiểu XSLT, thao tác các giá trị tham số `<xsl:param>`, và áp dụng phép biến đổi lên các tài liệu.

## Hàm khởi tạo

- {{domxref("XSLTProcessor.XSLTProcessor", "XSLTProcessor()")}}
  - : Tạo một `XSLTProcessor` mới.

## Phương thức phiên bản

- {{domxref("XSLTProcessor.importStylesheet()")}}
  - : Nhập biểu định kiểu XSLT.
    Nếu nút đã cho là nút tài liệu, bạn có thể truyền vào một XSL Transform đầy đủ hoặc một [phép biến đổi phần tử kết quả literal](https://www.w3.org/TR/xslt-30/#literal-result-element);
    ngược lại, nó phải là phần tử `<xsl:stylesheet>` hoặc `<xsl:transform>`.
- {{domxref("XSLTProcessor.transformToFragment()")}}
  - : Biến đổi nút nguồn bằng cách áp dụng biểu định kiểu XSLT được nhập bằng hàm {{domxref("XSLTProcessor.importStylesheet()")}}.
    Tài liệu chủ sở hữu của đoạn tài liệu kết quả là nút chủ sở hữu.
- {{domxref("XSLTProcessor.transformToDocument()")}}
  - : Biến đổi nút nguồn bằng cách áp dụng biểu định kiểu XSLT được nhập bằng hàm {{domxref("XSLTProcessor.importStylesheet()")}}.
- {{domxref("XSLTProcessor.setParameter()")}}
  - : Đặt giá trị tham số (`<xsl:param>`) trong biểu định kiểu XSLT đã được nhập.
- {{domxref("XSLTProcessor.getParameter()")}}
  - : Lấy giá trị của một tham số từ biểu định kiểu XSLT.
- {{domxref("XSLTProcessor.removeParameter()")}}
  - : Xóa tham số nếu nó đã được đặt trước đó.
    Điều này sẽ khiến `XSLTProcessor` sử dụng giá trị mặc định cho tham số như được chỉ định trong biểu định kiểu XSLT.
- {{domxref("XSLTProcessor.clearParameters()")}}
  - : Xóa tất cả các tham số đã đặt khỏi `XSLTProcessor`.
    `XSLTProcessor` sẽ sử dụng các giá trị mặc định được chỉ định trong biểu định kiểu XSLT.
- {{domxref("XSLTProcessor.reset()")}}
  - : Xóa tất cả tham số và biểu định kiểu khỏi `XSLTProcessor`.

## Thuộc tính phiên bản

_Giao diện này không có thuộc tính nào._

## Ví dụ

### Khởi tạo `XSLTProcessor`

```js
async function init() {
  const parser = new DOMParser();
  const xsltProcessor = new XSLTProcessor();

  // Load the XSLT file, example1.xsl
  const xslResponse = await fetch("example1.xsl");
  const xslText = await xslResponse.text();
  const xslStylesheet = parser.parseFromString(xslText, "application/xml");
  xsltProcessor.importStylesheet(xslStylesheet);

  // process the file
  // …
}
```

### Tạo tài liệu XML dựa trên một phần DOM của tài liệu

Để thực hiện phép biến đổi thực sự, `XSLTProcessor` cần một tài liệu XML, được sử dụng kết hợp với tệp XSL đã nhập để tạo ra kết quả cuối cùng. Tài liệu XML có thể là một tệp XML riêng biệt được tải bằng {{domxref("Window/fetch", "fetch()")}}, hoặc có thể là một phần của trang hiện có.

Để xử lý một phần DOM của trang, trước tiên cần tạo một tài liệu XML trong bộ nhớ. Giả sử DOM cần xử lý được chứa trong một phần tử có id `example`, DOM đó có thể được "nhân bản" bằng phương thức {{domxref('Document.importNode()')}} của tài liệu XML trong bộ nhớ. {{domxref('Document.importNode()')}} cho phép chuyển đoạn DOM giữa các tài liệu, trong trường hợp này từ tài liệu HTML sang tài liệu XML. Tham số đầu tiên tham chiếu đến nút DOM cần nhân bản. Bằng cách đặt tham số thứ hai là "true", nó sẽ nhân bản tất cả các phần tử con (nhân bản sâu). Sau đó DOM đã nhân bản có thể được chèn vào tài liệu XML bằng {{domxref('Node.appendChild()')}}, như minh họa bên dưới.

```js
// Create a new XML document in memory
const xmlRef = document.implementation.createDocument("", "", null);

// We want to move a part of the DOM from an HTML document to an XML document.
// importNode is used to clone the nodes we want to process via XSLT - true makes it do a deep clone
const myNode = document.getElementById("example");
const clonedNode = xmlRef.importNode(myNode, true);

// Add the cloned DOM into the XML document
xmlRef.appendChild(clonedNode);
```

Sau khi biểu định kiểu đã được nhập, `XSLTProcessor` phải thực hiện hai phương thức để thực hiện phép biến đổi thực sự, đó là {{domxref('XSLTProcessor.transformToDocument()')}} và {{domxref('XSLTProcessor.transformToFragment()')}}. {{domxref('XSLTProcessor.transformToDocument()')}} trả về một tài liệu XML đầy đủ trong khi {{domxref('XSLTProcessor.transformToFragment()')}} trả về một đoạn tài liệu có thể được thêm dễ dàng vào tài liệu hiện có. Cả hai đều nhận tài liệu XML là tham số đầu tiên sẽ được biến đổi. {{domxref('XSLTProcessor.transformToFragment()')}} cần tham số thứ hai, là đối tượng tài liệu sẽ sở hữu đoạn được tạo ra. Nếu đoạn được tạo sẽ được chèn vào tài liệu HTML hiện tại, truyền vào document là đủ.

### Tạo tài liệu XML từ chuỗi 'XML Soup'

Bạn có thể sử dụng {{domxref("DOMParser")}} để tạo tài liệu XML từ một chuỗi XML.

```js
const parser = new DOMParser();
const doc = parser.parseFromString(str, "text/xml");
```

### Thực hiện phép biến đổi

```js
const fragment = xsltProcessor.transformToFragment(xmlRef, document);
```

### Ví dụ cơ bản

Ví dụ cơ bản sẽ tải một tệp XML và áp dụng phép biến đổi XSL lên nó. Đây là các tệp giống nhau được sử dụng trong ví dụ [Tạo HTML](/en-US/docs/Web/XML/XSLT/Guides/Transforming_XML_with_XSLT#generating_html). Tệp XML mô tả một bài viết và tệp XSL định dạng thông tin để hiển thị.

#### XML

```xml
<?xml version="1.0"?>
<myNS:Article xmlns:myNS="http://devedge.netscape.com/2002/de">
  <myNS:Title>My Article</myNS:Title>
  <myNS:Authors>
    <myNS:Author company="Foopy Corp.">Mr. Foo</myNS:Author>
    <myNS:Author>Mr. Bar</myNS:Author>
  </myNS:Authors>
  <myNS:Body>
    The <b>rain</b> in <u>Spain</u> stays mainly in the plains.
  </myNS:Body>
</myNS:Article>
```

#### XSLT

```xml
<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   xmlns:myNS="http://devedge.netscape.com/2002/de">

  <xsl:output method="html" />

  <xsl:template match="/">
    <html>

      <head>

        <title>
          <xsl:value-of select="/myNS:Article/myNS:Title"/>
        </title>

        <style>
          .myBox {margin:10px 155px 0 50px; border: 1px dotted #639ACE; padding:0 5px 0 5px;}
        </style>

      </head>

      <body>
        <p class="myBox">
          <span class="title">
            <xsl:value-of select="/myNS:Article/myNS:Title"/>
          </span> <br />

          Authors:   <br />
            <xsl:apply-templates select="/myNS:Article/myNS:Authors/myNS:Author"/>
          </p>

        <p class="myBox">
          <xsl:apply-templates select="//myNS:Body"/>
        </p>

      </body>

    </html>
  </xsl:template>

  <xsl:template match="myNS:Author">
     --   <xsl:value-of select="." />

    <xsl:if test="@company">
     ::   <b>  <xsl:value-of select="@company" />  </b>
    </xsl:if>

    <br />
  </xsl:template>

  <xsl:template match="myNS:Body">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|node()">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
```

Ví dụ tải cả tệp .xsl (`xslStylesheet`) và tệp .xml (`xmlDoc`) vào bộ nhớ. Tệp .xsl sau đó được nhập (`xsltProcessor.importStylesheet(xslStylesheet)`) và phép biến đổi được chạy (`xsltProcessor.transformToFragment(xmlDoc, document)`). Điều này cho phép lấy dữ liệu sau khi trang đã được tải mà không cần tải lại trang.

#### JavaScript

```js
async function init() {
  const parser = new DOMParser();
  const xsltProcessor = new XSLTProcessor();

  // Load the XSLT file, example1.xsl
  const xslResponse = await fetch("example1.xsl");
  const xslText = await xslResponse.text();
  const xslStylesheet = parser.parseFromString(xslText, "application/xml");
  xsltProcessor.importStylesheet(xslStylesheet);

  // Load the XML file, example1.xml
  const xmlResponse = await fetch("example1.xml");
  const xmlText = await xmlResponse.text();
  const xmlDoc = parser.parseFromString(xmlText, "application/xml");

  const fragment = xsltProcessor.transformToFragment(xmlDoc, document);

  document.getElementById("example").textContent = "";
  document.getElementById("example").appendChild(fragment);
}

init();
```

### Ví dụ nâng cao

Ví dụ nâng cao này sắp xếp nhiều div dựa trên nội dung của chúng. Ví dụ cho phép sắp xếp nội dung nhiều lần, xen kẽ giữa thứ tự tăng dần và giảm dần. JavaScript chỉ tải tệp .xsl lần đầu tiên sắp xếp và đặt biến `xslLoaded` thành true sau khi hoàn thành tải tệp. Sử dụng phương thức {{domxref("XSLTProcessor.getParameter()")}}, mã có thể xác định xem sắp xếp theo thứ tự tăng dần hay giảm dần. Mặc định là tăng dần nếu tham số rỗng (lần sắp xếp đầu tiên, vì chưa có giá trị cho nó trong tệp XSLT). Giá trị sắp xếp được đặt bằng {{domxref("XSLTProcessor.setParameter()")}}.

Tệp XSLT có tham số gọi là `myOrder` mà JavaScript đặt để thay đổi phương thức sắp xếp. Thuộc tính order của phần tử `xsl:sort` có thể truy cập giá trị của tham số bằng `$myOrder`. Tuy nhiên, giá trị cần là biểu thức XPATH chứ không phải chuỗi, vì vậy `{$myOrder}` được sử dụng. Sử dụng {} để đánh giá nội dung như biểu thức XPath.

Sau khi phép biến đổi hoàn thành, kết quả được thêm vào tài liệu như minh họa trong ví dụ này.

#### XHTML

```html
<div id="example">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
  <div>7</div>
  <div>8</div>
  <div>9</div>
  <div>10</div>
</div>
```

#### JavaScript

```js
let xslRef;
let xslLoaded = false;
const parser = new DOMParser();
const xsltProcessor = new XSLTProcessor();
let myDOM;

let xmlRef = document.implementation.createDocument("", "", null);

async function sort() {
  if (!xslLoaded) {
    const response = await fetch("example2.xsl");
    const xslText = await response.text();
    xslRef = parser.parseFromString(xslText, "application/xml");
    xsltProcessor.importStylesheet(xslRef);
    xslLoaded = true;
  }

  // Create a new XML document in memory
  xmlRef = document.implementation.createDocument("", "", null);

  // We want to move a part of the DOM from an HTML document to an XML document.
  // importNode is used to clone the nodes we want to process via XSLT - true makes it do a deep clone
  const myNode = document.getElementById("example");
  const clonedNode = xmlRef.importNode(myNode, true);

  // After cloning, we append
  xmlRef.appendChild(clonedNode);

  // Set the sorting parameter in the XSL file
  const sortVal = xsltProcessor.getParameter(null, "myOrder");

  if (sortVal === "" || sortVal === "descending") {
    xsltProcessor.setParameter(null, "myOrder", "ascending");
  } else {
    xsltProcessor.setParameter(null, "myOrder", "descending");
  }

  // Initiate the transformation
  const fragment = xsltProcessor.transformToFragment(xmlRef, document);

  // Clear the contents
  document.getElementById("example").textContent = "";

  myDOM = fragment;

  // Add the new content from the transformation
  document.getElementById("example").appendChild(fragment);
}
```

#### XSLT

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:param name="myOrder" />

  <xsl:template match="/">

    <xsl:apply-templates select="/div//div">
      <xsl:sort select="." data-type="number" order="{$myOrder}" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="div">
    <xsl:copy-of select="." />
  </xsl:template>
</xsl:stylesheet>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [XSLT](/vi/docs/Web/XML/XSLT)
- [Biến đổi với XSLT](/en-US/docs/Web/XML/XSLT/Guides/Transforming_XML_with_XSLT)
