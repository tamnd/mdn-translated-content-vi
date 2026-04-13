---
title: GamepadPose
slug: Web/API/GamepadPose
page-type: web-api-interface
status:
  - experimental
browser-compat: api.GamepadPose
---

{{APIRef("Gamepad API")}}{{SeeCompatTable}}

Giao diện **`GamepadPose`** của [Gamepad API](/en-US/docs/Web/API/Gamepad_API) đại diện cho tư thế của một bộ điều khiển [WebVR](/en-US/docs/Web/API/WebVR_API) tại một dấu thời gian cụ thể (bao gồm thông tin về hướng, vị trí, vận tốc và gia tốc).

Giao diện này có thể truy cập thông qua thuộc tính {{domxref("Gamepad.pose")}}.

## Thuộc tính phiên bản

- {{domxref("GamepadPose.hasOrientation")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị boolean cho biết gamepad có khả năng trả về thông tin hướng (`true`) hay không (`false`).
- {{domxref("GamepadPose.hasPosition")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị boolean cho biết gamepad có khả năng trả về thông tin vị trí (`true`) hay không (`false`).
- {{domxref("GamepadPose.position")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về vị trí của {{domxref("Gamepad")}} dưới dạng vectơ 3D.
- {{domxref("GamepadPose.linearVelocity")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về vận tốc tuyến tính của {{domxref("Gamepad")}}, tính bằng mét mỗi giây.
- {{domxref("GamepadPose.linearAcceleration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về gia tốc tuyến tính của {{domxref("Gamepad")}}, tính bằng mét mỗi giây bình phương.
- {{domxref("GamepadPose.orientation")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về hướng của {{domxref("Gamepad")}}, dưới dạng giá trị quaternion.
- {{domxref("GamepadPose.angularVelocity")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về vận tốc góc của {{domxref("Gamepad")}}, tính bằng radian mỗi giây.
- {{domxref("GamepadPose.angularAcceleration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về gia tốc góc của {{domxref("Gamepad")}}, tính bằng mét mỗi giây bình phương.

## Ví dụ

TBD.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
