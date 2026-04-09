---
title: Audio Session API
slug: Web/API/Audio_Session_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.AudioSession
  - api.Navigator.audioSession
---

{{DefaultAPISidebar("Audio Session API")}}{{SeeCompatTable}}

**Audio Session API** cung cấp một cơ chế để ứng dụng web kiểm soát cách âm thanh của chúng tương tác với những âm thanh khác đang phát trên thiết bị.

## Khái niệm và cách sử dụng

Người dùng ngày càng tiêu thụ nội dung đa phương tiện qua web: giờ đây web là một kênh chính để truy cập nội dung âm thanh và video. Tuy nhiên, nội dung đa phương tiện trên web thường thiếu sự tích hợp liền mạch với các nền tảng bên dưới. Audio Session API giải quyết khoảng trống này bằng cách cho phép nhà phát triển chỉ định cách âm thanh do ứng dụng web của họ tạo ra sẽ tương tác với âm thanh từ các ứng dụng khác trên thiết bị, chẳng hạn như phát cùng với âm thanh khác, làm nhỏ âm lượng của âm thanh đó, hoặc tạm dừng nó để âm thanh của ứng dụng có thể phát riêng.

Một trang web có thể xử lý âm thanh theo nhiều cách bằng các API như {{domxref("HTMLMediaElement")}} và [Web Audio API](/en-US/docs/Web/API/Web_Audio_API). Một **audio session** biểu diễn tổng hợp âm thanh do một trang web tạo ra, cho phép trang đó thể hiện tính chất tổng quát của đầu ra âm thanh của mình.

### Các loại audio session

API hỗ trợ một số loại audio session, dùng để chỉ ra kiểu âm thanh mà một ứng dụng đang tạo ra:

- `"auto"` — Mặc định. User agent tự động chọn loại phù hợp nhất dựa trên các API âm thanh đang được sử dụng.
- `"playback"` — Dành cho phát nội dung đa phương tiện như nhạc hoặc video. Loại này không nên trộn với âm thanh phát lại khác.
- `"transient"` — Dành cho các âm thanh ngắn như thông báo. Loại này thường phát chồng lên trên âm thanh khác.
- `"transient-solo"` — Dành cho âm thanh cần được phát độc quyền, tạm dừng mọi âm thanh khác (chẳng hạn như lời nhắc bằng giọng nói).
- `"ambient"` — Dành cho âm thanh có thể trộn với các nguồn âm thanh khác.
- `"play-and-record"` — Dành cho các ứng dụng vừa phát vừa ghi âm, chẳng hạn như hội nghị truyền hình.

## Giao diện

- {{domxref("AudioSession")}} {{Experimental_Inline}}
  - : Giao diện chính để điều khiển hành vi của audio session, bao gồm việc đặt loại audio session.

### Phần mở rộng cho các giao diện khác

- {{domxref("Navigator.audioSession")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("AudioSession")}} cho tài liệu hiện tại.

## Ví dụ

### Thiết lập audio session cho ứng dụng hội nghị truyền hình

Trong một ứng dụng hội nghị truyền hình, việc phát và ghi âm đều cần diễn ra đồng thời; đây là điều mà Audio Session API có thể hỗ trợ.

Đầu tiên, chúng ta đặt loại audio session thành `"play-and-record"` để thông báo cho nền tảng rằng trang này cần quyền truy cập micro cùng với đầu ra âm thanh. Trên các nền tảng hỗ trợ, điều này có thể điều chỉnh cách định tuyến âm lượng của hệ thống (ví dụ: dùng loa thoại thay vì loa ngoài trên thiết bị di động) và ngăn âm thanh từ các ứng dụng khác làm gián đoạn cuộc gọi.

```js
navigator.audioSession.type = "play-and-record";
```

Tiếp theo, chúng ta thiết lập các luồng phương tiện cho cuộc gọi video như bình thường. Lúc này, nền tảng sẽ xử lý âm thanh do các luồng này tạo ra theo loại session `"play-and-record"`.

```js
// Start playing remote media
remoteVideo.srcObject = remoteMediaStream;
remoteVideo.play();

// Start capturing local media
navigator.mediaDevices
  .getUserMedia({ audio: true, video: true })
  .then((stream) => {
    localVideo.srcObject = stream;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioSession")}}
- {{domxref("Navigator.audioSession")}}
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- {{domxref("HTMLMediaElement")}}
