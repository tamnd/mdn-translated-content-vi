---
title: "MediaStreamTrack: sự kiện ended"
short-title: ended
slug: Web/API/MediaStreamTrack/ended_event
page-type: web-api-event
browser-compat: api.MediaStreamTrack.ended_event
---

{{APIRef("Media Capture and Streams")}}

Sự kiện **`ended`** của giao diện {{domxref("MediaStreamTrack")}} được kích hoạt khi việc phát lại hoặc phát trực tuyến đã dừng vì đã đạt đến cuối phương tiện hoặc vì không còn dữ liệu nào nữa.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("ended", (event) => { })

onended = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ghi chú sử dụng

Các sự kiện `ended` được kích hoạt khi nguồn của track luồng phương tiện vĩnh viễn ngừng gửi dữ liệu trên luồng. Có nhiều cách khác nhau để điều này xảy ra, bao gồm:

- Không còn dữ liệu nào để gửi.
- Người dùng đã thu hồi quyền cần thiết để gửi dữ liệu.
- Phần cứng tạo dữ liệu nguồn đã bị tháo ra hoặc đẩy ra.
- Một peer từ xa đã vĩnh viễn ngừng gửi dữ liệu.
- Trường hợp duy nhất track kết thúc nhưng sự kiện `ended` không được kích hoạt là khi gọi {{domxref("MediaStreamTrack.stop")}}.

Tạm dừng phương tiện _không_ tạo ra sự kiện `ended`.

## Ví dụ

Ví dụ này thiết lập một trình xử lý sự kiện cho sự kiện `ended`, thay đổi một biểu tượng trên màn hình để cho biết rằng track không còn hoạt động.

```js
track.addEventListener("ended", () => {
  let statusElem = document.getElementById("status-icon");
  statusElem.src = "/images/stopped-icon.png";
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng thuộc tính `onended`:

```js
track.onended = () => {
  let statusElem = document.getElementById("status-icon");

  statusElem.src = "/images/stopped-icon.png";
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("HTMLMediaElement.playing_event", 'playing')}} của HTMLMediaElement
- Sự kiện {{domxref("HTMLMediaElement.waiting_event", 'waiting')}} của HTMLMediaElement
- Sự kiện {{domxref("HTMLMediaElement.seeking_event", 'seeking')}} của HTMLMediaElement
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
- Sự kiện {{domxref("HTMLMediaElement.ended_event", 'ended')}} của HTMLMediaElement
- Sự kiện {{domxref("AudioScheduledSourceNode.ended_event", 'ended')}} của AudioScheduledSourceNode
