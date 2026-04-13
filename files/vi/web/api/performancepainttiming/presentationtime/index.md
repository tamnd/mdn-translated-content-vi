---
title: "PerformancePaintTiming: presentationTime property"
short-title: presentationTime
slug: Web/API/PerformancePaintTiming/presentationTime
page-type: web-api-instance-property
browser-compat: api.PerformancePaintTiming.presentationTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`presentationTime`** của giao diện {{domxref("PerformancePaintTiming")}} trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi các pixel đã paint thực sự được vẽ lên màn hình.

`presentationTime` là tùy chọn, một số trình duyệt có thể luôn trả về `0` hoặc không hiển thị giá trị này. Giá trị cũng phụ thuộc vào triển khai, có thể khác nhau giữa các trình duyệt chọn hiển thị nó.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} hoặc {{jsxref("Operators/null", "null")}} nếu giá trị không được hiển thị.

## Ví dụ

Xem [Lấy thời gian paint và presentation riêng biệt](/en-US/docs/Web/API/PerformancePaintTiming#getting_separate_paint_and_presentation_timings).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformancePaintTiming.paintTime")}}
