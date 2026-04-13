---
title: "PerformanceElementTiming: presentationTime property"
short-title: presentationTime
slug: Web/API/PerformanceElementTiming/presentationTime
page-type: web-api-instance-property
browser-compat: api.PerformanceElementTiming.presentationTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`presentationTime`** của giao diện {{domxref("PerformanceElementTiming")}} trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi phần tử thực sự được vẽ trên màn hình.

`presentationTime` là tùy chọn — một số trình duyệt có thể chọn luôn trả về `0` hoặc không hiển thị giá trị này. Giá trị cũng phụ thuộc vào từng triển khai cụ thể — nó có thể khác nhau giữa các trình duyệt chọn hiển thị nó.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} hoặc {{jsxref("Operators/null", "null")}} nếu giá trị không được hiển thị.

## Ví dụ

Xem [Quan sát thời gian vẽ và trình bày riêng biệt](/en-US/docs/Web/API/PerformanceElementTiming#observing_separate_paint_and_presentation_timings).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceElementTiming.paintTime")}}
