---
title: "MediaRecorder: sự kiện error"
short-title: error
slug: Web/API/MediaRecorder/error_event
page-type: web-api-event
browser-compat: api.MediaRecorder.error_event
---

{{APIRef("MediaStream Recording")}}

Sự kiện **`error`** của giao diện {{domxref("MediaRecorder")}} được kích hoạt khi xảy ra lỗi: ví dụ vì việc ghi không được phép hoặc được thực hiện bằng codec không được hỗ trợ.

Sự kiện này không thể huỷ và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("MediaRecorderErrorEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MediaRecorderErrorEvent")}}

## Thuộc tính sự kiện

_Kế thừa thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MediaRecorderErrorEvent.error", "error")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMException")}} chứa thông tin về lỗi đã xảy ra.

## Mô tả

### Nguyên nhân kích hoạt

Hàm được gọi bất cứ khi nào xảy ra lỗi trong suốt vòng đời của đối tượng ghi. Ngoài các lỗi chung khác có thể xảy ra, các lỗi sau đây có thể xảy ra khi sử dụng MediaStream Recording API; để xác định lỗi nào đã xảy ra, hãy kiểm tra giá trị của {{domxref("DOMException.name", "MediaRecorderErrorEvent.error.name")}}.

- `SecurityError`
  - : {{domxref("MediaStream")}} được cấu hình để không cho phép ghi. Điều này có thể xảy ra, ví dụ, với các nguồn được lấy bằng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} khi người dùng từ chối quyền sử dụng thiết bị đầu vào.
- `InvalidModificationError`
  - : Số lượng track trên luồng đang được ghi đã thay đổi. Bạn không thể thêm hoặc xóa track trong khi đang ghi phương tiện.
- `UnknownError`
  - : Xảy ra lỗi không liên quan đến bảo mật mà không thể phân loại khác. Việc ghi dừng lại, {{domxref("MediaRecorder.state", "state")}} của `MediaRecorder` trở thành `inactive`, sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} cuối cùng được gửi đến `MediaRecorder` với dữ liệu còn lại nhận được, và cuối cùng sự kiện {{domxref("MediaRecorder/stop_event", "stop")}} được gửi.

## Ví dụ

Dùng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để lắng nghe sự kiện `error`:

```js
async function record() {
  const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
  const recorder = new MediaRecorder(stream);
  recorder.addEventListener("error", (event) => {
    console.error(`error recording stream: ${event.error.name}`);
  });
  recorder.start();
}

record();
```

Tương tự, nhưng dùng thuộc tính trình xử lý sự kiện `onerror`:

```js
async function record() {
  const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
  const recorder = new MediaRecorder(stream);
  recorder.onerror = (event) => {
    console.error(`error recording stream: ${event.error.name}`);
  };
  recorder.start();
}

record();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
