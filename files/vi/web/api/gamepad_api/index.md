---
title: Gamepad API
slug: Web/API/Gamepad_API
page-type: web-api-overview
browser-compat: api.Gamepad
---

{{DefaultAPISidebar("Gamepad API")}}

**Gamepad API** là một cách để nhà phát triển truy cập và phản hồi các tín hiệu từ gamepad và các bộ điều khiển trò chơi khác theo một cách đơn giản, nhất quán. API này bao gồm ba giao diện, hai sự kiện và một hàm chuyên biệt để phản hồi việc gamepad được kết nối hoặc ngắt kết nối, đồng thời truy cập các thông tin khác về chính gamepad đó, cũng như những nút bấm và điều khiển khác đang được nhấn.

## Giao diện

- [`Gamepad`](/en-US/docs/Web/API/Gamepad)
  - : Đại diện cho một gamepad/bộ điều khiển được kết nối với máy tính.
- [`GamepadButton`](/en-US/docs/Web/API/GamepadButton)
  - : Đại diện cho một nút trên một trong các bộ điều khiển đã kết nối.
- [`GamepadEvent`](/en-US/docs/Web/API/GamepadEvent)
  - : Đối tượng sự kiện biểu diễn các sự kiện được phát ra có liên quan đến gamepad.

### Các phần mở rộng thử nghiệm của Gamepad

- [`GamepadHapticActuator`](/en-US/docs/Web/API/GamepadHapticActuator)
  - : Đại diện cho phần cứng trong bộ điều khiển được thiết kế để cung cấp phản hồi xúc giác cho người dùng (nếu có), phổ biến nhất là phần cứng rung.
- [`GamepadPose`](/en-US/docs/Web/API/GamepadPose)
  - : Đại diện cho tư thế của một bộ điều khiển (ví dụ: vị trí và hướng trong không gian 3D) trong trường hợp bộ điều khiển [WebVR](/en-US/docs/Web/API/WebVR_API). Giao diện này _không_ được tiêu chuẩn [WebXR](/en-US/docs/Web/API/WebXR_Device_API) mới hơn sử dụng.

### Phần mở rộng cho các giao diện khác

#### Navigator

- {{domxref("Navigator.getGamepads()")}}
  - : Một phần mở rộng cho đối tượng {{domxref("Navigator")}} trả về một mảng các đối tượng {{domxref("Gamepad")}}, mỗi phần tử tương ứng với một gamepad đã kết nối.

#### Sự kiện Window

- {{domxref("Window.gamepadconnected_event", "gamepadconnected")}}
  - : Sự kiện được kích hoạt khi một gamepad được kết nối.
- {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}}
  - : Sự kiện được kích hoạt khi một gamepad bị ngắt kết nối.

## Hướng dẫn và bài viết

- [Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
- [Implementing controls using the Gamepad API](/en-US/docs/Games/Techniques/Controls_Gamepad_API)

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [The Gamepad API](https://hacks.mozilla.org/2013/12/the-gamepad-api/) bởi Ted Mielczarek và Robert Nyman
- [Trang demo API đơn giản](https://luser.github.io/gamepadtest/) ([mã nguồn](https://github.com/luser/gamepadtest))
