---
title: "MediaRecorder: thuộc tính state"
short-title: state
slug: Web/API/MediaRecorder/state
page-type: web-api-instance-property
browser-compat: api.MediaRecorder.state
---

{{APIRef("MediaStream Recording")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("MediaRecorder")}} trả về trạng thái hiện tại của đối tượng `MediaRecorder` hiện tại.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `inactive`
  - : Việc ghi không diễn ra, có thể là chưa bắt đầu hoặc đã bắt đầu rồi dừng lại.
- `recording`
  - : Việc ghi đã bắt đầu và {{glossary("user agent")}} đang thu thập dữ liệu.
- `paused`
  - : Việc ghi đã bắt đầu, sau đó tạm dừng, nhưng chưa dừng hoặc tiếp tục.

## Ví dụ

```js
record.onclick = () => {
  mediaRecorder.start();
  console.log(mediaRecorder.state);
  // Sẽ trả về "recording"
  console.log("recorder started");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): MediaRecorder + getUserMedia + Web Audio API visualization demo, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("Navigator.getUserMedia()")}}
