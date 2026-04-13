---
title: "TrackEvent: TrackEvent() constructor"
short-title: TrackEvent()
slug: Web/API/TrackEvent/TrackEvent
page-type: web-api-constructor
browser-compat: api.TrackEvent.TrackEvent
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`TrackEvent()`** tạo và trả về một đối tượng {{domxref("TrackEvent")}} mới mô tả một sự kiện đã xảy ra trên danh sách các rãnh ({{domxref("AudioTrackList")}}, {{domxref("VideoTrackList")}}, hoặc {{domxref("TextTrackList")}}).

## Cú pháp

```js-nolint
new TrackEvent(type)
new TrackEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt nó thành `addtrack` hoặc `removetrack`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `track` {{optional_inline}}
      - : Rãnh mà sự kiện đề cập đến; mặc định là `null`, nhưng nên được đặt thành {{domxref("VideoTrack")}}, {{domxref("AudioTrack")}}, hoặc {{domxref("TextTrack")}} tùy theo loại rãnh.

### Giá trị trả về

Một đối tượng {{domxref("TrackEvent")}} mới, được khởi tạo như mô tả bởi các đầu vào của hàm khởi tạo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
