---
title: "NodeIterator: phương thức detach()"
short-title: detach()
slug: Web/API/NodeIterator/detach
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.NodeIterator.detach
---

{{APIRef("DOM")}}{{deprecated_header}}

Phương thức **`NodeIterator.detach()`** không còn tác dụng gì, và chỉ được giữ lại để tương thích ngược.

Ban đầu, nó tách {{domxref("NodeIterator")}} khỏi tập hợp mà nó duyệt, giải phóng mọi tài nguyên được tập hợp đó sử dụng và đặt trạng thái của bộ lặp thành `INVALID`. Sau khi phương thức này được gọi, việc gọi các phương thức khác trên `NodeIterator` sẽ gây ra ngoại lệ `INVALID_STATE_ERR`.

## Cú pháp

```js-nolint
detach()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

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
nodeIterator.detach(); // tách bộ lặp

nodeIterator.nextNode(); // ném ra ngoại lệ INVALID_STATE_ERR
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà nó thuộc về: {{domxref("NodeIterator")}}.
