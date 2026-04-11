---
title: "HTMLMediaElement: sự kiện timeupdate"
short-title: timeupdate
slug: Web/API/HTMLMediaElement/timeupdate_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.timeupdate_event
---

{{APIRef("HTMLMediaElement")}}

Sự kiện `timeupdate` được kích hoạt khi thời gian được chỉ định bởi thuộc tính `currentTime` đã được cập nhật.

Tần suất sự kiện phụ thuộc vào tải hệ thống nhưng sẽ nằm trong khoảng từ 4Hz đến 66Hz (giả sử trình xử lý sự kiện không mất nhiều hơn 250 mili giây để chạy). Tác nhân người dùng được khuyến khích thay đổi tần suất của sự kiện dựa trên tải hệ thống và chi phí trung bình để xử lý sự kiện mỗi lần, để các bản cập nhật giao diện người dùng không thường xuyên hơn mức mà tác nhân người dùng có thể thoải mái xử lý trong khi giải mã video.

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("timeupdate", (event) => { })

ontimeupdate = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung chung.

## Ví dụ

Các ví dụ này thêm trình xử lý sự kiện cho sự kiện `timeupdate` của HTMLMediaElement, sau đó đăng thông báo khi trình xử lý sự kiện đó phản ứng với việc kích hoạt sự kiện. Hãy nhớ rằng tần suất sự kiện phụ thuộc vào tải hệ thống.

Sử dụng `addEventListener()`:

```js
const video = document.querySelector("video");

video.addEventListener("timeupdate", (event) => {
  console.log("The currentTime attribute has been updated. Again.");
});
```

Sử dụng thuộc tính xử lý sự kiện `ontimeupdate`:

```js
const video = document.querySelector("video");

video.ontimeupdate = (event) => {
  console.log("The currentTime attribute has been updated. Again.");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Sự kiện liên quan

- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.playing_event", 'playing')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.waiting_event", 'waiting')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.seeking_event", 'seeking')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.seeked_event", 'seeked')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.ended_event", 'ended')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadedmetadata_event", 'loadedmetadata')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadeddata_event", 'loadeddata')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.canplay_event", 'canplay')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.canplaythrough_event", 'canplaythrough')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.durationchange_event", 'durationchange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.play_event", 'play')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.pause_event", 'pause')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.ratechange_event", 'ratechange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.volumechange_event", 'volumechange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.suspend_event", 'suspend')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.emptied_event", 'emptied')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.stalled_event", 'stalled')}}

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
