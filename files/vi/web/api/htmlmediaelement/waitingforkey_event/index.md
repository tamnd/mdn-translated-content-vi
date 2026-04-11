---
title: "HTMLMediaElement: sự kiện waitingforkey"
short-title: waitingforkey
slug: Web/API/HTMLMediaElement/waitingforkey_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.waitingforkey_event
---

{{APIRef("Encrypted Media Extensions")}}

Sự kiện `waitingforkey` được kích hoạt tại một phần tử đa phương tiện khi phần tử này không thể phát lần đầu vì nó cần một khóa để giải mã dữ liệu sau và quá trình phát lại bị dừng.

Nếu khung video và/hoặc dữ liệu âm thanh cho vị trí phát lại hiện tại đã được giải mã, {{domxref("HTMLMediaElement.readyState", "readyState")}} được đặt thành [`HAVE_CURRENT_DATA`](/en-US/docs/Web/API/HTMLMediaElement/readyState#htmlmediaelement.have_current_data).
Ngược lại, kể cả nếu dữ liệu đã có trước đó nhưng không còn nữa, thì `readyState` được đặt thành [`HAVE_METADATA`](/en-US/docs/Web/API/HTMLMediaElement/readyState#htmlmediaelement.have_metadata).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("waitingforkey", (event) => { })

onwaitingforkey = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
