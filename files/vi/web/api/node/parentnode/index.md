---
title: "Node: thuộc tính parentNode"
short-title: parentNode
slug: Web/API/Node/parentNode
page-type: web-api-instance-property
browser-compat: api.Node.parentNode
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`parentNode`** của giao diện {{domxref("Node")}} trả về phần tử cha của nút đã chỉ định trong cây DOM.

Các nút `Document` và `DocumentFragment` [nút](/en-US/docs/Web/API/Node/nodeType) không bao giờ có nút cha, vì vậy `parentNode` sẽ luôn trả về `null`. Thuộc tính này cũng trả về `null` nếu nút vừa mới được tạo và chưa được gắn vào cây. Trong khi đó, {{domxref("Node.parentElement")}} chỉ trả về các nút `Element`.

## Giá trị

Một {{domxref("Node")}} là nút cha của nút hiện tại. Nút cha của một phần tử là một nút `Element`, một nút `Document` hoặc một nút `DocumentFragment`.

## Ví dụ

### Dùng parentNode

Ví dụ này xóa một nút khỏi cây, trừ khi nó đã không còn ở trong cây.

```js
if (node.parentNode) {
  node.parentNode.removeChild(node);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.firstChild")}}
- {{domxref("Node.lastChild")}}
- {{domxref("Node.childNodes")}}
- {{domxref("Node.nextSibling")}}
- {{domxref("Node.parentElement")}}
- {{domxref("Node.previousSibling")}}
- {{domxref("Node.removeChild")}}
