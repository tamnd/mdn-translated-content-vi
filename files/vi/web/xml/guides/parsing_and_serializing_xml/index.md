---
title: Phân tích và tuần tự hóa XML
slug: Web/XML/Guides/Parsing_and_serializing_XML
page-type: guide
sidebar: xmlsidebar
---

Đôi khi, bạn có thể cần phân tích nội dung {{Glossary("XML")}} và chuyển nó thành một cây {{Glossary("DOM")}}, hoặc ngược lại, tuần tự hóa một cây DOM hiện có thành XML. Trong bài viết này, chúng ta sẽ xem xét các đối tượng mà nền tảng web cung cấp để giúp các tác vụ phổ biến là tuần tự hóa và phân tích XML trở nên dễ dàng.

- {{domxref("XMLSerializer")}}
  - : Tuần tự hóa các cây DOM, chuyển chúng thành chuỗi chứa XML.
- {{domxref("DOMParser")}}
  - : Xây dựng một cây DOM bằng cách phân tích một chuỗi chứa XML, trả về một {{domxref("XMLDocument")}} hoặc {{domxref("Document")}} tùy theo dữ liệu đầu vào.
- {{domxref("Window/fetch", "fetch()")}}
  - : Tải nội dung từ một URL. Nội dung XML được trả về dưới dạng chuỗi văn bản mà bạn có thể phân tích bằng `DOMParser`.
- {{domxref("XMLHttpRequest")}}
  - : Tiền thân của `fetch()`. Không giống API `fetch()`, `XMLHttpRequest` có thể trả về một tài nguyên dưới dạng `Document`, thông qua thuộc tính {{domxref("XMLHttpRequest.responseXML", "responseXML")}} của nó.
- [XPath](/en-US/docs/Web/XML/XPath)
  - : Một công nghệ để tạo các chuỗi chứa địa chỉ cho những phần cụ thể của tài liệu XML và định vị các nút XML dựa trên những địa chỉ đó.

## Tạo một tài liệu XML

Dùng một trong các cách sau để tạo một tài liệu XML (là một thể hiện của {{domxref("Document")}}).

### Phân tích chuỗi thành cây DOM

Ví dụ này chuyển một fragment XML trong chuỗi thành cây DOM bằng {{domxref("DOMParser")}}:

```js
const xmlStr = '<q id="a"><span id="b">hey!</span></q>';
const parser = new DOMParser();
const doc = parser.parseFromString(xmlStr, "application/xml");
// print the name of the root element or error message
const errorNode = doc.querySelector("parsererror");
if (errorNode) {
  console.log("error while parsing");
} else {
  console.log(doc.documentElement.nodeName);
}
```

### Phân tích tài nguyên có thể truy cập qua URL thành cây DOM

#### Dùng fetch

Sau đây là mã mẫu đọc và phân tích một tệp XML có thể truy cập qua URL thành cây DOM:

```js
fetch("example.xml")
  .then((response) => response.text())
  .then((text) => {
    const parser = new DOMParser();
    const doc = parser.parseFromString(text, "text/xml");
    console.log(doc.documentElement.nodeName);
  });
```

Đoạn mã này lấy tài nguyên dưới dạng chuỗi văn bản, sau đó dùng {{domxref("DOMParser.parseFromString()")}} để xây dựng một {{domxref("XMLDocument")}}.

Nếu tài liệu là {{Glossary("HTML")}}, mã hiển thị ở trên sẽ trả về một {{domxref("Document")}}. Nếu tài liệu là XML, đối tượng thu được thực ra là `XMLDocument`. Hai kiểu này về cơ bản là giống nhau; sự khác biệt chủ yếu mang tính lịch sử, mặc dù việc phân biệt chúng cũng có một số lợi ích thực tế.

> [!NOTE]
> Thực ra cũng có giao diện {{domxref("HTMLDocument")}}, nhưng nó không nhất thiết là một kiểu độc lập. Ở một số trình duyệt thì đúng như vậy, còn ở những trình duyệt khác nó chỉ là một bí danh cho giao diện `Document`.

## Tuần tự hóa một tài liệu XML

Với một {{domxref("Document")}}, bạn có thể tuần tự hóa cây DOM của tài liệu trở lại XML bằng phương thức {{domxref("XMLSerializer.serializeToString()")}}.

Hãy dùng các cách sau để tuần tự hóa nội dung của tài liệu XML bạn đã tạo trong phần trước.

### Tuần tự hóa cây DOM thành chuỗi

Trước tiên, tạo một cây DOM như được mô tả trong [Sử dụng Document Object Model](/en-US/docs/Web/API/Document_Object_Model). Hoặc, dùng một cây DOM thu được từ {{ domxref("Window/fetch", "fetch()") }}.

Để tuần tự hóa cây DOM `doc` thành văn bản XML, hãy gọi {{domxref("XMLSerializer.serializeToString()")}}:

```js
const serializer = new XMLSerializer();
const xmlStr = serializer.serializeToString(doc);
```

### Tuần tự hóa tài liệu HTML

Nếu DOM bạn có là một tài liệu HTML, bạn có thể tuần tự hóa bằng `serializeToString()`, nhưng còn một lựa chọn khác mà nhiều người thấy đơn giản hơn: dùng thuộc tính {{domxref("Element.innerHTML")}} (nếu bạn chỉ muốn các phần tử con của nút được chỉ định) hoặc thuộc tính {{domxref("Element.outerHTML")}} nếu bạn muốn nút và tất cả phần tử con của nó.

```js
const docInnerHtml = document.documentElement.innerHTML;
```

Kết quả là `docInnerHtml` là một chuỗi chứa HTML của nội dung tài liệu; tức là nội dung của phần tử {{HTMLElement("body")}}.

Bạn có thể lấy HTML tương ứng với `<body>` _và_ các phần tử con của nó bằng đoạn mã này:

```js
const docOuterHtml = document.documentElement.outerHTML;
```

## Xem thêm

- [XPath](/en-US/docs/Web/XML/XPath)
- {{domxref("Window/fetch", "fetch()")}}
- {{domxref("XMLHttpRequest")}}
- {{domxref("Document")}}, {{domxref("XMLDocument")}} và {{domxref("HTMLDocument")}}
