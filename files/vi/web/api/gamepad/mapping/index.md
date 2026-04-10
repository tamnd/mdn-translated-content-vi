---
title: "Gamepad: thuộc tính mapping"
short-title: mapping
slug: Web/API/Gamepad/mapping
page-type: web-api-instance-property
browser-compat: api.Gamepad.mapping
---

{{APIRef("Gamepad API")}}

Thuộc tính **`Gamepad.mapping`** của giao diện {{domxref("Gamepad")}} trả về một chuỗi cho biết trình duyệt có ánh xạ lại các điều khiển trên thiết bị theo một bố cục đã biết hay không.

Các bố cục đã biết hiện được hỗ trợ là:

- `"standard"` cho [standard gamepad](https://w3c.github.io/gamepad/#remapping).
- `"xr-standard"` cho [standard XR gamepad](https://immersive-web.github.io/webxr-gamepads-module/#xr-standard-heading). Xem thêm {{domxref("XRInputSource.gamepad")}}.

## Ví dụ

```js
let gp = navigator.getGamepads()[0];
console.log(gp.mapping);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

[Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
