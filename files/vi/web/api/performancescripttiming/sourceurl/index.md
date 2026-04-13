---
title: "PerformanceScriptTiming: sourceURL property"
short-title: sourceURL
slug: Web/API/PerformanceScriptTiming/sourceURL
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.sourceURL
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`sourceURL`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một chuỗi đại diện cho URL của tập lệnh.

Điều quan trọng cần lưu ý là vị trí hàm được báo cáo sẽ là "điểm vào" của tập lệnh, tức là cấp cao nhất của ngăn xếp, không phải bất kỳ hàm con nào chậm cụ thể. Xem {{domxref("PerformanceScriptTiming.sourceFunctionName")}} để có thêm thảo luận về vấn đề này.

## Giá trị

Một chuỗi. Trả về một chuỗi rỗng nếu không tìm thấy URL.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
