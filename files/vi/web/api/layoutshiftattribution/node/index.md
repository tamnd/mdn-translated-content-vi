---
title: "LayoutShiftAttribution: node property"
short-title: node
slug: Web/API/LayoutShiftAttribution/node
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShiftAttribution.node
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`node`** của giao diện {{domxref("LayoutShiftAttribution")}} trả về một {{domxref("Node")}} đại diện cho đối tượng đã bị dịch chuyển.

## Giá trị

Một {{domxref("Node")}}.

## Ví dụ

Ví dụ sau in `node` của phần tử đầu tiên trong {{domxref("LayoutShift.sources")}} vào bảng điều khiển.

```js
new PerformanceObserver((list) => {
  for (const { sources } of list.getEntries()) {
    if (sources) {
      console.log(sources[0].node);
    }
  }
}).observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
