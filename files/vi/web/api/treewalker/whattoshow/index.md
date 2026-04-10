---
title: "TreeWalker: thuộc tính whatToShow"
short-title: whatToShow
slug: Web/API/TreeWalker/whatToShow
page-type: web-api-instance-property
browser-compat: api.TreeWalker.whatToShow
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`TreeWalker.whatToShow`** trả về một bitmask cho biết các loại [nút](/en-US/docs/Web/API/Node) nào sẽ được hiển thị. Các nút không khớp sẽ bị bỏ qua, nhưng nút con của chúng vẫn có thể được bao gồm nếu phù hợp.

## Giá trị

Một số nguyên không âm. Danh sách các giá trị có thể dùng xem tại [`document.createTreeWalker()`](/en-US/docs/Web/API/Document/createTreeWalker#whattoshow).

## Ví dụ

```js
const treeWalker = document.createTreeWalker(
  document.body,
  NodeFilter.SHOW_ELEMENT + NodeFilter.SHOW_COMMENT + NodeFilter.SHOW_TEXT,
  { acceptNode: (node) => NodeFilter.FILTER_ACCEPT },
  false,
);
if (
  treeWalker.whatToShow === NodeFilter.SHOW_ALL ||
  treeWalker.whatToShow % (NodeFilter.SHOW_COMMENT * 2) >=
    NodeFilter.SHOW_COMMENT
) {
  // treeWalker sẽ hiển thị các comment
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}}.
