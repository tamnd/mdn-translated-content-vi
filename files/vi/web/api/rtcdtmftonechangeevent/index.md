---
title: RTCDTMFToneChangeEvent
slug: Web/API/RTCDTMFToneChangeEvent
page-type: web-api-interface
browser-compat: api.RTCDTMFToneChangeEvent
---

{{APIRef("WebRTC")}}

Giao diện **`RTCDTMFToneChangeEvent`** đại diện cho các sự kiện được gửi để chỉ ra rằng các âm {{Glossary("DTMF")}} đã bắt đầu hoặc kết thúc phát. Giao diện này được sử dụng bởi sự kiện [`tonechange`](/en-US/docs/Web/API/RTCDTMFSender/tonechange_event).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Ngoài các thuộc tính của {{domxref("Event")}}, giao diện này cung cấp thêm:_

- {{domxref("RTCDTMFToneChangeEvent.tone")}} {{ReadOnlyInline}}
  - : Một chuỗi xác định âm đã bắt đầu phát, hoặc một chuỗi rỗng (`""`) nếu âm trước đó đã kết thúc phát.

## Hàm khởi tạo

- {{domxref("RTCDTMFToneChangeEvent.RTCDTMFToneChangeEvent()", "RTCDTMFToneChangeEvent()")}}
  - : Trả về một `RTCDTMFToneChangeEvent` mới. Nó nhận hai tham số, tham số đầu tiên là một chuỗi đại diện cho loại sự kiện (luôn là `"tonechange"`); tham số thứ hai là một từ điển chứa trạng thái ban đầu của các thuộc tính của sự kiện.

## Phương thức phiên bản

_Hỗ trợ các phương thức được định nghĩa trong {{domxref("Event")}}. Không có phương thức bổ sung nào._

## Ví dụ

Đoạn mã này được lấy từ ví dụ đầy đủ, hoạt động trong phần về [Khi một âm kết thúc phát](/en-US/docs/Web/API/WebRTC_API/Using_DTMF#when_a_tone_finishes_playing). Nó thêm mỗi âm vào hộp hiển thị khi phát, và khi tất cả các âm đã được gửi, kích hoạt lại nút "Send" đã bị vô hiệu hóa trước đó, cho phép nhập chuỗi DTMF tiếp theo.

```js
dtmfSender.addEventListener("change", (event) => {
  if (event.tone !== "") {
    dialStringBox.innerText += event.tone;
  } else {
    sendDTMFButton.disabled = false;
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- Mục tiêu thường gặp của nó: {{domxref("RTCDTMFSender")}}.
