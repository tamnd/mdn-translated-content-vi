---
title: "TextTrackList: change event"
short-title: change
slug: Web/API/TextTrackList/change_event
page-type: web-api-event
browser-compat: api.TextTrackList.change_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`change`** được kích hoạt khi một text track được kích hoạt hoặc vô hiệu hóa, hoặc khi {{domxref('TextTrackList')}} bị thay đổi theo cách khác.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Kiểu sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung nào.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const mediaElement = document.querySelectorAll("video, audio")[0];
mediaElement.textTracks.addEventListener("change", (event) => {
  console.log(`'${event.type}' event fired`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onchange`:

```js
const mediaElement = document.querySelector("video, audio");
mediaElement.textTracks.onchange = (event) => {
  console.log(`'${event.type}' event fired`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event), [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event)
- Sự kiện này trên [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList): [`change`](/en-US/docs/Web/API/VideoTrackList/change_event)
- Sự kiện này trên [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList): [`change`](/en-US/docs/Web/API/AudioTrackList/change_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
