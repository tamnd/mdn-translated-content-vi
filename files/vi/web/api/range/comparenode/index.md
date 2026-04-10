---
title: "Range: phương thức compareNode()"
short-title: compareNode()
slug: Web/API/Range/compareNode
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Range.compareNode
---

{{APIRef("DOM")}}{{deprecated_header}}{{Non-standard_Header}}

Phương thức **`compareNode()`** của giao diện {{domxref("Range")}} trả về một hằng số cho biết vị trí của {{DOMxRef("Node")}}.

## Cú pháp

```js-nolint
compareNode(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{DOMxRef("Node")}} cần so sánh với `Range`.

### Giá trị trả về

Một hằng số cho biết vị trí của {{DOMxRef("Node")}}. Các giá trị có thể là:

- `NODE_BEFORE` (`0`)
  - : Node bắt đầu trước Range
- `NODE_AFTER` (`1`)
  - : Node kết thúc sau Range
- `NODE_BEFORE_AND_AFTER` (`2`)
  - : Node bắt đầu trước và kết thúc sau Range
- `NODE_INSIDE` (`3`)
  - : Node bắt đầu sau và kết thúc trước Range, tức là Node được Range chọn hoàn toàn.

## Ví dụ

```js
range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
returnValue = range.compareNode(document.getElementsByTagName("p").item(0));
```

## Ghi chú

Phương thức này không chuẩn. Có thể dùng hàm sau để thay thế:

```js
function rangeCompareNode(range, node) {
  const nodeRange = node.ownerDocument.createRange();
  try {
    nodeRange.selectNode(node);
  } catch (e) {
    nodeRange.selectNodeContents(node);
  }
  const nodeIsBefore =
    range.compareBoundaryPoints(Range.START_TO_START, nodeRange) === 1;
  const nodeIsAfter =
    range.compareBoundaryPoints(Range.END_TO_END, nodeRange) === -1;

  if (nodeIsBefore && !nodeIsAfter) return 0;
  if (!nodeIsBefore && nodeIsAfter) return 1;
  if (nodeIsBefore && nodeIsAfter) return 2;

  return 3;
}
```

## Thông số kỹ thuật

Phương thức này không chuẩn nên không thuộc bất kỳ đặc tả nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
