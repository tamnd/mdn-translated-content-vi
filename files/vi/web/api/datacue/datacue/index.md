---
title: "DataCue: DataCue() constructor"
short-title: DataCue()
slug: Web/API/DataCue/DataCue
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.DataCue.DataCue
---

{{APIRef("WebVTT")}}{{SeeCompatTable}}

Hàm khởi tạo **`DataCue()`** tạo và trả về một đối tượng {{domxref("DataCue")}} mới đại diện cho cue siêu dữ liệu được tính theo thời gian trong phạm vi thời gian đã cho. Cue kết quả có thể được thêm vào {{domxref("TextTrack")}} siêu dữ liệu bằng {{domxref("TextTrack.addCue()")}}, cho phép dữ liệu tùy ý được đồng bộ hóa với phát lại âm thanh hoặc video.

## Cú pháp

```js-nolint
new DataCue(startTime, endTime, value)
new DataCue(startTime, endTime, value, type)
```

### Tham số

- `startTime`
  - : Số đại diện cho thời gian bắt đầu, tính bằng giây, cho phạm vi thời gian của cue. Điều này tương ứng với điểm trên dòng thời gian phương tiện tại đó cue trở nên hoạt động và sự kiện {{domxref("TextTrackCue/enter_event", "enter")}} của nó kích hoạt.
- `endTime`
  - : Số đại diện cho thời gian kết thúc, tính bằng giây, cho phạm vi thời gian của cue. Khi phát lại phương tiện đến thời điểm này, sự kiện {{domxref("TextTrackCue/exit_event", "exit")}} của cue kích hoạt. Sử dụng `Infinity` cho cue vẫn hoạt động cho đến khi kết thúc phương tiện.
- `value`
  - : Tải trọng dữ liệu liên kết với cue. Đây có thể là bất kỳ loại nào, chẳng hạn như chuỗi, đối tượng JavaScript, hoặc {{jsxref("ArrayBuffer")}}. Giá trị được lưu trong thuộc tính {{domxref("DataCue.value", "value")}} của cue.
- `type` {{optional_inline}}
  - : Chuỗi xác định loại hoặc lược đồ của dữ liệu trong `value`. Đây thường là chuỗi ký hiệu tên miền ngược (ví dụ: `"org.id3"`, `"org.mp4ra"`). Giá trị được lưu trong thuộc tính {{domxref("DataCue.type", "type")}} của cue và mặc định là chuỗi rỗng nếu không được cung cấp.

### Giá trị trả về

Một đối tượng {{domxref("DataCue")}} mới.

## Ví dụ

### Tạo DataCue với dữ liệu địa lý

Ví dụ này tạo một `DataCue` mang tọa độ địa lý, sử dụng chuỗi tên miền ngược làm `type` để xác định định dạng dữ liệu.

```html
<video controls src="video.mp4"></video>
```

```js
const video = document.querySelector("video");
const track = video.addTextTrack("metadata", "Geo Track");
track.mode = "hidden";

// Create a cue from 5 seconds to the end of the media
const data = { latitude: 51.5043, longitude: -0.0762 };
const cue = new DataCue(5.0, Infinity, data, "org.example.geo");

cue.addEventListener("enter", (e) => {
  const { latitude, longitude } = e.target.value;
  console.log(`Pan map to: ${latitude}, ${longitude}`);
});

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DataCue")}}
- {{domxref("TextTrack")}}
- {{domxref("TextTrack.addCue()")}}
- Sự kiện {{domxref("TextTrackCue/enter_event", "enter")}}
- Sự kiện {{domxref("TextTrackCue/exit_event", "exit")}}
