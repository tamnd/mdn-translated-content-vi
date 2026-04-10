---
title: "TreeWalker: phương thức parentNode()"
short-title: parentNode()
slug: Web/API/TreeWalker/parentNode
page-type: web-api-instance-method
browser-compat: api.TreeWalker.parentNode
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.parentNode()`** di chuyển {{domxref("Node")}} hiện tại đến nút cha tổ tiên _có thể thấy_ đầu tiên theo thứ tự tài liệu, và trả về nút tìm được. Nếu không có nút như vậy, hoặc nếu nó nằm phía trên _nút gốc_ của `TreeWalker`, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
parentNode()
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
const node = treeWalker.parentNode(); // trả về null vì không có nút cha
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
