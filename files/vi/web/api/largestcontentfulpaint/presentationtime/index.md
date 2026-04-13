---
title: "LargestContentfulPaint: thuộc tính presentationTime"
short-title: presentationTime
slug: Web/API/LargestContentfulPaint/presentationTime
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.presentationTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`presentationTime`** của giao diện {{domxref("LargestContentfulPaint")}} trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi các điểm ảnh được vẽ thực sự xuất hiện trên màn hình.

`presentationTime` là tùy chọn — một số trình duyệt có thể luôn trả về `0` hoặc không hiển thị giá trị. Giá trị cũng phụ thuộc vào triển khai — nó có thể khác nhau giữa các trình duyệt chọn hiển thị nó.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} hoặc {{jsxref("Operators/null", "null")}} nếu giá trị không được hiển thị.

## Ví dụ

Xem [Quan sát thời gian vẽ và trình bày riêng biệt](/en-US/docs/Web/API/LargestContentfulPaint#observing_separate_paint_and_presentation_timings).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("LargestContentfulPaint.paintTime")}}
