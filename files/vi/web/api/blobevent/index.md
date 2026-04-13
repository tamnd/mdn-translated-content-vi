---
title: BlobEvent
slug: Web/API/BlobEvent
page-type: web-api-interface
browser-compat: api.BlobEvent
---

{{APIRef("MediaStream Recording")}}

Giao diện **`BlobEvent`** của [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API) biểu diễn các sự kiện liên kết với một {{domxref("Blob")}}. Các blob này thường, nhưng không nhất thiết, gắn với nội dung đa phương tiện.

{{InheritanceDiagram}}

## Bộ hàm dựng

- {{domxref("BlobEvent.BlobEvent", "BlobEvent()")}}
  - : Tạo một sự kiện `BlobEvent` với các tham số đã cho.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ {{domxref("Event")}} cha của nó._

- {{domxref("BlobEvent.data")}} {{ReadOnlyInline}}
  - : Một {{domxref("Blob")}} biểu diễn dữ liệu liên kết với sự kiện. Sự kiện được kích hoạt trên {{domxref("EventTarget")}} do có điều gì đó xảy ra với {{domxref("Blob")}} cụ thể đó.
- {{domxref("BlobEvent.timecode")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết chênh lệch giữa dấu thời gian của phần dữ liệu đầu tiên trong dữ liệu và dấu thời gian của phần dữ liệu đầu tiên trong `BlobEvent` đầu tiên do trình ghi này tạo ra. Lưu ý rằng `timecode` trong `BlobEvent` đầu tiên được tạo ra không nhất thiết phải bằng 0.

## Phương thức thể hiện

_Không có phương thức cụ thể; kế thừa các phương thức từ {{domxref("Event")}} cha của nó._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện cơ sở {{domxref("Event")}}.
- [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API): Gửi các đối tượng `BlobEvent` mỗi khi một phần dữ liệu đa phương tiện đã sẵn sàng.
- [Using the MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
