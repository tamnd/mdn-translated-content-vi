---
title: "NodeIterator: thuộc tính filter"
short-title: filter
slug: Web/API/NodeIterator/filter
page-type: web-api-instance-property
browser-compat: api.NodeIterator.filter
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`NodeIterator.filter`** trả về một đối tượng `NodeFilter`, tức là một đối tượng triển khai phương thức `acceptNode(node)` được dùng để sàng lọc các nút.

Khi tạo {{domxref("NodeIterator")}}, đối tượng filter được truyền vào làm tham số thứ ba, và phương thức `acceptNode(node)` của đối tượng đó được gọi trên từng nút để xác định có chấp nhận nút đó hay không. Hàm này nên trả về hằng số `NodeFilter.FILTER_ACCEPT` khi nút nên được chấp nhận và `NodeFilter.FILTER_REJECT` khi nút nên bị từ chối.

## Giá trị

Một đối tượng `NodeFilter`.

## Ví dụ

```js
const nodeIterator = document.createNodeIterator(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  {
    acceptNode(node) {
      return NodeFilter.FILTER_ACCEPT;
    },
  },
);
nodeFilter = nodeIterator.filter;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà thuộc tính này thuộc về: {{domxref("NodeIterator")}}.
