---
title: "XRInputSource: gamepad property"
short-title: gamepad
slug: Web/API/XRInputSource/gamepad
page-type: web-api-instance-property
browser-compat: api.XRInputSource.gamepad
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`gamepad`** của {{domxref("XRInputSource")}} trả về một đối tượng {{domxref("Gamepad")}} mô tả trạng thái của các nút và trục trên nguồn đầu vào XR, nếu đó là gamepad hoặc thiết bị tương tự. Nếu thiết bị không phải là thiết bị giống gamepad, giá trị của thuộc tính này là `null`.

Đối tượng {{domxref("Gamepad")}} được trả về hoạt động như được mô tả bởi [Gamepad API](/en-US/docs/Web/API/Gamepad_API). Tuy nhiên, có một vài điều cần lưu ý:

- Các đối tượng `Gamepad` thuộc về `XRInputSource` không được bao gồm trong mảng được trả về bởi {{domxref("navigator.getGamepads()")}}. Gamepad liên kết chặt chẽ với phần cứng WebXR và không phải là thiết bị chơi game đa năng.
- {{domxref("Gamepad.id")}} là chuỗi rỗng (`""`)
- {{domxref("Gamepad.index")}} là `-1`
- {{domxref("Gamepad.connected")}} là `true` cho đến khi `XRInputSource` bị xóa khỏi danh sách nguồn đầu vào XR hoạt động hoặc {{domxref("XRSession")}} kết thúc.
- Nếu một trục được báo cáo bởi {{domxref("Gamepad.axes")}} đại diện cho trục của touchpad, giá trị là 0 khi thuộc tính {{domxref("GamepadButton.touched")}} liên quan là `false`.
- {{domxref("Gamepad.mapping")}} trả về "xr-standard".

## Ví dụ

### Sử dụng nguồn đầu vào gamepad

```js
for (const source of frame.session.inputSources) {
  const gamepad = source.gamepad;
  if (gamepad) {
    if (gamepad.buttons[2].pressed) {
      // do something
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
