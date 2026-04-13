---
title: "HTMLTrackElement: sự kiện cuechange"
short-title: cuechange
slug: Web/API/HTMLTrackElement/cuechange_event
page-type: web-api-event
browser-compat: api.HTMLTrackElement.cuechange_event
---

{{APIRef("WebVTT")}}

Sự kiện **`cuechange`** kích hoạt khi một {{domxref("TextTrack")}} đã thay đổi các cue đang hiển thị. Sự kiện được kích hoạt trên cả `TextTrack` và {{domxref("HTMLTrackElement")}} nơi nó đang được trình bày, nếu có.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cuechange", (event) => { })

oncuechange = (event) => { }
```

## Kiểu sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

{{domxref("TextTrack")}} bên dưới, được chỉ ra bởi thuộc tính {{domxref("HTMLTrackElement.track", "track")}}, nhận sự kiện `cuechange` mỗi khi cue đang trình bày thay đổi. Điều này xảy ra ngay cả khi track không liên kết với phần tử media.

Nếu track _được_ liên kết với phần tử media, sử dụng phần tử {{HTMLElement("track")}} như một phần tử con của {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}, sự kiện `cuechange` cũng được gửi đến {{domxref("HTMLTrackElement")}}.

```js
let textTrackElem = document.getElementById("text-track");

textTrackElem.addEventListener("cuechange", (event) => {
  let cues = event.target.track.activeCues;
});
```

Hoặc, bạn có thể sử dụng trình xử lý sự kiện `oncuechange`:

```js
let textTrackElem = document.getElementById("text-track");

textTrackElem.oncuechange = (event) => {
  let cues = event.target.track.activeCues;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{glossary("WebVTT")}}
- Sự kiện tương tự trên {{domxref("TextTrack")}}: {{domxref("TextTrack.cuechange_event", "cuechange")}}
