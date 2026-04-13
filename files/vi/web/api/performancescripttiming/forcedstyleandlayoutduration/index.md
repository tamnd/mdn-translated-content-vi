---
title: "PerformanceScriptTiming: forcedStyleAndLayoutDuration property"
short-title: forcedStyleAndLayoutDuration
slug: Web/API/PerformanceScriptTiming/forcedStyleAndLayoutDuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.forcedStyleAndLayoutDuration
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`forcedStyleAndLayoutDuration`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một {{domxref("DOMHighResTimeStamp")}} cho biết tổng thời gian, tính bằng mili giây, tập lệnh xử lý bố cục/kiểu bị ép buộc. Xem [Avoid layout thrashing](https://web.dev/articles/avoid-large-complex-layouts-and-layout-thrashing#avoid_layout_thrashing) để hiểu nguyên nhân gây ra điều này.

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
- {{domxref("PerformanceLongAnimationFrameTiming")}}
