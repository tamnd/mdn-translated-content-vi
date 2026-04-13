---
title: "DataCue: type property"
short-title: type
slug: Web/API/DataCue/type
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.DataCue.type
---

{{APIRef("WebVTT")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("DataCue")}} trả về chuỗi xác định loại hoặc lược đồ của dữ liệu được lưu trong thuộc tính {{domxref("DataCue.value", "value")}} của cue. Đây thường là chuỗi ký hiệu tên miền ngược (ví dụ: `"org.id3"`, `"com.apple.itunes"`) cho phép các ứng dụng diễn giải tải trọng dữ liệu của cue đúng đắn.

Khi user agent tự động tạo các đối tượng `DataCue` cho siêu dữ liệu được tính theo thời gian nội tuyến (ví dụ: từ nguồn HTTP Live Streaming), nó đặt thuộc tính này để chỉ định định dạng siêu dữ liệu. Khi mã ứng dụng tạo `DataCue` bằng hàm khởi tạo {{domxref("DataCue.DataCue", "DataCue()")}}, `type` được đặt từ tham số thứ tư tùy chọn và mặc định là chuỗi rỗng nếu bỏ qua.

## Giá trị

Một chuỗi. Các giá trị phổ biến được user agent đặt cho siêu dữ liệu nội tuyến bao gồm:

- `"org.id3"` — siêu dữ liệu ID3.
- `"org.mp4ra"` — siêu dữ liệu MPEG-4.
- `"com.apple.quicktime.udta"` — Dữ liệu người dùng QuickTime.
- `"com.apple.quicktime.mdta"` — Siêu dữ liệu QuickTime.
- `"com.apple.itunes"` — siêu dữ liệu iTunes.

Các cue do ứng dụng xác định có thể sử dụng bất kỳ chuỗi nào, nhưng ký hiệu tên miền ngược được khuyến nghị để tránh va chạm.

## Ví dụ

### Đọc type của DataCue

```html
<video controls src="video.mp4"></video>
```

```js
const video = document.querySelector("video");
const track = video.addTextTrack("metadata", "Events");
track.mode = "hidden";

const cue = new DataCue(
  0,
  10,
  { latitude: 51.5043, longitude: -0.0762 },
  "org.example.geo",
);
track.addCue(cue);

console.log(cue.type);
// "org.example.geo"
```

### Xử lý theo type cho siêu dữ liệu nội tuyến

Khi user agent tạo các đối tượng `DataCue` từ siêu dữ liệu được tính theo thời gian nội tuyến, thuộc tính `type` có thể được sử dụng để xác định cách xử lý mỗi cue.

```js
track.addEventListener("cuechange", () => {
  for (const cue of track.activeCues) {
    switch (cue.type) {
      case "org.id3":
        handleID3Metadata(cue.value);
        break;
      case "org.mp4ra":
        handleMP4Metadata(cue.value);
        break;
      default:
        console.log(`Unknown cue type: ${cue.type}`);
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DataCue")}}
- {{domxref("DataCue.value")}}
- Hàm khởi tạo {{domxref("DataCue.DataCue", "DataCue()")}}
- {{domxref("TextTrackCue")}}
