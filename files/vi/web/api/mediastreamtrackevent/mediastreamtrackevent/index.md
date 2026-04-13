---
title: "MediaStreamTrackEvent: hàm khởi tạo MediaStreamTrackEvent()"
short-title: MediaStreamTrackEvent()
slug: Web/API/MediaStreamTrackEvent/MediaStreamTrackEvent
page-type: web-api-constructor
browser-compat: api.MediaStreamTrackEvent.MediaStreamTrackEvent
---

{{APIRef("Media Capture and Streams")}}

Hàm khởi tạo **`MediaStreamTrackEvent()`** trả về một đối tượng {{domxref("MediaStreamTrackEvent")}} mới, đại diện cho sự kiện báo hiệu rằng {{domxref("MediaStreamTrack")}} đã được thêm vào hoặc xóa khỏi {{domxref("MediaStream")}}.

## Cú pháp

```js-nolint
new MediaStreamTrackEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `addtrack` hoặc `removetrack`.
- `options`
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `track`
      - : Đối tượng {{domxref("MediaStreamTrack")}} đại diện cho track đã được thêm vào hoặc xóa khỏi luồng.

### Giá trị trả về

Một đối tượng {{domxref("MediaStreamTrackEvent")}} mới, được khởi tạo dựa trên các tùy chọn được cung cấp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("MediaStream/addtrack_event", "addtrack")}} và {{domxref("MediaStream/removetrack_event", "removetrack")}}
- {{domxref("MediaStreamTrack")}}
- {{domxref("MediaStream")}}
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
