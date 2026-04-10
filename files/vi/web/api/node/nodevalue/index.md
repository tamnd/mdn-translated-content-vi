---
title: "Node: thuộc tính nodeValue"
short-title: nodeValue
slug: Web/API/Node/nodeValue
page-type: web-api-instance-property
browser-compat: api.Node.nodeValue
---

{{APIRef("DOM")}}

Thuộc tính **`nodeValue`** của giao diện {{domxref("Node")}} trả về hoặc đặt giá trị của nút hiện tại.

## Giá trị

Một chuỗi chứa giá trị của nút hiện tại, nếu có. Với chính tài liệu, `nodeValue` trả về `null`. Với các nút văn bản, chú thích và CDATA, `nodeValue` trả về nội dung của nút. Với các nút thuộc tính, giá trị của thuộc tính sẽ được trả về.

Bảng sau cho thấy giá trị trả về cho các kiểu nút khác nhau.

| Node                                 | Giá trị của nodeValue              |
| ------------------------------------ | ---------------------------------- |
| {{domxref("CDATASection")}}          | Nội dung của phần CDATA            |
| {{domxref("Comment")}}               | Nội dung của chú thích             |
| {{domxref("Document")}}              | `null`                             |
| {{domxref("DocumentFragment")}}      | `null`                             |
| {{domxref("DocumentType")}}          | `null`                             |
| {{domxref("Element")}}               | `null`                             |
| {{domxref("NamedNodeMap")}}          | `null`                             |
| {{domxref("ProcessingInstruction")}} | Toàn bộ nội dung trừ target        |
| {{domxref("Text")}}                  | Nội dung của nút văn bản           |

> [!NOTE]
> Khi `nodeValue` được xác định là `null`, việc gán giá trị cho nó sẽ không có tác dụng.

## Ví dụ

```html
<div id="d1">Hello world</div>
<!-- Ví dụ về chú thích -->
<output id="result">Chưa được tính.</output>
```

và đoạn script sau:

```js
let node = document.querySelector("body").firstChild;
let result = "Tên các nút là:\n";
while (node) {
  result += `Giá trị của ${node.nodeName}: ${node.nodeValue}\n`;
  node = node.nextSibling;
}

const output = document.getElementById("result");
output.innerText = result;
```

{{ EmbedLiveSample("Example", "100%", "250")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
