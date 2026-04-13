---
title: "Document: phương thức adoptNode()"
short-title: adoptNode()
slug: Web/API/Document/adoptNode
page-type: web-api-instance-method
browser-compat: api.Document.adoptNode
---

{{ ApiRef("DOM") }}

**`Document.adoptNode()`** chuyển một {{Glossary("node/dom", "node")}} từ một {{domxref("Document", "document", "", "1")}} khác vào document của phương thức.
Node được adopted và cây con của nó sẽ bị xóa khỏi tài liệu gốc (nếu có), và {{domxref("Node.ownerDocument", "ownerDocument")}} của chúng được thay đổi thành tài liệu hiện tại.
Node sau đó có thể được chèn vào tài liệu hiện tại.

## Cú pháp

```js-nolint
adoptNode(externalNode)
```

### Tham số

- `externalNode`
  - : Node từ tài liệu khác cần được adopted.

### Giá trị trả về

`importedNode` đã sao chép trong phạm vi của tài liệu nhập.

Sau khi gọi phương thức này, `importedNode` và
`externalNode` là cùng một đối tượng.

> [!NOTE]
> {{domxref("Node.parentNode")}} của `importedNode` là `null`, vì nó chưa được
> chèn vào cây tài liệu!

## Ví dụ

```js
const iframe = document.querySelector("iframe");
const iframeImages = iframe.contentDocument.querySelectorAll("img");
const newParent = document.getElementById("images");

iframeImages.forEach((imgEl) => {
  newParent.appendChild(document.adoptNode(imgEl));
});
```

## Ghi chú

Trước khi có thể chèn vào tài liệu hiện tại, các node từ tài liệu bên ngoài
nên được:

- sao chép bằng {{domXref("document.importNode()")}}; hoặc
- adopted bằng `document.adoptNode()`.

Để biết thêm về các vấn đề {{domXref("Node.ownerDocument")}}, xem [W3C DOM FAQ](https://www.w3.org/DOM/faq.html#ownerdoc).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.importNode()")}}
