---
title: "RTCDTMFToneChangeEvent: thuộc tính tone"
short-title: tone
slug: Web/API/RTCDTMFToneChangeEvent/tone
page-type: web-api-instance-property
browser-compat: api.RTCDTMFToneChangeEvent.tone
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`RTCDTMFToneChangeEvent.tone`** trả về ký tự DTMF vừa mới bắt đầu phát, hoặc một chuỗi rỗng (`""`) nếu tất cả các âm đã được xếp hàng đã kết thúc phát (nghĩa là {{domxref("RTCDTMFSender.toneBuffer")}} trống).

## Giá trị

Một chuỗi với ký tự DTMF đang phát, hoặc chuỗi rỗng.

## Ví dụ

Ví dụ này thiết lập một trình xử lý cho sự kiện [`tonechange`](/en-US/docs/Web/API/RTCDTMFSender/tonechange_event) cập nhật một phần tử để hiển thị âm đang phát trong nội dung của nó, hoặc nếu tất cả các âm đã phát, chuỗi "\<none>".

```js
dtmfSender.ontonechange = (ev) => {
  let tone = ev.tone;
  if (tone === "") {
    tone = "&lt;none&gt;";
  }

  document.getElementById("playingTone").innerText = tone;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng DTMF với WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- {{domxref("RTCDTMFSender/tonechange_event", "tonechange")}}
- {{domxref("RTCDTMFToneChangeEvent")}}
