---
title: "AudioContext: sự kiện sinkchange"
short-title: sinkchange
slug: Web/API/AudioContext/sinkchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.AudioContext.sinkchange_event
---

{{APIRef("Web Audio API")}}{{SeeCompatTable}}

Sự kiện **`sinkchange`** của giao diện {{domxref("AudioContext")}} được kích hoạt khi thiết bị đầu ra âm thanh (và do đó là {{domxref("AudioContext.sinkId")}}) đã thay đổi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("sinkchange", (event) => { })

onsinkchange = (event) => { }
```

## Kiểu sự kiện

{{domxref("Event")}}.

{{InheritanceDiagram("Event")}}

## Ví dụ

Một trình nghe sự kiện `sinkchange` có thể được dùng để báo cáo việc thay đổi thiết bị đầu ra âm thanh. Lưu ý rằng nếu {{domxref("AudioContext.sinkId", "sinkId")}} chứa một đối tượng {{domxref("AudioSinkInfo")}}, điều đó cho biết âm thanh đã được đổi sang trạng thái không phát trên bất kỳ thiết bị đầu ra nào.

```js
audioCtx.addEventListener("sinkchange", () => {
  if (typeof audioCtx.sinkId === "object" && audioCtx.sinkId.type === "none") {
    console.log("Audio changed to not play on any device");
  } else {
    console.log(`Audio output device changed to ${audioCtx.sinkId}`);
  }
});
```

Xem [ví dụ kiểm thử SetSinkId](https://mdn.github.io/dom-examples/audiocontext-setsinkid/) của chúng tôi để có mã hoạt động (đồng thời xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/audiocontext-setsinkid)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Change the destination output device in Web Audio](https://developer.chrome.com/blog/audiocontext-setsinkid/)
- {{domxref("AudioContext.setSinkId()")}}
- {{domxref("AudioContext.sinkId")}}
