---
title: "PerformancePaintTiming: paintTime property"
short-title: paintTime
slug: Web/API/PerformancePaintTiming/paintTime
page-type: web-api-instance-property
browser-compat: api.PerformancePaintTiming.paintTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`paintTime`** của giao diện {{domxref("PerformancePaintTiming")}} trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi giai đoạn rendering kết thúc và giai đoạn paint bắt đầu.

`paintTime` có thể tương thích rộng rãi: Giá trị này nên giống nhau trên các triển khai khác nhau.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

Xem [Lấy thời gian paint và presentation riêng biệt](/en-US/docs/Web/API/PerformancePaintTiming#getting_separate_paint_and_presentation_timings).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformancePaintTiming.presentationTime")}}
