---
title: "PerformanceScriptTiming: sourceCharPosition property"
short-title: sourceCharPosition
slug: Web/API/PerformanceScriptTiming/sourceCharPosition
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.sourceCharPosition
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`sourceCharPosition`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một số đại diện cho vị trí ký tự tập lệnh của tính năng tập lệnh góp phần vào khung hoạt hình dài (LoAF).

Điều quan trọng cần lưu ý là vị trí hàm được báo cáo sẽ là "điểm vào" của tập lệnh, tức là cấp cao nhất của ngăn xếp, không phải bất kỳ hàm con nào chậm cụ thể. Xem {{domxref("PerformanceScriptTiming.sourceFunctionName")}} để có thêm thảo luận về vấn đề này.

## Giá trị

Một số. Trả về `-1` nếu không tìm thấy vị trí ký tự tập lệnh.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
