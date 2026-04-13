---
title: "TreeWalker: phương thức nextSibling()"
short-title: nextSibling()
slug: Web/API/TreeWalker/nextSibling
page-type: web-api-instance-method
browser-compat: api.TreeWalker.nextSibling
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.nextSibling()`** di chuyển {{domxref("Node")}} hiện tại đến nút anh em tiếp theo của nó, nếu có, và trả về nút anh em tìm được. Nếu không có nút như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
nextSibling()
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
treeWalker.firstChild();
const node = treeWalker.nextSibling(); // trả về null nếu nút con đầu tiên của phần tử gốc không có anh em
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
