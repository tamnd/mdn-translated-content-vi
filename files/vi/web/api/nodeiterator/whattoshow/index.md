---
title: "NodeIterator: thuộc tính whatToShow"
short-title: whatToShow
slug: Web/API/NodeIterator/whatToShow
page-type: web-api-instance-property
browser-compat: api.NodeIterator.whatToShow
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`NodeIterator.whatToShow`** đại diện cho một số nguyên `unsigned` dùng làm mặt nạ bit để chỉ ra những kiểu nút nào nên được trả về bởi {{domxref("NodeIterator")}}.

## Giá trị

Một số nguyên không âm. Để xem danh sách các giá trị có thể có, hãy xem [`document.createNodeIterator()`](/en-US/docs/Web/API/Document/createNodeIterator#whattoshow).

## Ví dụ

```js
const nodeIterator = document.createNodeIterator(
  document.body,
  NodeFilter.SHOW_ELEMENT | NodeFilter.SHOW_COMMENT | NodeFilter.SHOW_TEXT,
  { acceptNode: (node) => NodeFilter.FILTER_ACCEPT },
);
if (
  nodeIterator.whatToShow & NodeFilter.SHOW_ALL ||
  nodeIterator.whatToShow & NodeFilter.SHOW_COMMENT
) {
  // nodeIterator sẽ hiển thị comment
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà thuộc tính này thuộc về: {{domxref("NodeIterator")}}.
