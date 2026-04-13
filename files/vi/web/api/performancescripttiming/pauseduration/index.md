---
title: "PerformanceScriptTiming: pauseDuration property"
short-title: pauseDuration
slug: Web/API/PerformanceScriptTiming/pauseDuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.pauseDuration
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`pauseDuration`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một {{domxref("DOMHighResTimeStamp")}} cho biết tổng thời gian, tính bằng mili giây, tập lệnh dành cho các thao tác đồng bộ "tạm dừng" (ví dụ: các lệnh gọi {{domxref("Window.alert()")}} hoặc các {{domxref("XMLHttpRequest")}} đồng bộ).

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
