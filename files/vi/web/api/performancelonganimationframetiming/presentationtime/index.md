---
title: "PerformanceLongAnimationFrameTiming: thuộc tính presentationTime"
short-title: presentationTime
slug: Web/API/PerformanceLongAnimationFrameTiming/presentationTime
page-type: web-api-instance-property
browser-compat: api.PerformanceLongAnimationFrameTiming.presentationTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`presentationTime`** của giao diện {{domxref("PerformanceLongAnimationFrameTiming")}} trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi bản cập nhật UI thực sự được vẽ lên màn hình.

`presentationTime` là tùy chọn, một số trình duyệt có thể chọn luôn trả về `0` hoặc không hiển thị giá trị. Giá trị cũng phụ thuộc vào triển khai, nó có thể khác nhau giữa các trình duyệt chọn hiển thị nó.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} hoặc {{jsxref("Operators/null", "null")}} nếu giá trị không được hiển thị.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceLongAnimationFrameTiming.paintTime")}}
