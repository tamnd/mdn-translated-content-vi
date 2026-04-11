---
title: "TextTrack: cuechange event"
short-title: cuechange
slug: Web/API/TextTrack/cuechange_event
page-type: web-api-event
browser-compat: api.TextTrack.cuechange_event
---

{{APIRef("WebVTT")}}

Sự kiện **`cuechange`** được kích hoạt khi {{domxref("TextTrack")}} thay đổi các cue đang được hiển thị. Sự kiện được kích hoạt trên cả `TextTrack` và {{domxref("HTMLTrackElement")}} mà nó đang được trình bày, nếu có.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cuechange", (event) => { })

oncuechange = (event) => { }
```

## Kiểu sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể thiết lập trình lắng nghe cho sự kiện `cuechange` trên một `TextTrack` bằng phương thức {{domxref("EventTarget.addEventListener", "addEventListener()")}}:

```js
track.addEventListener("cuechange", () => {
  const cues = track.activeCues; // array of current cues
  // …
});
```

Hoặc bạn có thể đặt thuộc tính trình xử lý sự kiện `oncuechange`:

```js
track.oncuechange = (event) => {
  let cues = track.activeCues; // array of current cues
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{glossary("WebVTT")}}
- Sự kiện tương tự trên {{domxref("HTMLTrackElement")}}: {{domxref("HTMLTrackElement.cuechange_event", "cuechange")}}
