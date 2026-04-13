---
title: "LargestContentfulPaint: thuộc tính paintTime"
short-title: paintTime
slug: Web/API/LargestContentfulPaint/paintTime
page-type: web-api-instance-property
browser-compat: api.LargestContentfulPaint.paintTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`paintTime`** của giao diện {{domxref("LargestContentfulPaint")}} trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi giai đoạn hiển thị kết thúc và giai đoạn vẽ bắt đầu.

`paintTime` có khả năng tương thích rộng rãi: giá trị này phải giống nhau trên các triển khai khác nhau.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

Xem [Quan sát thời gian vẽ và trình bày riêng biệt](/en-US/docs/Web/API/LargestContentfulPaint#observing_separate_paint_and_presentation_timings).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("LargestContentfulPaint.presentationTime")}}
