---
title: "LayoutShiftAttribution: currentRect property"
short-title: currentRect
slug: Web/API/LayoutShiftAttribution/currentRect
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShiftAttribution.currentRect
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`currentRect`** của giao diện {{domxref("LayoutShiftAttribution")}} trả về một đối tượng {{domxref("DOMRectReadOnly")}} đại diện cho vị trí của phần tử sau khi dịch chuyển.

## Giá trị

Một đối tượng {{domxref("DOMRectReadOnly")}}.

## Ví dụ

Ví dụ sau in `currentRect` của phần tử đầu tiên trong {{domxref("LayoutShift.sources")}} vào bảng điều khiển.

```js
new PerformanceObserver((list) => {
  for (const { sources } of list.getEntries()) {
    if (sources) {
      console.log(sources[0].currentRect);
    }
  }
}).observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
