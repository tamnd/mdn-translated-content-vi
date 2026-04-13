---
title: "BufferedChangeEvent: thuộc tính addedRanges"
short-title: addedRanges
slug: Web/API/BufferedChangeEvent/addedRanges
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BufferedChangeEvent.addedRanges
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`addedRanges`** của giao diện {{domxref("BufferedChangeEvent")}} trả về một đối tượng {{domxref("TimeRanges")}} biểu diễn các khoảng thời gian đã được thêm vào {{domxref("ManagedSourceBuffer")}} liên kết. Đây là các khoảng được thêm vào giữa các sự kiện `updatestart` và `updateend` gần nhất, trong lần chạy gần đây nhất của thuật toán xử lý coded frame.

## Giá trị

Một đối tượng {{domxref("TimeRanges")}}.

## Ví dụ

Xem trang chính của {{domxref("BufferedChangeEvent")}} để biết ví dụ minh họa cách sử dụng `addedRanges`.

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BufferedChangeEvent.removedRanges")}}
- Sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}}
- {{domxref("ManagedSourceBuffer")}}
- {{domxref("TimeRanges")}}
