---
title: "PerformanceLongAnimationFrameTiming: thuộc tính renderStart"
short-title: renderStart
slug: Web/API/PerformanceLongAnimationFrameTiming/renderStart
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceLongAnimationFrameTiming.renderStart
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`renderStart`** của giao diện {{domxref("PerformanceLongAnimationFrameTiming")}} trả về {{domxref("DOMHighResTimeStamp")}} cho biết thời gian bắt đầu của chu kỳ kết xuất, bao gồm các callback {{domxref("Window.requestAnimationFrame()")}}, tính toán style và layout, các callback {{domxref("ResizeObserver")}} và các callback {{domxref("IntersectionObserver")}}.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceScriptTiming")}}
