---
title: "Node: thuộc tính nodeType"
short-title: nodeType
slug: Web/API/Node/nodeType
page-type: web-api-instance-property
browser-compat: api.Node.nodeType
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`nodeType`** của một giao diện {{domxref("Node")}} là một số nguyên xác định nút đó là gì. Nó phân biệt các kiểu nút khác nhau với nhau, chẳng hạn như {{domxref("Element", "phần tử")}}, {{domxref("Text", "văn bản")}} và {{domxref("Comment", "chú thích")}}.

## Giá trị

Một số nguyên chỉ định kiểu của nút. Các giá trị có thể là:

- `Node.ELEMENT_NODE` (`1`)
  - : Một nút {{domxref("Element")}} như {{HTMLElement("p")}} hoặc {{HTMLElement("div")}}.
- `Node.ATTRIBUTE_NODE` (`2`)
  - : Một {{domxref("Attr", "thuộc tính")}} của một {{domxref("Element")}}.
- `Node.TEXT_NODE` (`3`)
  - : Nội dung {{domxref("Text")}} thực sự bên trong một {{domxref("Element")}} hoặc {{domxref("Attr")}}.
- `Node.CDATA_SECTION_NODE` (`4`)
  - : Một {{domxref("CDATASection")}}, như `<!CDATA[[ … ]]>`
- `Node.PROCESSING_INSTRUCTION_NODE` (`7`)
  - : Một {{domxref("ProcessingInstruction")}} của tài liệu XML, như `<?xml-stylesheet … ?>`.
- `Node.COMMENT_NODE` (`8`)
  - : Một nút {{domxref("Comment")}}, như `<!-- … -->`.
- `Node.DOCUMENT_NODE` (`9`)
  - : Một nút {{domxref("Document")}}.
- `Node.DOCUMENT_TYPE_NODE` (`10`)
  - : Một nút {{domxref("DocumentType")}}, như `<!doctype html>`.
- `Node.DOCUMENT_FRAGMENT_NODE` (`11`)
  - : Một nút {{domxref("DocumentFragment")}}.

Các hằng số sau đã bị ngừng dùng và không còn được sử dụng nữa: `Node.ENTITY_REFERENCE_NODE` (`5`), `Node.ENTITY_NODE` (`6`) và `Node.NOTATION_NODE` (`12`).

## Ví dụ

### Các kiểu nút khác nhau

```js
document.nodeType === Node.DOCUMENT_NODE; // true
document.doctype.nodeType === Node.DOCUMENT_TYPE_NODE; // true

document.createDocumentFragment().nodeType === Node.DOCUMENT_FRAGMENT_NODE; // true

const p = document.createElement("p");
p.textContent = "Ngày xửa ngày xưa…";

p.nodeType === Node.ELEMENT_NODE; // true
p.firstChild.nodeType === Node.TEXT_NODE; // true
```

### Chú thích

Ví dụ này kiểm tra xem nút đầu tiên bên trong phần tử tài liệu có phải là chú thích hay không, và hiển thị thông báo nếu không phải.

```js
const node = document.documentElement.firstChild;
if (node.nodeType !== Node.COMMENT_NODE) {
  console.warn("Bạn nên chú thích mã của mình!");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
