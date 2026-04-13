---
title: "MediaRecorderErrorEvent: thuộc tính error"
short-title: error
slug: Web/API/MediaRecorderErrorEvent/error
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MediaRecorderErrorEvent.error
---

{{APIRef("MediaStream Recording")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`error`** của giao diện {{domxref("MediaRecorderErrorEvent")}} là đối tượng {{domxref("DOMException")}} cung cấp chi tiết về ngoại lệ được ném bởi phiên bản {{domxref("MediaRecorder")}}.

Khi `MediaRecorderErrorEvent` xảy ra, bạn có thể xác định phần nào đó về những gì đã xảy ra sai bằng cách kiểm tra thuộc tính `error` trong `MediaRecorderErrorEvent` nhận được bởi trình xử lý sự kiện {{domxref("MediaRecorder/error_event", "error")}} của `MediaRecorder`, {{domxref("MediaRecorder/error_event", "onerror")}}.

## Giá trị

Một {{domxref("DOMException")}} mô tả lỗi được đại diện bởi sự kiện. Giá trị thuộc tính {{domxref("DOMException.name", "name")}} của lỗi có thể là bất kỳ ngoại lệ nào hợp lý trong quá trình xử lý ghi phương tiện, bao gồm những ngoại lệ được đặc tả xác định cụ thể. Mô tả ở đây là những mô tả chung; bạn sẽ tìm thấy những mô tả cụ thể hơn cho các tình huống khác nhau trong đó chúng có thể xảy ra trong các tham chiếu phương thức tương ứng.

- `InvalidStateError`
  - : Một thao tác đã được thử trong ngữ cảnh mà nó không được phép, hoặc một yêu cầu đã được thực hiện trên đối tượng đã bị xóa hoặc loại bỏ.
- `NotSupportedError`
  - : Không thể tạo `MediaRecorder` vì các tùy chọn được chỉ định không hợp lệ. Thuộc tính `message` nên cung cấp thông tin bổ sung, nếu tồn tại.
- `SecurityError`
  - : {{domxref("MediaStream")}} được cấu hình để không cho phép ghi. Điều này có thể xảy ra, ví dụ, với các nguồn thu được bằng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} khi người dùng từ chối quyền sử dụng thiết bị đầu vào.
- `InvalidModificationError`
  - : Số track trên luồng đang ghi đã thay đổi. Bạn không thể thêm hoặc xóa track trong khi ghi phương tiện.
- `UnknownError`
  - : Lỗi không liên quan đến bảo mật đã xảy ra và không thể phân loại theo cách khác. Ghi dừng, {{domxref("MediaRecorder.state", "state")}} của `MediaRecorder` trở thành `inactive`, một sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} cuối cùng được gửi đến `MediaRecorder` với dữ liệu còn lại nhận được, và cuối cùng sự kiện {{domxref("MediaRecorder/stop_event", "stop")}} được gửi.

## Ví dụ

### Ví dụ xử lý lỗi cơ bản

Hàm này tạo và trả về `MediaRecorder` cho {{domxref("MediaStream")}} đã cho, được cấu hình để đệm dữ liệu vào mảng và xem để phát hiện lỗi.

```js
function recordStream(stream) {
  let recorder = null;
  let bufferList = [];

  try {
    recorder = new MediaRecorder(stream);
  } catch (err) {
    /* exception while trying to create the recorder; handle that */
  }

  recorder.ondataavailable = (event) => {
    bufferList.push(event.data);
  };

  recorder.onerror = (event) => {
    console.error(`Error: ${event.error}`);
  };

  recorder.start(100); /* 100ms time slices per buffer */
  return recorder;
}
```

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ đặc tả nào và không còn theo hướng trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API)
- [Using the MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
