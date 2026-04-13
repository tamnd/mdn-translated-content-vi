---
title: "AudioSession: thuộc tính type"
short-title: type
slug: Web/API/AudioSession/type
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.AudioSession.type
---

{{APIRef("Audio Session API")}}{{SeeCompatTable}}

Thuộc tính **`type`** của giao diện {{domxref("AudioSession")}} trả về hoặc đặt kiểu của phiên âm thanh.

Kiểu phiên âm thanh mô tả tính chất chung của đầu ra âm thanh của một trang web, cho phép nền tảng xác định âm thanh dựa trên web nên tương tác như thế nào với âm thanh khác đang phát trên thiết bị.

## Giá trị

Một chuỗi biểu thị kiểu phiên âm thanh. Các giá trị có thể có là:

- `"auto"`
  - : Giá trị mặc định. Tác nhân người dùng tự động chọn kiểu phiên âm thanh phù hợp nhất dựa trên các API âm thanh mà trang sử dụng.
- `"playback"`
  - : Âm thanh dùng để phát phương tiện, chẳng hạn phát video hoặc nhạc, podcast, v.v. Đây là một kiểu độc quyền, sẽ tạm dừng âm thanh phát lại khác trên thiết bị, nhưng có thể vẫn cho phép âm thanh không phải phát lại (chẳng hạn âm thanh thông báo) tiếp tục.
- `"transient"`
  - : Âm thanh tạm thời, chẳng hạn âm thanh thông báo. Kiểu này thường phát chồng lên âm thanh khác và có thể khiến âm lượng của âm thanh đó giảm xuống.
- `"transient-solo"`
  - : Âm thanh tạm thời phát riêng, chẳng hạn chỉ đường khi lái xe hoặc lời nhắc bằng giọng nói. Kiểu này tạm dừng hoặc tắt tiếng tất cả âm thanh khác và phát độc quyền. Khi âm thanh kết thúc, âm thanh đã phát trước đó có thể tiếp tục.
- `"ambient"`
  - : Âm thanh nền có thể được trộn với các kiểu âm thanh khác. Điều này hữu ích khi người dùng muốn trộn âm thanh từ nhiều trang hoặc ứng dụng.
- `"play-and-record"`
  - : Âm thanh dùng cho ghi âm hoặc giao tiếp thời gian thực. Kiểu này phù hợp khi micro đang được sử dụng hoặc trong các ứng dụng hội nghị truyền hình.

## Ví dụ

### Đặt kiểu phiên âm thanh cho việc phát phương tiện

```js
// Đặt kiểu phiên âm thanh cho việc phát nhạc
navigator.audioSession.type = "playback";

// Phát nhạc
audioElement.play();
```

### Thiết lập cuộc gọi hội nghị truyền hình

```js
// Thiết lập cho hội nghị truyền hình (vừa phát lại vừa ghi âm)
navigator.audioSession.type = "play-and-record";

// Bắt đầu cuộc gọi video
const stream = await navigator.mediaDevices.getUserMedia({
  audio: true,
  video: true,
});
localVideo.srcObject = stream;
```

### Dùng âm thanh tạm thời cho thông báo

```js
// Đặt kiểu tạm thời cho âm thanh thông báo
navigator.audioSession.type = "transient";

// Phát thông báo
notificationSound.play();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioSession")}}
- {{domxref("Navigator.audioSession")}}
- [Audio Session API](/en-US/docs/Web/API/Audio_Session_API)
