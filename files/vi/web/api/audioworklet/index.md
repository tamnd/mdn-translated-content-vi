---
title: AudioWorklet
slug: Web/API/AudioWorklet
page-type: web-api-interface
browser-compat: api.AudioWorklet
---

{{APIRef("Web Audio API")}}{{securecontext_header}}

Giao diện **`AudioWorklet`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) được dùng để cung cấp các tập lệnh xử lý âm thanh tùy chỉnh chạy trong một luồng riêng nhằm đem lại khả năng xử lý âm thanh với độ trễ rất thấp.

Mã của worklet chạy trong ngữ cảnh thực thi toàn cục {{domxref("AudioWorkletGlobalScope")}}, sử dụng một luồng Web Audio riêng được chia sẻ giữa worklet và các nút âm thanh khác.

Truy cập thể hiện `AudioWorklet` của audio context thông qua thuộc tính {{domxref("BaseAudioContext.audioWorklet")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính được định nghĩa trên giao diện cha của nó, {{domxref("Worklet")}}._

- {{domxref("AudioWorklet.port", "port")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một {{domxref("MessagePort")}} để giao tiếp bất đồng bộ tùy chỉnh giữa mã trong luồng chính và phạm vi toàn cục của một audio worklet.
    Điều này cho phép gửi các thông điệp tùy chỉnh, chẳng hạn như gửi và nhận dữ liệu điều khiển hoặc các thiết lập toàn cục.

## Phương thức thể hiện

_Giao diện này kế thừa các phương thức từ {{domxref('Worklet')}}. Giao diện `AudioWorklet` không tự định nghĩa phương thức nào._

## Sự kiện

_`AudioWorklet` không phản hồi với sự kiện nào._

## Ví dụ

Xem {{domxref("AudioWorkletNode")}} để có các ví dụ đầy đủ về việc tạo nút âm thanh tùy chỉnh.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioWorkletGlobalScope")}} — ngữ cảnh thực thi toàn cục của một `AudioWorklet`
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Sử dụng AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
