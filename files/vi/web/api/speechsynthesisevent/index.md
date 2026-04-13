---
title: SpeechSynthesisEvent
slug: Web/API/SpeechSynthesisEvent
page-type: web-api-interface
browser-compat: api.SpeechSynthesisEvent
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechSynthesisEvent`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) chứa thông tin về trạng thái hiện tại của các đối tượng {{domxref("SpeechSynthesisUtterance")}} đã được xử lý trong dịch vụ giọng nói.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SpeechSynthesisEvent.SpeechSynthesisEvent", "SpeechSynthesisEvent()")}}
  - : Tạo một `SpeechSynthesisEvent` mới.

## Thuộc tính phiên bản

_Giao diện `SpeechSynthesisEvent` cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("SpeechSynthesisEvent.charIndex")}} {{ReadOnlyInline}}
  - : Trả về vị trí chỉ mục của ký tự trong {{domxref("SpeechSynthesisUtterance.text")}} đang được nói khi sự kiện được kích hoạt.
- {{domxref("SpeechSynthesisEvent.charLength")}} {{ReadOnlyInline}}
  - : Trả về số ký tự còn lại cần được nói sau vị trí `charIndex`, nếu công cụ đọc hỗ trợ. Trả về 0 nếu công cụ đọc không thể cung cấp thông tin này.
- {{domxref("SpeechSynthesisEvent.elapsedTime")}} {{ReadOnlyInline}}
  - : Trả về thời gian đã trôi qua tính bằng giây sau khi {{domxref("SpeechSynthesisUtterance.text")}} bắt đầu được nói mà sự kiện được kích hoạt.
- {{domxref("SpeechSynthesisEvent.name")}} {{ReadOnlyInline}}
  - : Trả về tên liên kết với một số loại sự kiện xảy ra khi {{domxref("SpeechSynthesisUtterance.text")}} đang được nói: tên của điểm đánh dấu [SSML](https://www.w3.org/TR/speech-synthesis/#S3.3.2) được đạt tới trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.mark_event", "mark")}}, hoặc loại ranh giới được đạt tới trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.boundary_event", "boundary")}}.
- {{domxref("SpeechSynthesisEvent.utterance")}} {{ReadOnlyInline}}
  - : Trả về thực thể {{domxref("SpeechSynthesisUtterance")}} mà sự kiện được kích hoạt trên đó.

## Phương thức phiên bản

_Giao diện `SpeechSynthesisEvent` cũng kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Ví dụ

```js
utterThis.onpause = (event) => {
  const char = event.utterance.text.charAt(event.charIndex);
  console.log(
    `Speech paused at character ${event.charIndex} of "${event.utterance.text}", which is "${char}".`,
  );
};

utterThis.onboundary = (event) => {
  console.log(
    `${event.name} boundary reached after ${event.elapsedTime} seconds.`,
  );
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
