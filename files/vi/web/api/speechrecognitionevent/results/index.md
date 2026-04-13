---
title: "SpeechRecognitionEvent: thuộc tính results"
short-title: results
slug: Web/API/SpeechRecognitionEvent/results
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionEvent.results
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`results`** của giao diện {{domxref("SpeechRecognitionEvent")}} trả về đối tượng {{domxref("SpeechRecognitionResultList")}} đại diện cho tất cả kết quả nhận dạng giọng nói cho phiên hiện tại.

Cụ thể, đối tượng này sẽ chứa tất cả kết quả cuối cùng đã được trả về, theo sau là giả thuyết tốt nhất hiện tại cho tất cả kết quả tạm thời. Khi các sự kiện {{domxref("SpeechRecognition.result_event", "result")}} tiếp theo được kích hoạt, các kết quả tạm thời có thể bị ghi đè bởi kết quả tạm thời mới hơn hoặc kết quả cuối cùng. Các kết quả cuối cùng sẽ không bị ghi đè hoặc xóa.

## Giá trị

Đối tượng {{domxref("SpeechRecognitionResultList")}}.

## Ví dụ

Mã này được trích xuất từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
