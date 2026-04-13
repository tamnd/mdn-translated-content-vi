---
title: XRInputSourcesChangeEvent
slug: Web/API/XRInputSourcesChangeEvent
page-type: web-api-interface
browser-compat: api.XRInputSourcesChangeEvent
---

{{APIRef("WebXR Device API")}} {{SecureContext_Header}}

Giao diện **`XRInputSourcesChangeEvent`** của WebXR Device API được dùng để biểu diễn sự kiện {{domxref("XRSession.inputsourceschange_event", "inputsourceschange")}} gửi đến một {{domxref("XRSession")}} khi tập hợp các bộ điều khiển đầu vào WebXR có sẵn thay đổi.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("XRInputSourcesChangeEvent.XRInputSourcesChangeEvent", "XRInputSourcesChangeEvent()")}}
  - : Tạo và trả về một đối tượng `XRInputSourcesChangeEvent` mới. Loại được chỉ định phải là `inputsourceschange`, là sự kiện duy nhất sử dụng giao diện này.

## Thuộc tính phiên bản

- {{domxref("XRInputSourcesChangeEvent.added", "added")}} {{ReadOnlyInline}}
  - : Mảng gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}}, mỗi đối tượng biểu diễn một thiết bị đầu vào vừa được kết nối mới hoặc được bật để sử dụng.
- {{domxref("XRInputSourcesChangeEvent.removed", "removed")}} {{ReadOnlyInline}}
  - : Mảng gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}} biểu diễn các thiết bị đầu vào vừa bị ngắt kết nối hoặc bị vô hiệu hóa.
- {{domxref("XRInputSourcesChangeEvent.session", "session")}} {{ReadOnlyInline}}
  - : {{domxref("XRSession")}} mà sự kiện thay đổi nguồn đầu vào này được gửi đến.

## Phương thức phiên bản

_Trong khi `XRInputSourcesChangeEvent` không định nghĩa phương thức nào của riêng mình, nó kế thừa các phương thức từ giao diện cha, {{domxref("Event")}}._

## Các loại sự kiện

- {{domxref("XRSession.inputsourceschange_event", "inputsourceschange")}}
  - : Được gửi đến {{domxref("XRSession")}} khi tập hợp các thiết bị đầu vào có sẵn với nó thay đổi.

## Ví dụ

Ví dụ sau đây cho thấy cách thiết lập trình xử lý sự kiện sử dụng các sự kiện `inputsourceschange` để phát hiện các thiết bị trỏ mới có sẵn và tải mô hình của chúng để chuẩn bị hiển thị trong khung hình hoạt ảnh tiếp theo.

```js
xrSession.addEventListener("inputsourceschange", onInputSourcesChange);

function onInputSourcesChange(event) {
  for (const input of event.added) {
    if (input.targetRayMode === "tracked-pointer") {
      loadControllerMesh(input);
    }
  }
}
```

Bạn cũng có thể thêm trình xử lý cho các sự kiện `inputsourceschange` bằng cách đặt trình xử lý sự kiện `oninputsourceschange`:

```js
xrSession.oninputsourceschange = onInputSourcesChange;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
