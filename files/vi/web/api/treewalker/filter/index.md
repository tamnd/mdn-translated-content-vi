---
title: "TreeWalker: thuộc tính filter"
short-title: filter
slug: Web/API/TreeWalker/filter
page-type: web-api-instance-property
browser-compat: api.TreeWalker.filter
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`TreeWalker.filter`** trả về `NodeFilter` được liên kết với {{domxref("TreeWalker")}}.

Khi tạo `TreeWalker`, đối tượng lọc được truyền vào như tham số thứ ba, và phương thức `acceptNode()` của nó sẽ được gọi trên từng nút để xác định có chấp nhận nút đó hay không.

## Giá trị

Một đối tượng `NodeFilter`.

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
);
nodeFilter = treeWalker.filter; // trong trường hợp này là document.body
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
