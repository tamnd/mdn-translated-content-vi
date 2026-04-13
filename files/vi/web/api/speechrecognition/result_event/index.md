---
title: "SpeechRecognition: Sự kiện result"
short-title: result
slug: Web/API/SpeechRecognition/result_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.result_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`result`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi dịch vụ nhận dạng giọng nói trả về một kết quả — một từ hoặc cụm từ đã được nhận dạng thành công và điều này đã được thông báo lại cho ứng dụng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("result", (event) => { })

onresult = (event) => { }
```

## Loại sự kiện

Một {{domxref("SpeechRecognitionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SpeechRecognitionEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng khả dụng._

- {{domxref("SpeechRecognitionEvent.emma")}} {{ReadOnlyInline}}
  - : Trả về biểu diễn bằng ngôn ngữ đánh dấu chú thích đa phương tiện mở rộng (EMMA) — XML — của kết quả.
- {{domxref("SpeechRecognitionEvent.interpretation")}} {{ReadOnlyInline}}
  - : Trả về ý nghĩa ngữ nghĩa của những gì người dùng đã nói.
- {{domxref("SpeechRecognitionEvent.resultIndex")}} {{ReadOnlyInline}}
  - : Trả về giá trị chỉ mục thấp nhất trong "mảng" {{domxref("SpeechRecognitionResultList")}} đã thực sự thay đổi.
- {{domxref("SpeechRecognitionEvent.results")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SpeechRecognitionResultList")}} biểu diễn tất cả các kết quả nhận dạng giọng nói cho phiên hiện tại.

## Ví dụ

Đoạn mã này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng ta.

Bạn có thể sử dụng sự kiện `result` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new SpeechRecognition();

recognition.addEventListener("result", (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onresult`:

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
