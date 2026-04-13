---
title: "Node: thuộc tính nodeName"
short-title: nodeName
slug: Web/API/Node/nodeName
page-type: web-api-instance-property
browser-compat: api.Node.nodeName
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`nodeName`** của {{domxref("Node")}} trả về tên của nút hiện tại dưới dạng một chuỗi.

## Giá trị

Một chuỗi. Các giá trị cho những kiểu nút khác nhau là:

- {{domxref("Attr")}}
  - : Giá trị của {{domxref("Attr.name")}}, tức _qualified name_ của thuộc tính.
- {{domxref("CDATASection")}}
  - : Chuỗi `"#cdata-section"`.
- {{domxref("Comment")}}
  - : Chuỗi `"#comment"`.
- {{domxref("Document")}}
  - : Chuỗi `"#document"`.
- {{domxref("DocumentFragment")}}
  - : Chuỗi `"#document-fragment"`.
- {{domxref("DocumentType")}}
  - : Giá trị của {{domxref("DocumentType.name")}}
- {{domxref("Element")}}
  - : Giá trị của {{domxref("Element.tagName")}}, tức tên _viết hoa_ của thẻ phần tử nếu là phần tử HTML, hoặc tên thẻ _viết thường_ nếu là phần tử XML (như phần tử SVG hoặc MathML).
- {{domxref("ProcessingInstruction")}}
  - : Giá trị của {{domxref("ProcessingInstruction.target")}}
- {{domxref("Text")}}
  - : Chuỗi `"#text"`.

## Ví dụ

Ví dụ này hiển thị tên nút của một số nút

```html
Đây là một số HTML:
<div id="d1">Hello world</div>
<!-- Ví dụ về chú thích -->
Text <span>Text</span> Text<br />
<svg height="20" width="20">
  <circle cx="10" cy="10" r="5" stroke="black" stroke-width="1" fill="red" />
</svg>
<hr />
<output id="result">Chưa được tính.</output>
```

và đoạn script sau:

```js
let node = document.querySelector("body").firstChild;
let result = "Tên các nút là:\n";
while (node) {
  result += `${node.nodeName}\n`;
  node = node.nextSibling;
}

const output = document.getElementById("result");
output.innerText = result;
```

{{ EmbedLiveSample("Example", "100%", "450")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.tagName")}}
- {{domxref("Attr.name")}}
- {{domxref("DocumentType.name")}}
- {{domxref("ProcessingInstruction.target")}}
