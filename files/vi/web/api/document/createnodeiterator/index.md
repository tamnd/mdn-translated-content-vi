---
title: "Document: phương thức createNodeIterator()"
short-title: createNodeIterator()
slug: Web/API/Document/createNodeIterator
page-type: web-api-instance-method
browser-compat: api.Document.createNodeIterator
---

{{APIRef("DOM")}}

Phương thức **`Document.createNodeIterator()`** trả về một đối tượng [`NodeIterator`](/en-US/docs/Web/API/NodeIterator) mới.

## Cú pháp

```js-nolint
createNodeIterator(root)
createNodeIterator(root, whatToShow)
createNodeIterator(root, whatToShow, filter)
```

### Tham số

- `root`
  - : Nút gốc nơi bắt đầu quá trình duyệt của {{ domxref("NodeIterator") }}.

- `whatToShow` {{optional_inline}}
  - : Một `unsigned long` tùy chọn đại diện cho một bitmask được tạo bằng cách kết hợp các hằng số của `NodeFilter`.
    Đây là một cách thuận tiện để lọc các loại nút cụ thể. Mặc định là `0xFFFFFFFF` đại diện cho hằng số `SHOW_ALL`.

    | Hằng số                                                  | Giá trị số      | Mô tả                                             |
    | -------------------------------------------------------- | --------------- | ------------------------------------------------- |
    | `NodeFilter.SHOW_ALL`                                    | `0xFFFFFFFF`    | Hiển thị tất cả các nút.                          |
    | `NodeFilter.SHOW_ATTRIBUTE`                              | `0x2`           | Hiển thị các nút {{domxref("Attr")}}.             |
    | `NodeFilter.SHOW_CDATA_SECTION`                          | `0x8`           | Hiển thị các nút {{domxref("CDATASection")}}.     |
    | `NodeFilter.SHOW_COMMENT`                                | `0x80`          | Hiển thị các nút {{domxref("Comment")}}.          |
    | `NodeFilter.SHOW_DOCUMENT`                               | `0x100`         | Hiển thị các nút {{domxref("Document")}}.         |
    | `NodeFilter.SHOW_DOCUMENT_FRAGMENT`                      | `0x400`         | Hiển thị các nút {{domxref("DocumentFragment")}}. |
    | `NodeFilter.SHOW_DOCUMENT_TYPE`                          | `0x200`         | Hiển thị các nút {{domxref("DocumentType")}}.     |
    | `NodeFilter.SHOW_ELEMENT`                                | `0x1`           | Hiển thị các nút {{domxref("Element")}}.          |
    | `NodeFilter.SHOW_ENTITY` {{deprecated_inline}}           | `0x20`          | Legacy, không còn hiệu lực.                       |
    | `NodeFilter.SHOW_ENTITY_REFERENCE` {{deprecated_inline}} | `0x10`          | Legacy, không còn hiệu lực.                       |
    | `NodeFilter.SHOW_NOTATION` {{deprecated_inline}}         | `0x800`         | Legacy, không còn hiệu lực.                       |
    | `NodeFilter.SHOW_PROCESSING_INSTRUCTION`                 | `0x40`          | Hiển thị các nút {{domxref("ProcessingInstruction")}}. |
    | `NodeFilter.SHOW_TEXT`                                   | `0x4`           | Hiển thị các nút {{domxref("Text")}}.             |

    > [!NOTE]
    > Hằng số `NodeFilter.SHOW_ATTRIBUTE` chỉ có hiệu lực khi root là một nút thuộc tính. Vì cha của bất kỳ nút `Attr` nào luôn là `null`, {{DOMXref("TreeWalker.nextNode()")}} và {{DOMXref("TreeWalker.previousNode()")}} sẽ không bao giờ trả về một nút `Attr`. Để duyệt các nút `Attr`, hãy sử dụng {{DOMXref("Element.attributes")}} thay thế.

- `filter` {{optional_inline}}
  - : Một hàm callback hoặc một đối tượng có phương thức `acceptNode()`. Hàm hoặc phương thức sẽ được gọi cho mỗi nút trong cây con dựa trên root được chấp nhận là được bao gồm bởi cờ whatToShow để xác định xem có bao gồm nó trong danh sách các nút có thể duyệt hay không. Phương thức sẽ trả về một trong các giá trị `NodeFilter.FILTER_ACCEPT`, `NodeFilter.FILTER_REJECT` hoặc `NodeFilter.FILTER_SKIP`. Xem [Ví dụ](#examples).

    Đối với `createNodeIterator`, các giá trị `NodeFilter.FILTER_REJECT` và `NodeFilter.FILTER_SKIP` là tương đương. Nút này sẽ không được bao gồm trong danh sách các nút có thể duyệt, nhưng các phần tử con của nó sẽ tiếp tục được duyệt.

### Giá trị trả về

Một đối tượng [`NodeIterator`](/en-US/docs/Web/API/NodeIterator) mới.

## Ví dụ

```js
const nodeIterator = document.createNodeIterator(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  (node) =>
    node.nodeName.toLowerCase() === "p"
      ? NodeFilter.FILTER_ACCEPT
      : NodeFilter.FILTER_REJECT,
);
const pars = [];
let currentNode;

while ((currentNode = nodeIterator.nextNode())) {
  pars.push(currentNode);
}
```

Tương tự, nhưng sử dụng một đối tượng có phương thức `acceptNode()`:

```js
const nodeIterator = document.createNodeIterator(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  {
    acceptNode(node) {
      return node.nodeName.toLowerCase() === "p"
        ? NodeFilter.FILTER_ACCEPT
        : NodeFilter.FILTER_REJECT;
    },
  },
);
const pars = [];
let currentNode;

while ((currentNode = nodeIterator.nextNode())) {
  pars.push(currentNode);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
