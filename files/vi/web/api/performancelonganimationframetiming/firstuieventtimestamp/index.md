---
title: "PerformanceLongAnimationFrameTiming: thuộc tính firstUIEventTimestamp"
short-title: firstUIEventTimestamp
slug: Web/API/PerformanceLongAnimationFrameTiming/firstUIEventTimestamp
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceLongAnimationFrameTiming.firstUIEventTimestamp
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`firstUIEventTimestamp`** của giao diện {{domxref("PerformanceLongAnimationFrameTiming")}} trả về {{domxref("DOMHighResTimeStamp")}} cho biết thời gian của sự kiện UI đầu tiên (chẳng hạn như sự kiện chuột hoặc bàn phím) được xử lý trong khung hoạt hình hiện tại. Lưu ý rằng timestamp này có thể trước khi bắt đầu khung hoạt hình này nếu có độ trễ giữa sự kiện xảy ra và được xử lý.

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
