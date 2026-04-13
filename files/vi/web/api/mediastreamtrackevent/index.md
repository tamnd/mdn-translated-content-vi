---
title: MediaStreamTrackEvent
slug: Web/API/MediaStreamTrackEvent
page-type: web-api-interface
browser-compat: api.MediaStreamTrackEvent
---

{{APIRef("Media Capture and Streams")}}

Giao diện **`MediaStreamTrackEvent`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} đại diện cho các sự kiện cho biết {{domxref("MediaStream")}} đã có track được thêm vào hoặc xóa khỏi luồng thông qua các lệnh gọi đến phương thức [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API). Các sự kiện này được gửi đến luồng khi những thay đổi này xảy ra.

{{InheritanceDiagram}}

Các sự kiện dựa trên giao diện này là {{domxref("MediaStream/addtrack_event", "addtrack")}} và {{domxref("MediaStream/removetrack_event", "removetrack")}}.

## Hàm khởi tạo

- {{domxref("MediaStreamTrackEvent.MediaStreamTrackEvent", "MediaStreamTrackEvent()")}}
  - : Xây dựng một `MediaStreamTrackEvent` mới với cấu hình được chỉ định.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

- {{domxref("MediaStreamTrackEvent.track")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("MediaStreamTrack")}} đại diện cho track liên quan đến sự kiện.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStream")}}: sự kiện {{domxref("MediaStream/addtrack_event", "addtrack")}} và {{domxref("MediaStream/removetrack_event", "removetrack")}}
- {{domxref("MediaStreamTrack")}}
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
