---
title: "ManagedMediaSource: thuộc tính streaming"
short-title: streaming
slug: Web/API/ManagedMediaSource/streaming
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ManagedMediaSource.streaming
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`streaming`** của giao diện {{domxref("ManagedMediaSource")}} là một giá trị boolean cho biết liệu ứng dụng có nên chủ động tải và nối thêm dữ liệu media hay không.

Giá trị của thuộc tính này được cập nhật bởi thuật toán giám sát của tác nhân người dùng. Khi nó thay đổi, sự kiện {{domxref("ManagedMediaSource.startstreaming_event", "startstreaming")}} hoặc {{domxref("ManagedMediaSource.endstreaming_event", "endstreaming")}} tương ứng sẽ được kích hoạt.

## Giá trị

Một giá trị boolean, ban đầu là `false`. Khi là `true`, tác nhân người dùng cần thêm dữ liệu để đảm bảo phát lại không bị gián đoạn. Khi là `false`, tác nhân người dùng đã có đủ dữ liệu được đệm và ứng dụng có thể dừng tải các phân đoạn mới.

## Ví dụ

### Kiểm tra trạng thái streaming

Ví dụ này tạo một {{domxref("ManagedMediaSource")}}, gắn nó vào phần tử {{htmlelement("video")}}, và ghi lại giá trị của `streaming` mỗi khi nó thay đổi giữa `true` và `false`.

```js
const mediaType = 'video/mp4; codecs="avc1.64001F, mp4a.40.2"';

if (ManagedMediaSource.isTypeSupported(mediaType)) {
  const video = document.createElement("video");
  const source = new ManagedMediaSource();

  video.controls = true;
  video.disableRemotePlayback = true;
  video.src = URL.createObjectURL(source);
  document.body.appendChild(video);

  console.log(source.streaming); // false

  source.addEventListener("startstreaming", () => {
    console.log(source.streaming); // true — start fetching data
  });

  source.addEventListener("endstreaming", () => {
    console.log(source.streaming); // false — stop fetching data
  });

  source.addEventListener("sourceopen", () => {
    source.addSourceBuffer(mediaType);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("ManagedMediaSource.startstreaming_event", "startstreaming")}}
- Sự kiện {{domxref("ManagedMediaSource.endstreaming_event", "endstreaming")}}
- {{domxref("ManagedMediaSource")}}
- {{domxref("MediaSource")}}
