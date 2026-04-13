---
title: "SpeechSynthesisEvent: name property"
short-title: name
slug: Web/API/SpeechSynthesisEvent/name
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisEvent.name
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("SpeechSynthesisUtterance")}} trả về tên liên kết với một số loại sự kiện xảy ra khi {{domxref("SpeechSynthesisUtterance.text")}} đang được nói:
tên của điểm đánh dấu [SSML](https://www.w3.org/TR/speech-synthesis/#S3.3.2) được đạt tới trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.mark_event", "mark")}}, hoặc loại ranh giới được đạt tới trong trường hợp sự kiện {{domxref("SpeechSynthesisUtterance.boundary_event", "boundary")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
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
