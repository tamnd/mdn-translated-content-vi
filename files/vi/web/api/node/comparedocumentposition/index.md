---
title: "Node: phương thức compareDocumentPosition()"
short-title: compareDocumentPosition()
slug: Web/API/Node/compareDocumentPosition
page-type: web-api-instance-method
browser-compat: api.Node.compareDocumentPosition
---

{{APIRef("DOM")}}

Phương thức **`compareDocumentPosition()`** của giao diện {{domxref("Node")}} báo cáo vị trí của nút đối số tương đối với nút mà nó được gọi trên đó.

## Cú pháp

```js-nolint
compareDocumentPosition(otherNode)
```

### Tham số

- `otherNode`
  - : {{domxref("Node")}} mà vị trí của nó cần được báo cáo so với nút hiện tại.

### Giá trị trả về

Một giá trị số biểu thị vị trí của `otherNode` so với `node` dưới dạng một [bitmask](<https://en.wikipedia.org/wiki/Mask_(computing)>) kết hợp các thuộc tính hằng sau của {{domxref("Node")}}, hoặc `0` nếu `otherNode` giống với nút này:

- `Node.DOCUMENT_POSITION_DISCONNECTED` (`1`)
  - : Cả hai nút nằm trong các tài liệu khác nhau hoặc các cây khác nhau trong cùng một tài liệu.
- `Node.DOCUMENT_POSITION_PRECEDING` (`2`)
  - : `otherNode` đứng trước nút trong một [duyệt theo chiều sâu trước thứ tự tiền tự](https://en.wikipedia.org/wiki/Tree_traversal#Pre-order,_NLR) của cây chứa cả hai nút (ví dụ: là tổ tiên, anh em trước hoặc hậu duệ của anh em trước, hoặc anh em trước của một tổ tiên) hoặc (nếu chúng bị ngắt kết nối) theo một thứ tự tùy ý nhưng nhất quán.
- `Node.DOCUMENT_POSITION_FOLLOWING` (`4`)
  - : `otherNode` đứng sau nút trong một [duyệt theo chiều sâu trước thứ tự tiền tự](https://en.wikipedia.org/wiki/Tree_traversal#Pre-order,_NLR) của cây chứa cả hai nút (ví dụ: là hậu duệ, anh em sau hoặc hậu duệ của anh em sau, hoặc anh em sau của một tổ tiên) hoặc (nếu chúng bị ngắt kết nối) theo một thứ tự tùy ý nhưng nhất quán.
- `Node.DOCUMENT_POSITION_CONTAINS` (`8`)
  - : `otherNode` là một tổ tiên của nút.
- `Node.DOCUMENT_POSITION_CONTAINED_BY` (`16`)
  - : `otherNode` là một hậu duệ của nút.
- `Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC` (`32`)
  - : Kết quả phụ thuộc vào hành vi tùy ý và/hoặc cụ thể của cách triển khai và không được đảm bảo là có thể di chuyển giữa các nền tảng.

Có thể đặt không hoặc nhiều bit, tùy thuộc vào kịch bản nào áp dụng. Ví dụ, nếu `otherNode` nằm sớm hơn trong tài liệu _và_ chứa nút mà `compareDocumentPosition()` được gọi trên đó, thì cả bit `DOCUMENT_POSITION_CONTAINS` và `DOCUMENT_POSITION_PRECEDING` đều sẽ được đặt, tạo ra giá trị `10` (`0x0A`).

## Ví dụ

```js
const head = document.head;
const body = document.body;

if (head.compareDocumentPosition(body) & Node.DOCUMENT_POSITION_FOLLOWING) {
  console.log("Tài liệu có cấu trúc đúng");
} else {
  console.error("<head> không đứng trước <body>");
}
```

> [!NOTE]
> Vì kết quả trả về bởi `compareDocumentPosition()` là một bitmask, nên phải dùng [toán tử AND theo bit](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND) để có kết quả có ý nghĩa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Node.contains()")}}
