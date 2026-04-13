---
title: DataCue
slug: Web/API/DataCue
page-type: web-api-interface
status:
  - experimental
browser-compat: api.DataCue
---

{{APIRef("WebVTT")}}{{SeeCompatTable}}

Giao diện **`DataCue`** đại diện cho một cue liên kết dữ liệu theo thời gian tùy ý với tài nguyên phương tiện âm thanh hoặc video, hoặc hiển thị dữ liệu theo thời gian từ tài nguyên phương tiện cho các trang web. Nó mở rộng giao diện {{domxref("TextTrackCue")}} với thuộc tính {{domxref("DataCue.value", "value")}} có thể giữ bất kỳ loại dữ liệu nào, và thuộc tính {{domxref("DataCue.type", "type")}} xác định loại dữ liệu.

Không giống như {{domxref("VTTCue")}}, được thiết kế để hiển thị văn bản phụ đề và chú thích, `DataCue` dành cho siêu dữ liệu được tính toán theo thời gian không được hiển thị. Các trường hợp sử dụng bao gồm thay thế nội dung động, chèn quảng cáo, trình bày nội dung bổ sung cùng với âm thanh hoặc video, hoặc nói chung là kích hoạt logic ứng dụng tại các điểm cụ thể trên dòng thời gian phương tiện.

Một số user agent cũng có thể tự động tạo các đối tượng `DataCue` cho siêu dữ liệu được tính toán theo thời gian trong luồng phương tiện, chẳng hạn như thẻ ID3 trong [HTTP Live Streaming (HLS)](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Setting_up_adaptive_streaming_media_sources#hls_encoding).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DataCue.DataCue", "DataCue()")}} {{experimental_inline}}
  - : Tạo một đối tượng `DataCue` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("TextTrackCue")}}._

- {{domxref("DataCue.type")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Chuỗi xác định loại {{domxref("DataCue.value", "value")}} của cue, thường sử dụng ký hiệu tên miền ngược (ví dụ: `"org.mp4ra"`, `"org.id3"`).
- {{domxref("DataCue.value")}} {{experimental_inline}}
  - : Tải trọng dữ liệu liên kết với cue. Có thể là bất kỳ loại nào.

## Phương thức phiên bản

_Giao diện này không có phương thức riêng nhưng kế thừa các phương thức từ {{domxref("TextTrackCue")}}._

## Ví dụ

### Liên kết siêu dữ liệu được tính theo thời gian với video

Ví dụ sau tạo một {{domxref("TextTrack")}} siêu dữ liệu trên phần tử video và thêm các đối tượng `DataCue` chứa tọa độ địa lý. Khi mỗi cue trở nên hoạt động trong khi phát, sự kiện {{domxref("TextTrackCue/enter_event", "enter")}} của nó kích hoạt, cho phép trang phản hồi, ví dụ bằng cách cập nhật chế độ xem bản đồ.

```html
<video controls src="video.mp4"></video>
```

```js
const video = document.querySelector("video");
const track = video.addTextTrack("metadata", "Geo Track");
track.mode = "hidden";

const points = [
  { start: 0, end: 10, data: { latitude: 51.5043, longitude: -0.0762 } },
  { start: 10, end: 20, data: { latitude: 48.8566, longitude: 2.3522 } },
  { start: 20, end: 30, data: { latitude: 40.4168, longitude: -3.7038 } },
];

for (const point of points) {
  const cue = new DataCue(
    point.start,
    point.end,
    point.data,
    "org.example.geo",
  );
  cue.addEventListener("enter", (e) => {
    const { latitude, longitude } = e.target.value;
    console.log(`Map pan to: ${latitude}, ${longitude}`);
  });
  track.addCue(cue);
}

// At 0s: "Map pan to: 51.5043, -0.0762"
// At 10s: "Map pan to: 48.8566, 2.3522"
// At 20s: "Map pan to: 40.4168, -3.7038"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextTrackCue")}}
- {{domxref("VTTCue")}}
- {{domxref("TextTrack")}}
- Sự kiện {{domxref("TextTrackCue/enter_event", "enter")}}
- Sự kiện {{domxref("TextTrackCue/exit_event", "exit")}}
