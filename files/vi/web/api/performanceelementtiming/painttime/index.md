---
title: "PerformanceElementTiming: paintTime property"
short-title: paintTime
slug: Web/API/PerformanceElementTiming/paintTime
page-type: web-api-instance-property
browser-compat: api.PerformanceElementTiming.paintTime
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`paintTime`** của giao diện {{domxref("PerformanceElementTiming")}} trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi giai đoạn render kết thúc và giai đoạn vẽ bắt đầu.

`paintTime` có tính tương thích rộng rãi: giá trị này phải giống nhau trên các triển khai khác nhau.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

Xem [Quan sát thời gian vẽ và trình bày riêng biệt](/en-US/docs/Web/API/PerformanceElementTiming#observing_separate_paint_and_presentation_timings).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceElementTiming.presentationTime")}}
