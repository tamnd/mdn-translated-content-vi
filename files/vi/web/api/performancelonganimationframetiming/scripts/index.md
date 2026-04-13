---
title: "PerformanceLongAnimationFrameTiming: thuộc tính scripts"
short-title: scripts
slug: Web/API/PerformanceLongAnimationFrameTiming/scripts
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceLongAnimationFrameTiming.scripts
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`scripts`** của giao diện {{domxref("PerformanceLongAnimationFrameTiming")}} trả về một mảng các đối tượng {{domxref("PerformanceScriptTiming")}}.

Thông tin quy cho script chỉ được cung cấp cho các script chạy trong luồng chính của một trang, bao gồm `<iframe>` cùng origin. Tuy nhiên, `<iframe>` cross-origin, [web worker](/en-US/docs/Web/API/Web_Workers_API), [service worker](/en-US/docs/Web/API/Service_Worker_API) và mã [extension](/en-US/docs/Mozilla/Add-ons/WebExtensions) sẽ không có thông tin quy cho script trong các khung hoạt hình dài, ngay cả khi chúng ảnh hưởng đến thời lượng của một khung.

## Giá trị

Một mảng các đối tượng {{domxref("PerformanceScriptTiming")}}.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceScriptTiming")}}
