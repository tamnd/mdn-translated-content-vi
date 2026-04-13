---
title: "SpeechSynthesisEvent: elapsedTime property"
short-title: elapsedTime
slug: Web/API/SpeechSynthesisEvent/elapsedTime
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisEvent.elapsedTime
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`elapsedTime`** của giao diện {{domxref("SpeechSynthesisEvent")}} trả về thời gian đã trôi qua tính bằng giây, sau khi {{domxref("SpeechSynthesisUtterance.text")}} bắt đầu được nói, tại thời điểm [sự kiện](/en-US/docs/Web/API/SpeechSynthesisUtterance#events) được kích hoạt.

## Giá trị

Một số thực chứa thời gian đã trôi qua, tính bằng giây.

> [!NOTE]
> Các phiên bản đầu tiên của thông số kỹ thuật yêu cầu thời gian đã trôi qua theo mili giây.
> Kiểm tra [bảng tương thích](#browser_compatibility) bên dưới để biết thông tin về trình duyệt của bạn.

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
