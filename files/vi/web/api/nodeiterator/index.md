---
title: NodeIterator
slug: Web/API/NodeIterator
page-type: web-api-interface
browser-compat: api.NodeIterator
---

{{APIRef("DOM")}}

Giao diện **`NodeIterator`** đại diện cho một bộ lặp dùng để duyệt các nút của một cây con DOM theo thứ tự tài liệu.

Bạn có thể tạo một `NodeIterator` bằng phương thức {{domxref("Document.createNodeIterator()")}}, như sau:

```js
const nodeIterator = document.createNodeIterator(root, whatToShow, filter);
```

## Thuộc tính thể hiện

_Giao diện này không kế thừa thuộc tính nào._

- {{domxref("NodeIterator.root")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("Node")}} đại diện cho nút gốc, như đã được chỉ định khi `NodeIterator` được tạo.
- {{domxref("NodeIterator.whatToShow")}} {{ReadOnlyInline}}
  - : Trả về một mặt nạ bit `unsigned long` mô tả các kiểu {{domxref("Node")}} cần được khớp. Các nút không khớp sẽ bị bỏ qua, nhưng các nút con liên quan vẫn có thể được bao gồm.
- {{domxref("NodeIterator.filter")}} {{ReadOnlyInline}}
  - : Trả về một `NodeFilter` dùng để chọn các nút liên quan.
- {{domxref("NodeIterator.referenceNode")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Node")}} mà bộ lặp đang bám vào.
- {{domxref("NodeIterator.pointerBeforeReferenceNode")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết `NodeIterator` đang bám _trước_ hay _sau_ {{domxref("NodeIterator.referenceNode")}}. Nếu là `false`, điều đó có nghĩa là bộ lặp đang bám _sau_ nút tham chiếu.

## Phương thức thể hiện

_Giao diện này không kế thừa phương thức nào._

- {{domxref("NodeIterator.detach()")}} {{deprecated_inline}}
  - : Đây là một phương thức cũ và hiện không còn tác dụng. Trước đây, nó được dùng để đánh dấu `NodeIterator` là đã ngừng sử dụng, để bộ thu gom rác có thể thu hồi nó.
- {{domxref("NodeIterator.previousNode()")}}
  - : Trả về {{domxref("Node")}} trước đó trong tài liệu, hoặc `null` nếu không còn nút nào.
- {{domxref("NodeIterator.nextNode()")}}
  - : Trả về {{domxref("Node")}} tiếp theo trong tài liệu, hoặc `null` nếu không còn nút nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức tạo: {{domxref("Document.createNodeIterator()")}}.
- Giao diện liên quan: {{domxref("TreeWalker")}}
