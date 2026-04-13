---
title: "BlobEvent: thuộc tính timecode"
short-title: timecode
slug: Web/API/BlobEvent/timecode
page-type: web-api-instance-property
browser-compat: api.BlobEvent.timecode
---

{{APIRef("MediaStream Recording")}}

Thuộc tính chỉ đọc **`timecode`** của giao diện {{domxref("BlobEvent")}} cho biết chênh lệch giữa dấu thời gian của phần dữ liệu đầu tiên và dấu thời gian của phần dữ liệu đầu tiên trong `BlobEvent` đầu tiên do trình ghi này tạo ra.

Lưu ý rằng `timecode` trong `BlobEvent` đầu tiên được tạo ra không nhất thiết phải bằng 0.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
