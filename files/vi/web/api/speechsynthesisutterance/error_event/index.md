---
title: "SpeechSynthesisUtterance: error event"
short-title: error
slug: Web/API/SpeechSynthesisUtterance/error_event
page-type: web-api-event
browser-compat: api.SpeechSynthesisUtterance.error_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`error`** của đối tượng {{domxref("SpeechSynthesisUtterance")}} thuộc [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi xảy ra lỗi ngăn yêu cầu phát âm được nói thành công.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("SpeechSynthesisErrorEvent")}}. Kế thừa từ {{domxref("SpeechSynthesisEvent")}} và {{domxref("Event")}}.

{{InheritanceDiagram("SpeechSynthesisErrorEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("SpeechSynthesisEvent.charIndex", "charIndex")}} {{ReadOnlyInline}}
  - : Trả về vị trí chỉ mục của ký tự trong {{domxref("SpeechSynthesisUtterance.text")}} đang được nói khi sự kiện được kích hoạt.
- {{domxref("SpeechSynthesisEvent.elapsedTime", "elapsedTime")}} {{ReadOnlyInline}}
  - : Trả về thời gian đã trôi qua tính bằng giây sau khi {{domxref("SpeechSynthesisUtterance.text")}} bắt đầu được nói tại thời điểm sự kiện được kích hoạt.
- {{domxref("SpeechSynthesisErrorEvent.error", "error")}} {{ReadOnlyInline}}
  - : Trả về mã lỗi cho biết điều gì đã xảy ra với lần thử tổng hợp giọng nói.
- {{domxref("SpeechSynthesisEvent.name", "name")}} {{ReadOnlyInline}}
  - : Trả về tên được liên kết với một số loại sự kiện xảy ra khi {{domxref("SpeechSynthesisUtterance.text")}} đang được nói: tên của marker [SSML](https://www.w3.org/TR/speech-synthesis/#S3.3.2) đạt đến trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.mark_event", "mark")}}, hoặc loại ranh giới đạt đến trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.boundary_event", "boundary")}}.
- {{domxref("SpeechSynthesisEvent.utterance", "utterance")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("SpeechSynthesisUtterance")}} mà sự kiện được kích hoạt trên đó.

## Ví dụ

Bạn có thể sử dụng sự kiện `error` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
utterThis.addEventListener("error", (event) => {
  console.log(
    `An error has occurred with the speech synthesis: ${event.error}`,
  );
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onerror`:

```js
utterThis.onerror = (event) => {
  console.log(
    `An error has occurred with the speech synthesis: ${event.error}`,
  );
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
