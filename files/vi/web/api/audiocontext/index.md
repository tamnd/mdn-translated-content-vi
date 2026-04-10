---
title: AudioContext
slug: Web/API/AudioContext
page-type: web-api-interface
browser-compat: api.AudioContext
---

{{APIRef("Web Audio API")}}

Giao diện `AudioContext` biểu diễn một đồ thị xử lý âm thanh được xây dựng từ các mô-đun âm thanh được liên kết với nhau, mỗi mô-đun được biểu diễn bởi một {{domxref("AudioNode")}}.

Một ngữ cảnh âm thanh điều khiển cả việc tạo các nút mà nó chứa lẫn việc thực thi xử lý hoặc giải mã âm thanh. Bạn cần tạo một `AudioContext` trước khi làm bất kỳ việc gì khác, vì mọi thứ đều diễn ra bên trong một ngữ cảnh. Bạn nên tạo một `AudioContext` rồi tái sử dụng nó thay vì khởi tạo cái mới mỗi lần, và việc dùng một `AudioContext` duy nhất cho nhiều nguồn âm thanh và pipeline khác nhau cùng lúc là hoàn toàn ổn.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("AudioContext.AudioContext", "AudioContext()")}}
  - : Tạo và trả về một đối tượng `AudioContext` mới.

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("BaseAudioContext")}}._

- {{domxref("AudioContext.baseLatency")}} {{ReadOnlyInline}}
  - : Trả về số giây độ trễ xử lý phát sinh khi `AudioContext` truyền âm thanh từ {{domxref("AudioDestinationNode")}} sang hệ thống con âm thanh.
- {{domxref("AudioContext.outputLatency")}} {{ReadOnlyInline}}
  - : Trả về giá trị ước tính của độ trễ đầu ra của ngữ cảnh âm thanh hiện tại.
- {{domxref("AudioContext.sinkId")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về sink ID của thiết bị đầu ra âm thanh hiện tại.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("BaseAudioContext")}}._

- {{domxref("AudioContext.close()")}}
  - : Đóng ngữ cảnh âm thanh, giải phóng mọi tài nguyên âm thanh hệ thống mà nó đang sử dụng.
- {{domxref("AudioContext.createMediaElementSource()")}}
  - : Tạo một {{domxref("MediaElementAudioSourceNode")}} gắn với một {{domxref("HTMLMediaElement")}}. Có thể dùng để phát và xử lý âm thanh từ các phần tử {{HTMLElement("video")}} hoặc {{HTMLElement("audio")}}.
- {{domxref("AudioContext.createMediaStreamSource()")}}
  - : Tạo một {{domxref("MediaStreamAudioSourceNode")}} gắn với một {{domxref("MediaStream")}} biểu diễn một luồng âm thanh có thể đến từ micro cục bộ hoặc các nguồn khác.
- {{domxref("AudioContext.createMediaStreamDestination()")}}
  - : Tạo một {{domxref("MediaStreamAudioDestinationNode")}} gắn với một {{domxref("MediaStream")}} biểu diễn một luồng âm thanh có thể được lưu vào tệp cục bộ hoặc gửi tới máy tính khác.
- {{domxref("AudioContext.createMediaStreamTrackSource()")}}
  - : Tạo một {{domxref("MediaStreamTrackAudioSourceNode")}} gắn với một track luồng phương tiện.
- {{domxref("AudioContext.getOutputTimestamp()")}}
  - : Trả về một đối tượng `AudioTimestamp` mới chứa hai giá trị dấu thời gian âm thanh liên quan đến ngữ cảnh âm thanh hiện tại.
- {{domxref("AudioContext.resume()")}}
  - : Tiếp tục dòng thời gian trong một ngữ cảnh âm thanh trước đó đã bị tạm dừng.
- {{domxref("AudioContext.setSinkId()")}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Thiết lập thiết bị đầu ra âm thanh cho `AudioContext`.
- {{domxref("AudioContext.suspend()")}}
  - : Tạm dừng dòng thời gian trong ngữ cảnh âm thanh, tạm thời ngừng truy cập phần cứng âm thanh và giảm mức sử dụng CPU/pin trong quá trình đó.

## Sự kiện

- {{domxref("AudioContext/sinkchange_event", "sinkchange")}} {{Experimental_Inline}}
  - : Kích hoạt khi thiết bị đầu ra âm thanh (và do đó là {{domxref("AudioContext.sinkId")}}) đã thay đổi.

## Ví dụ

Khai báo một audio context cơ bản:

```js
const audioCtx = new AudioContext();

const oscillatorNode = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();
const finish = audioCtx.destination;
// etc.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("OfflineAudioContext")}}
