---
title: "MediaStreamEvent: hàm khởi tạo MediaStreamEvent()"
short-title: MediaStreamEvent()
slug: Web/API/MediaStreamEvent/MediaStreamEvent
page-type: web-api-constructor
status:
  - deprecated
  - non-standard
browser-compat: api.MediaStreamEvent.MediaStreamEvent
---

{{APIRef("WebRTC")}}{{Deprecated_Header}}{{Non-standard_Header}}

Hàm khởi tạo **`MediaStreamEvent()`** tạo một đối tượng {{domxref("MediaStreamEvent")}} mới.

## Cú pháp

```js-nolint
 new MediaStreamEvent(type, options)
```

### Giá trị

- `type`
  - : Chuỗi chứa tên của sự kiện, như `addstream` hoặc `removestream`.
- `options`
  - : Một đối tượng, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}, có thể có các thuộc tính sau:
    - `stream`
      - : Một {{domxref("MediaStream")}} đại diện cho luồng liên quan đến sự kiện.

### Giá trị trả về

Một đối tượng {{domxref("MediaStreamEvent")}} mới.

## Ví dụ

```js
// s is a MediaStream
const event = new MediaStreamEvent("addstream", { stream: s });
```

## Thông số kỹ thuật

_Tính năng này không còn là một phần của bất kỳ đặc tả nào._

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
