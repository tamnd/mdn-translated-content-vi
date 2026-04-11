---
title: "MediaRecorder: thuộc tính stream"
short-title: stream
slug: Web/API/MediaRecorder/stream
page-type: web-api-instance-property
browser-compat: api.MediaRecorder.stream
---

{{APIRef("MediaStream Recording")}}

Thuộc tính chỉ đọc **`stream`** của giao diện {{domxref("MediaRecorder")}} trả về luồng được truyền vào hàm khởi tạo {{domxref("MediaRecorder.MediaRecorder", "MediaRecorder()")}} khi `MediaRecorder` được tạo.

## Giá trị

{{domxref("MediaStream")}} được truyền vào hàm khởi tạo `MediaRecorder()` khi `MediaRecorder` ban đầu được tạo.

## Ví dụ

```js
if (navigator.getUserMedia) {
  console.log("getUserMedia supported.");
  navigator.getUserMedia(
    // các ràng buộc - chỉ cần âm thanh cho ứng dụng này
    {
      audio: true,
    },

    // Hàm gọi lại thành công
    (stream) => {
      const mediaRecorder = new MediaRecorder(stream);

      const myStream = mediaRecorder.stream;
      console.log(myStream);
    },
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): MediaRecorder + getUserMedia + Web Audio API visualization demo, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("Navigator.getUserMedia")}}
