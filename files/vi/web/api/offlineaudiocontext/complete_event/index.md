---
title: "OfflineAudioContext: sự kiện complete"
short-title: complete
slug: Web/API/OfflineAudioContext/complete_event
page-type: web-api-event
browser-compat: api.OfflineAudioContext.complete_event
---

{{APIRef("Web Audio API")}}

Sự kiện `complete` của giao diện {{domxref("OfflineAudioContext")}} được kích hoạt khi việc render của một offline audio context hoàn thành.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("complete", (event) => { })

oncomplete = (event) => { }
```

## Loại sự kiện

Một {{domxref("OfflineAudioCompletionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("OfflineAudioCompletionEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ lớp cha của nó, {{domxref("Event")}}_.

- {{domxref("OfflineAudioCompletionEvent.renderedBuffer")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioBuffer")}} chứa kết quả xử lý của một {{domxref("OfflineAudioContext")}}.

## Ví dụ

Khi quá trình xử lý hoàn thành, bạn có thể muốn sử dụng trình xử lý sự kiện `complete` để thông báo cho người dùng rằng âm thanh có thể phát được, và kích hoạt nút phát:

```js
const offlineAudioCtx = new OfflineAudioContext();

offlineAudioCtx.addEventListener("complete", () => {
  console.log("Offline audio processing now complete");
  alert("Song processed and ready to play");
  playBtn.disabled = false;
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng thuộc tính `oncomplete`:

```js
const offlineAudioCtx = new OfflineAudioContext();

offlineAudioCtx.oncomplete = () => {
  console.log("Offline audio processing now complete");
  alert("Song processed and ready to play");
  playBtn.disabled = false;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
