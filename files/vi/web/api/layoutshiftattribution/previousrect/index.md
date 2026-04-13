---
title: "LayoutShiftAttribution: previousRect property"
short-title: previousRect
slug: Web/API/LayoutShiftAttribution/previousRect
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShiftAttribution.previousRect
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`previousRect`** của giao diện {{domxref("LayoutShiftAttribution")}} trả về một đối tượng {{domxref("DOMRectReadOnly")}} đại diện cho vị trí của phần tử trước khi dịch chuyển.

## Giá trị

Một đối tượng {{domxref("DOMRectReadOnly")}}.

## Ví dụ

Ví dụ sau in `previousRect` của phần tử đầu tiên trong {{domxref("LayoutShift.sources")}} vào bảng điều khiển.

```js
new PerformanceObserver((list) => {
  for (const { sources } of list.getEntries()) {
    if (sources) {
      console.log(sources[0].previousRect);
    }
  }
}).observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
