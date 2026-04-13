---
title: "PerformanceScriptTiming: window property"
short-title: window
slug: Web/API/PerformanceScriptTiming/window
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.window
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`window`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một tham chiếu đến đối tượng {{domxref("Window")}} đại diện cho `window` của vùng chứa (tức là tài liệu cấp cao nhất hoặc {{htmlelement("iframe")}}) trong đó tập lệnh gây ra khung hoạt hình dài (LoAF) được thực thi.

## Giá trị

Một đối tượng {{domxref("Window")}}, hoặc `null` nếu cửa sổ không còn hoạt động (tham chiếu đối tượng là một [`WeakRef`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef)).

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
