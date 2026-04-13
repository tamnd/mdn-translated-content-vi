---
title: "AbstractRange: thuộc tính endContainer"
short-title: endContainer
slug: Web/API/AbstractRange/endContainer
page-type: web-api-instance-property
browser-compat: api.AbstractRange.endContainer
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`endContainer`** của giao diện {{domxref("AbstractRange")}} trả về {{domxref("Node")}} chứa điểm kết thúc của phạm vi.

Để thay đổi vị trí kết thúc, hãy dùng phương thức {{domxref("Range.setEnd()")}} hoặc một phương thức tương tự.

## Giá trị

{{domxref("Node")}} chứa ký tự cuối cùng của phạm vi.

## Ví dụ

```js
const range = document.createRange();
range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);

const endRangeNode = range.endContainer;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
