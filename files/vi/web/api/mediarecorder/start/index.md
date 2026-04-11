---
title: "MediaRecorder: phương thức start()"
short-title: start()
slug: Web/API/MediaRecorder/start
page-type: web-api-instance-method
browser-compat: api.MediaRecorder.start
---

{{APIRef("MediaStream Recording")}}

Phương thức **`start()`** của giao diện {{domxref("MediaRecorder")}} bắt đầu ghi phương tiện vào một hoặc nhiều đối tượng {{domxref("Blob")}}.

Bạn có thể ghi toàn bộ thời lượng phương tiện vào một `Blob` duy nhất (hoặc cho đến khi bạn gọi {{domxref("MediaRecorder.requestData", "requestData()")}}), hoặc bạn có thể chỉ định số mili giây để ghi mỗi lần. Sau đó, mỗi lần lượng phương tiện đó được ghi, một sự kiện sẽ được gửi để bạn có thể xử lý phương tiện đã ghi, trong khi một `Blob` mới được tạo để ghi phần tiếp theo của phương tiện.

Giả sử `state` của `MediaRecorder` là `inactive`, `start()` đặt `state` thành `recording`, sau đó bắt đầu ghi từ luồng đầu vào. Một `Blob` được tạo và dữ liệu được thu thập vào đó cho đến khi hết khoảng thời gian slice hoặc nguồn phương tiện kết thúc. Mỗi lần `Blob` được lấp đầy đến thời điểm đó (thời gian timeslice hoặc kết thúc phương tiện, nếu không có thời gian slice), một sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} được gửi đến `MediaRecorder` với dữ liệu đã ghi. Nếu nguồn vẫn đang phát, một `Blob` mới được tạo và việc ghi tiếp tục vào đó, và tiếp tục như vậy.

Khi luồng nguồn kết thúc, `state` được đặt thành `inactive` và việc thu thập dữ liệu dừng lại. Sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} cuối cùng được gửi đến `MediaRecorder`, tiếp theo là sự kiện {{domxref("MediaRecorder/stop_event", "stop")}}.

> [!NOTE]
> Nếu trình duyệt không thể bắt đầu ghi hoặc tiếp tục ghi, nó sẽ tạo sự kiện {{domxref("MediaRecorder.error_event", "error")}}, tiếp theo là sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} chứa `Blob` đã thu thập, tiếp theo là sự kiện {{domxref("MediaRecorder/stop_event", "stop")}}.

## Cú pháp

```js-nolint
start()
start(timeslice)
```

### Tham số

- `timeslice` {{optional_inline}}
  - : Số mili giây để ghi vào mỗi {{domxref("Blob")}}. Nếu tham số này không được bao gồm, toàn bộ thời lượng phương tiện được ghi vào một `Blob` duy nhất trừ khi phương thức {{domxref("MediaRecorder.requestData", "requestData()")}} được gọi để lấy `Blob` và kích hoạt việc tạo `Blob` mới để tiếp tục ghi phương tiện vào đó.

    > [!NOTE]
    > Giống như các giá trị thời gian khác trong web API, `timeslice` không chính xác và các khoảng thực tế có thể hơi dài hơn một chút do các tác vụ đang chờ xử lý trước khi tạo blob tiếp theo.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Các lỗi có thể phát hiện ngay lập tức được ném ra dưới dạng ngoại lệ DOM. Tất cả các lỗi khác được báo cáo qua sự kiện {{domxref("MediaRecorder.error_event", "error")}} được gửi đến đối tượng `MediaRecorder`. Bạn có thể triển khai trình xử lý sự kiện {{domxref("MediaRecorder.error_event", "onerror")}} để phản hồi các lỗi này.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `MediaRecorder` không ở trạng thái `inactive`; bạn không thể bắt đầu ghi phương tiện nếu nó đã đang được ghi. Xem thuộc tính {{domxref("MediaRecorder.state", "state")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Luồng phương tiện bạn đang cố ghi không hoạt động.
    - Một hoặc nhiều track của luồng ở định dạng không thể ghi bằng cấu hình hiện tại.
    - Cả hai tham số `videoKeyFrameIntervalDuration` và `videoKeyFrameIntervalCount` đều được chỉ định khi tạo `MediaRecorder`.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("MediaStream")}} được cấu hình để không cho phép ghi. Điều này có thể xảy ra, ví dụ, với các nguồn được lấy bằng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} khi người dùng từ chối quyền sử dụng thiết bị đầu vào. Ngoại lệ này cũng có thể được gửi dưới dạng sự kiện {{domxref("MediaRecorder.error_event", "error")}} nếu các tùy chọn bảo mật cho phương tiện nguồn thay đổi sau khi bắt đầu ghi.

## Ví dụ

```js
record.onclick = () => {
  mediaRecorder.start();
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
- {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}
