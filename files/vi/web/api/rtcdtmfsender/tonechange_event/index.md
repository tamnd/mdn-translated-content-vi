---
title: "RTCDTMFSender: tonechange event"
short-title: tonechange
slug: Web/API/RTCDTMFSender/tonechange_event
page-type: web-api-event
browser-compat: api.RTCDTMFSender.tonechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`tonechange`** được gửi đến một {{domxref("RTCDTMFSender")}} bởi [WebRTC API](/en-US/docs/Web/API/WebRTC_API) để cho biết khi nào các âm thanh {{Glossary("DTMF")}} đã được thêm vào hàng đợi để gửi trước đó (bằng cách gọi {{domxref("RTCDTMFSender.insertDTMF()")}}) bắt đầu và kết thúc.

Để xác định âm thanh nào bắt đầu phát, hoặc nếu một âm thanh dừng phát, hãy kiểm tra giá trị của thuộc tính {{domxref("RTCDTMFToneChangeEvent.tone", "tone")}} của sự kiện.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("tonechange", (event) => { })

ontonechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("RTCDTMFToneChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("RTCDTMFToneChangeEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính của {{domxref("Event")}}, giao diện này cung cấp thêm:_

- {{domxref("RTCDTMFToneChangeEvent.tone")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ định âm thanh đã bắt đầu phát, hoặc một chuỗi rỗng (`""`) nếu âm thanh trước đó đã dừng phát.

## Ví dụ

Ví dụ này thiết lập một trình xử lý cho sự kiện `tonechange` cập nhật một phần tử để hiển thị âm thanh đang phát trong nội dung của nó, hoặc nếu tất cả các âm thanh đã phát, chuỗi "\<none>".

Điều này có thể được thực hiện bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}}:

```js
dtmfSender.addEventListener("tonechange", (ev) => {
  let tone = ev.tone;
  if (tone === "") {
    tone = "&lt;none&gt;";
  }

  document.getElementById("playingTone").innerText = tone;
});
```

Bạn cũng có thể chỉ đặt thuộc tính xử lý sự kiện `ontonechange` trực tiếp:

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
