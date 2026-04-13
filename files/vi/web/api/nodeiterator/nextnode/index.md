---
title: "NodeIterator: phương thức nextNode()"
short-title: nextNode()
slug: Web/API/NodeIterator/nextNode
page-type: web-api-instance-method
browser-compat: api.NodeIterator.nextNode
---

{{APIRef("DOM")}}

Phương thức **`NodeIterator.nextNode()`** trả về nút tiếp theo trong tập hợp được biểu diễn bởi {{domxref("NodeIterator")}} và tiến vị trí của bộ lặp trong tập hợp đó. Lần gọi đầu tiên tới `nextNode()` sẽ trả về nút đầu tiên trong tập hợp.

Phương thức này trả về `null` khi không còn nút nào trong tập hợp.

Trong các trình duyệt cũ, theo các bản đặc tả cũ, phương thức này có thể ném ngoại lệ `INVALID_STATE_ERR` {{domxref("DOMException")}} nếu được gọi sau phương thức {{domxref("NodeIterator.detach()")}}. Các trình duyệt hiện đại không bao giờ ném ngoại lệ này.

## Cú pháp

```js-nolint
nextNode()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("Node")}} đại diện cho nút sau nút hiện tại trong tập hợp được biểu diễn bởi `NodeIterator` này, hoặc `null` nếu nút hiện tại là nút cuối cùng trong tập hợp.

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
currentNode = nodeIterator.nextNode(); // trả về nút tiếp theo
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà nó thuộc về: {{domxref("NodeIterator")}}.
