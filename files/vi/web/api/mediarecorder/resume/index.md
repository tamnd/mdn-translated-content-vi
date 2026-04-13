---
title: "MediaRecorder: phương thức resume()"
short-title: resume()
slug: Web/API/MediaRecorder/resume
page-type: web-api-instance-method
browser-compat: api.MediaRecorder.resume
---

{{APIRef("MediaStream Recording")}}

Phương thức **`resume()`** của giao diện {{domxref("MediaRecorder")}} được dùng để tiếp tục ghi phương tiện khi đã bị tạm dừng trước đó.

Nếu {{domxref("MediaRecorder.state")}} đã là "recording", việc gọi `resume()` không có tác dụng.

Khi phương thức `resume()` được gọi, trình duyệt xếp vào hàng đợi một tác vụ chạy các bước sau:

1. Nếu {{domxref("MediaRecorder.state")}} là "inactive", tạo ngoại lệ DOM `InvalidStateError` và kết thúc các bước này. Nếu {{domxref("MediaRecorder.state")}} không phải "inactive", tiếp tục bước tiếp theo.
2. Đặt {{domxref("MediaRecorder.state")}} thành "recording".
3. Tiếp tục thu thập dữ liệu vào {{domxref("Blob")}} hiện tại.
4. Kích hoạt sự kiện `resume`.

## Cú pháp

```js-nolint
resume()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `MediaRecorder` hiện tại đang ở trạng thái `"inactive"`.

## Ví dụ

```js
pause.onclick = () => {
  if (MediaRecorder.state === "recording") {
    mediaRecorder.pause();
    // tạm dừng ghi
  } else if (MediaRecorder.state === "paused") {
    mediaRecorder.resume();
    // tiếp tục ghi
  }
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
- {{domxref("Navigator.getUserMedia")}}
