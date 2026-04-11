---
title: "MediaRecorder: phương thức stop()"
short-title: stop()
slug: Web/API/MediaRecorder/stop
page-type: web-api-instance-method
browser-compat: api.MediaRecorder.stop
---

{{APIRef("MediaStream Recording")}}

Phương thức **`stop()`** của giao diện {{domxref("MediaRecorder")}} được dùng để dừng ghi phương tiện.

Khi phương thức `stop()` được gọi, UA xếp vào hàng đợi một tác vụ chạy các bước sau:

1. Nếu {{domxref("MediaRecorder.state")}} là "inactive", tạo lỗi DOM `InvalidState` và kết thúc các bước này. Nếu {{domxref("MediaRecorder.state")}} không phải "inactive", tiếp tục bước tiếp theo.
2. Đặt {{domxref("MediaRecorder.state")}} thành "inactive" và dừng ghi phương tiện.
3. Tạo sự kiện `dataavailable` chứa Blob dữ liệu đã thu thập.
4. Tạo sự kiện `stop`.

## Cú pháp

```js-nolint
stop()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `MediaRecorder` hiện tại đang ở trạng thái `"inactive"`; bạn không thể dừng việc ghi nếu `MediaRecorder` không hoạt động.

## Ví dụ

```js
stop.onclick = () => {
  mediaRecorder.stop();
  console.log("recorder stopped, data available");
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
