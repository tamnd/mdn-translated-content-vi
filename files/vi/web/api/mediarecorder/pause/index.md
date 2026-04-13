---
title: "MediaRecorder: phương thức pause()"
short-title: pause()
slug: Web/API/MediaRecorder/pause
page-type: web-api-instance-method
browser-compat: api.MediaRecorder.pause
---

{{APIRef("MediaStream Recording")}}

Phương thức **`pause()`** của giao diện {{domxref("MediaRecorder")}} được dùng để tạm dừng ghi luồng phương tiện.

Khi phương thức `pause()` của đối tượng `MediaRecorder` được gọi, trình duyệt xếp vào hàng đợi một tác vụ chạy các bước sau:

1. Nếu {{domxref("MediaRecorder.state")}} là "inactive", tạo lỗi DOM `InvalidState` và kết thúc các bước này. Nếu không, tiếp tục bước tiếp theo.
2. Đặt {{domxref("MediaRecorder.state")}} thành "paused".
3. Dừng thu thập dữ liệu vào {{domxref("Blob")}} hiện tại, nhưng giữ nó sẵn sàng để việc ghi có thể được tiếp tục sau này.
4. Kích hoạt sự kiện {{domxref("MediaRecorder/pause_event", "pause")}}.

## Cú pháp

```js-nolint
pause()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `MediaRecorder` hiện tại đang ở trạng thái `"inactive"`; bạn không thể tạm dừng ghi nếu `MediaRecorder` không hoạt động. Nếu bạn gọi `pause()` khi đã tạm dừng rồi, phương thức sẽ im lặng không làm gì.

## Ví dụ

```js
pause.onclick = () => {
  mediaRecorder.pause();
  console.log("recording paused");
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
