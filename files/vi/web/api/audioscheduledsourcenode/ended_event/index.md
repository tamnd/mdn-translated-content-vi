---
title: "AudioScheduledSourceNode: sự kiện ended"
short-title: ended
slug: Web/API/AudioScheduledSourceNode/ended_event
page-type: web-api-event
browser-compat: api.AudioScheduledSourceNode.ended_event
---

{{APIRef("Web Audio API")}}

Sự kiện `ended` của giao diện {{domxref("AudioScheduledSourceNode")}} được kích hoạt khi nút nguồn đã dừng phát.

Sự kiện này xảy ra khi một {{domxref("AudioScheduledSourceNode")}} đã dừng phát, hoặc vì nó đạt tới thời điểm dừng được xác định trước, hoặc vì toàn bộ thời lượng âm thanh đã được phát, hoặc vì toàn bộ bộ đệm đã được phát xong.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("ended", (event) => { })

onended = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Trong ví dụ đơn giản này, một bộ lắng nghe cho sự kiện `ended` được thiết lập để bật nút "Start" trong giao diện người dùng khi nút dừng phát:

```js
node.addEventListener("ended", () => {
  document.getElementById("startButton").disabled = false;
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng thuộc tính `onended`:

```js
node.onended = () => {
  document.getElementById("startButton").disabled = false;
};
```

Để xem một ví dụ về cách dùng sự kiện ended, hãy xem [ví dụ audio-buffer của chúng tôi trên GitHub](https://mdn.github.io/webaudio-examples/audio-buffer/).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Sự kiện liên quan

- [audioprocess](/en-US/docs/Web/API/ScriptProcessorNode/audioprocess_event)
- [complete](/en-US/docs/Web/API/OfflineAudioContext/complete_event)

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
- Sự kiện {{domxref("HTMLMediaElement.ended_event", 'ended')}} của HTMLMediaElement
- Sự kiện {{domxref("MediaStreamTrack.ended_event", 'ended')}} của MediaStreamTrack
