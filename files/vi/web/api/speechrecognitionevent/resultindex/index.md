---
title: "SpeechRecognitionEvent: thuộc tính resultIndex"
short-title: resultIndex
slug: Web/API/SpeechRecognitionEvent/resultIndex
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionEvent.resultIndex
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`resultIndex`** của giao diện {{domxref("SpeechRecognitionEvent")}} trả về giá trị chỉ số kết quả thấp nhất trong "mảng" {{domxref("SpeechRecognitionResultList")}} đã thực sự thay đổi.

Đối tượng {{domxref("SpeechRecognitionResultList")}} không phải là mảng, nhưng nó có getter cho phép truy cập bằng cú pháp mảng.

## Giá trị

Một số.

## Ví dụ

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
  console.log(event.resultIndex); // trả về 0 nếu chỉ có một kết quả
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
