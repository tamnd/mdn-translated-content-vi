---
title: Gamepad
slug: Web/API/Gamepad
page-type: web-api-interface
browser-compat: api.Gamepad
---

{{APIRef("Gamepad API")}}

Giao diện **`Gamepad`** của [Gamepad API](/en-US/docs/Web/API/Gamepad_API) định nghĩa một gamepad hoặc bộ điều khiển riêng lẻ, cho phép truy cập vào các thông tin như việc nhấn nút, vị trí trục và id.

Một đối tượng Gamepad có thể được trả về theo một trong hai cách: thông qua thuộc tính `gamepad` của các sự kiện {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} và {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}}, hoặc bằng cách lấy bất kỳ vị trí nào trong mảng được trả về bởi phương thức {{domxref("Navigator.getGamepads()")}}.

> [!NOTE]
> Mức hỗ trợ các tính năng của gamepad thay đổi tùy theo từng tổ hợp nền tảng và bộ điều khiển. Ngay cả khi bộ điều khiển hỗ trợ một tính năng nhất định (ví dụ: phản hồi xúc giác), nền tảng có thể không hỗ trợ tính năng đó cho bộ điều khiển ấy.

## Thuộc tính thể hiện

- {{domxref("Gamepad.axes")}} {{ReadOnlyInline}}
  - : Một mảng biểu diễn các điều khiển có trục trên thiết bị (ví dụ: cần analog).
- {{domxref("Gamepad.buttons")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("gamepadButton")}} biểu diễn các nút bấm có trên thiết bị.
- {{domxref("Gamepad.connected")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết gamepad còn đang được kết nối với hệ thống hay không.
- {{domxref("Gamepad.displayId")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về {{domxref("VRDisplay.displayId")}} của một {{domxref("VRDisplay")}} được liên kết (nếu có liên quan) - tức là `VRDisplay` mà gamepad đang điều khiển cảnh được hiển thị.
- {{domxref("Gamepad.hand")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một enum định nghĩa tay nào đang cầm bộ điều khiển, hoặc tay nào nhiều khả năng sẽ cầm nó.
- {{domxref("Gamepad.hapticActuators")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một mảng chứa các đối tượng {{domxref("GamepadHapticActuator")}}, mỗi đối tượng biểu diễn phần cứng phản hồi xúc giác có sẵn trên bộ điều khiển.
- {{domxref("Gamepad.vibrationActuator")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GamepadHapticActuator")}}, biểu diễn phần cứng phản hồi xúc giác có sẵn trên bộ điều khiển.
- {{domxref("Gamepad.id")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa thông tin nhận dạng về bộ điều khiển.
- {{domxref("Gamepad.index")}} {{ReadOnlyInline}}
  - : Một số nguyên được tự động tăng để duy nhất cho từng thiết bị hiện đang được kết nối với hệ thống.
- {{domxref("Gamepad.mapping")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết trình duyệt có ánh xạ lại các điều khiển trên thiết bị theo một bố cục đã biết hay không.
- {{domxref("Gamepad.pose")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một đối tượng {{domxref("GamepadPose")}} biểu diễn thông tin tư thế liên quan đến một bộ điều khiển WebVR (ví dụ: vị trí và hướng của nó trong không gian 3D).
- {{domxref("Gamepad.timestamp")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm gần nhất dữ liệu của gamepad này được cập nhật.

## Ví dụ

```js
window.addEventListener("gamepadconnected", (e) => {
  console.log(
    "Gamepad connected at index %d: %s. %d buttons, %d axes.",
    e.gamepad.index,
    e.gamepad.id,
    e.gamepad.buttons.length,
    e.gamepad.axes.length,
  );
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
