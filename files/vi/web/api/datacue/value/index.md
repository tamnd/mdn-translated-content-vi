---
title: "DataCue: value property"
short-title: value
slug: Web/API/DataCue/value
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.DataCue.value
---

{{APIRef("WebVTT")}}{{SeeCompatTable}}

Thuộc tính **`value`** của giao diện {{domxref("DataCue")}} đại diện cho tải trọng dữ liệu của cue. Không giống như {{domxref("VTTCue")}}, mang nội dung văn bản, `DataCue` có thể giữ bất kỳ loại dữ liệu nào, chẳng hạn như đối tượng JavaScript, chuỗi, hoặc {{jsxref("ArrayBuffer")}} — làm cho nó phù hợp cho các trường hợp sử dụng siêu dữ liệu được tính theo thời gian khi dữ liệu có cấu trúc cần được đồng bộ hóa với phát lại phương tiện.

Thuộc tính có thể đọc-ghi cho các cue do ứng dụng tạo, cho phép dữ liệu được cập nhật sau khi xây dựng. Đối với các cue được user agent tự động tạo từ siêu dữ liệu được tính theo thời gian nội tuyến (ví dụ: thẻ ID3 trong nguồn HTTP Live Streaming), giá trị được đặt bởi user agent và phản ánh tải trọng siêu dữ liệu.

Thuộc tính {{domxref("DataCue.type", "type")}} có thể được sử dụng cùng với `value` để xác định định dạng hoặc lược đồ của dữ liệu.

## Giá trị

Bất kỳ loại nào. Giá trị thường là chuỗi, đối tượng thuần túy, hoặc {{jsxref("ArrayBuffer")}}, tùy thuộc vào nguồn của cue và loại siêu dữ liệu được tính theo thời gian mà nó đại diện.

## Ví dụ

### Đọc value của DataCue

```html
<video controls src="video.mp4"></video>
```

```js
const video = document.querySelector("video");
const track = video.addTextTrack("metadata", "Geo Track");
track.mode = "hidden";

const cue = new DataCue(
  0,
  10,
  { latitude: 51.5043, longitude: -0.0762 },
  "org.example.geo",
);
track.addCue(cue);

console.log(cue.value);
// { latitude: 51.5043, longitude: -0.0762 }
```

### Phản hồi dữ liệu cue trong khi phát

Ví dụ này thêm một số đối tượng `DataCue` vào track siêu dữ liệu, sau đó đọc `value` của mỗi cue khi nó trở nên hoạt động trong khi phát.

```html
<video controls src="video.mp4"></video>
```

```js
const video = document.querySelector("video");
const track = video.addTextTrack("metadata", "Events");
track.mode = "hidden";

const cue1 = new DataCue(5, 10, { action: "showBanner", text: "Welcome!" });
const cue2 = new DataCue(15, 20, { action: "highlight", playerId: 7 });

cue1.addEventListener("enter", (e) => {
  console.log(e.target.value.action);
  // "showBanner"
});

cue2.addEventListener("enter", (e) => {
  console.log(e.target.value.action);
  // "highlight"
});

track.addCue(cue1);
track.addCue(cue2);
```

### Cập nhật value của DataCue

Thuộc tính `value` có thể ghi, vì vậy nó có thể được thay đổi sau khi cue được tạo.

```js
const cue = new DataCue(0, 5, "initial data");
cue.value = { updated: true, score: 42 };
console.log(cue.value);
// { updated: true, score: 42 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DataCue")}}
- {{domxref("DataCue.type")}}
- Hàm khởi tạo {{domxref("DataCue.DataCue", "DataCue()")}}
- {{domxref("TextTrackCue")}}
