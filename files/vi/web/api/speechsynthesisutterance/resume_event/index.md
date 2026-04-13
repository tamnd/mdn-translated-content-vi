---
title: "SpeechSynthesisUtterance: resume event"
short-title: resume
slug: Web/API/SpeechSynthesisUtterance/resume_event
page-type: web-api-event
browser-compat: api.SpeechSynthesisUtterance.resume_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`resume`** của đối tượng {{domxref("SpeechSynthesisUtterance")}} thuộc [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi yêu cầu phát âm đã bị tạm dừng được tiếp tục.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("resume", (event) => { })

onresume = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("SpeechSynthesisEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SpeechSynthesisEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("SpeechSynthesisEvent.charIndex", "charIndex")}} {{ReadOnlyInline}}
  - : Trả về vị trí chỉ mục của ký tự trong {{domxref("SpeechSynthesisUtterance.text")}} đang được nói khi sự kiện được kích hoạt.
- {{domxref("SpeechSynthesisEvent.elapsedTime", "elapsedTime")}} {{ReadOnlyInline}}
  - : Trả về thời gian đã trôi qua tính bằng giây sau khi {{domxref("SpeechSynthesisUtterance.text")}} bắt đầu được nói tại thời điểm sự kiện được kích hoạt.
- {{domxref("SpeechSynthesisEvent.name", "name")}} {{ReadOnlyInline}}
  - : Trả về tên được liên kết với một số loại sự kiện xảy ra khi {{domxref("SpeechSynthesisUtterance.text")}} đang được nói: tên của marker [SSML](https://www.w3.org/TR/speech-synthesis/#S3.3.2) đạt đến trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.mark_event", "mark")}}, hoặc loại ranh giới đạt đến trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.boundary_event", "boundary")}}.
- {{domxref("SpeechSynthesisEvent.utterance", "utterance")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("SpeechSynthesisUtterance")}} mà sự kiện được kích hoạt trên đó.

## Ví dụ

Bạn có thể sử dụng sự kiện `resume` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
utterThis.addEventListener("resume", (event) => {
  console.log(`Speech resumed after ${event.elapsedTime} seconds.`);
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onresume`:

```js
utterThis.onresume = (event) => {
  console.log(`Speech resumed after ${event.elapsedTime} seconds.`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
