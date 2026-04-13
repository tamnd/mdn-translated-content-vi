---
title: LayoutShiftAttribution
slug: Web/API/LayoutShiftAttribution
page-type: web-api-interface
status:
  - experimental
browser-compat: api.LayoutShiftAttribution
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Giao diện `LayoutShiftAttribution` cung cấp thông tin gỡ lỗi về các phần tử đã bị dịch chuyển.

Các phiên bản của `LayoutShiftAttribution` được trả về trong một mảng khi gọi {{domxref("LayoutShift.sources")}}.

## Thuộc tính phiên bản

- {{domxref("LayoutShiftAttribution.node")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về phần tử đã bị dịch chuyển (null nếu đã bị xóa).
- {{domxref("LayoutShiftAttribution.previousRect")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("DOMRectReadOnly")}} đại diện cho vị trí của phần tử trước khi dịch chuyển.
- {{domxref("LayoutShiftAttribution.currentRect")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("DOMRectReadOnly")}} đại diện cho vị trí của phần tử sau khi dịch chuyển.

## Phương thức phiên bản

- {{domxref("LayoutShiftAttribution.toJSON()")}} {{Experimental_Inline}}
  - : Trả về biểu diễn JSON của đối tượng `LayoutShiftAttribution`.

## Ví dụ

Ví dụ sau quan sát các dịch chuyển bố cục và xác định phần tử có tác động lớn nhất. Mảng `sources` được sắp xếp theo diện tích tác động theo thứ tự giảm dần, vì vậy phần tử đầu tiên (`sources[0]`) đại diện cho phần tử đóng góp nhiều nhất vào sự dịch chuyển bố cục. Để biết thêm chi tiết, xem [Debug Web Vitals in the field](https://web.dev/articles/debug-performance-in-the-field).

```js
const observer = new PerformanceObserver((list) => {
  for (const entry of list.getEntries()) {
    if (!entry.sources || entry.sources.length === 0) continue;

    const mostImpactfulSource = entry.sources[0];
    console.log("Layout shift score:", entry.value);
    console.log("Most impactful element:", largestShiftSource.node);
    console.log("Previous position:", largestShiftSource.previousRect);
    console.log("Current position:", largestShiftSource.currentRect);
  }
});

observer.observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Debug layout shifts](https://web.dev/articles/debug-layout-shifts)
- [Debug Web Vitals in the field](https://web.dev/articles/debug-performance-in-the-field)
