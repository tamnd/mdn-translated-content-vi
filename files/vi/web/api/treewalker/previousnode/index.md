---
title: "TreeWalker: phương thức previousNode()"
short-title: previousNode()
slug: Web/API/TreeWalker/previousNode
page-type: web-api-instance-method
browser-compat: api.TreeWalker.previousNode
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.previousNode()`** di chuyển {{domxref("Node")}} hiện tại đến nút _có thể thấy_ trước đó theo thứ tự tài liệu, và trả về nút tìm được. Nếu không có nút như vậy, hoặc nếu nó nằm trước _nút gốc_ được xác định khi tạo đối tượng, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
previousNode()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("Node")}} hoặc `null`.

## Ví dụ

```js
const treeWalker = document.createTreeWalker(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  {
    acceptNode(node) {
      return NodeFilter.FILTER_ACCEPT;
    },
  },
  false,
);
const node = treeWalker.previousNode(); // trả về null vì không có nút cha
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
