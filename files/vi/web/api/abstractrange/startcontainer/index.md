---
title: "AbstractRange: thuộc tính startContainer"
short-title: startContainer
slug: Web/API/AbstractRange/startContainer
page-type: web-api-instance-property
browser-compat: api.AbstractRange.startContainer
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`startContainer`** của giao diện {{domxref("AbstractRange")}} trả về {{domxref("Node")}} chứa điểm bắt đầu của phạm vi.

Để thay đổi vị trí bắt đầu, hãy dùng phương thức {{domxref("Range.setStart()")}} hoặc một phương thức tương tự.

## Giá trị

{{domxref("Node")}} chứa vị trí bắt đầu của phạm vi.

## Ví dụ

```js
const range = document.createRange();
range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);

const startRangeNode = range.startContainer;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
