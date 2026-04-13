---
title: "MediaRecorder: phương thức requestData()"
short-title: requestData()
slug: Web/API/MediaRecorder/requestData
page-type: web-api-instance-method
browser-compat: api.MediaRecorder.requestData
---

{{APIRef("MediaStream Recording")}}

Phương thức **`requestData()`** của giao diện {{domxref("MediaRecorder")}} được dùng để tạo sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} chứa đối tượng {{domxref("Blob")}} của phương tiện đã ghi tính đến thời điểm phương thức được gọi. Sau đó bạn có thể lấy và xử lý dữ liệu này theo ý muốn.

Khi phương thức `requestData()` được gọi, trình duyệt xếp vào hàng đợi một tác vụ chạy các bước sau:

1. Nếu {{domxref("MediaRecorder.state")}} là "inactive", tạo lỗi DOM `InvalidState` và kết thúc các bước này. Nếu {{domxref("MediaRecorder.state")}} không phải "inactive", tiếp tục bước tiếp theo.
2. Tạo sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} chứa {{domxref("Blob")}} của dữ liệu đã ghi hiện tại (Blob có sẵn trong thuộc tính `data` của sự kiện).
3. Tạo Blob mới và đặt dữ liệu tiếp theo được ghi vào đó.

## Cú pháp

```js-nolint
requestData()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `MediaRecorder` hiện tại đang ở trạng thái `"inactive"`; bạn không thể lấy dữ liệu ghi nếu `MediaRecorder` không hoạt động.

## Ví dụ

```js
captureMedia.onclick = () => {
  mediaRecorder.requestData();
  // tạo ảnh chụp nhanh dữ liệu hiện tại
  // ondataavailable kích hoạt, sau đó việc ghi tiếp tục
  // trong Blob mới
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
