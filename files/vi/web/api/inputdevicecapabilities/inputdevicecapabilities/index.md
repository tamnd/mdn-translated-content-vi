---
title: "InputDeviceCapabilities: InputDeviceCapabilities() constructor"
short-title: InputDeviceCapabilities()
slug: Web/API/InputDeviceCapabilities/InputDeviceCapabilities
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.InputDeviceCapabilities.InputDeviceCapabilities
---

{{APIRef("Input Device Capabilities API")}}{{SeeCompatTable}}

Hàm khởi tạo `InputDeviceCapabilities()` tạo một đối tượng {{domxref("InputDeviceCapabilities")}} mới cung cấp thông tin về thiết bị vật lý chịu trách nhiệm tạo ra một sự kiện cảm ứng.

## Cú pháp

```js-nolint
new InputDeviceCapabilities()
new InputDeviceCapabilities(InputDeviceCapabilitiesInit)
```

### Tham số

- `InputDeviceCapabilitiesInit` {{optional_inline}}
  - : Một đối tượng từ điển chứa tập hợp khả năng của thiết bị. Nó chứa thuộc tính sau.
    - `fireTouchEvents`: Một giá trị boolean cho biết thiết bị có gửi sự kiện cảm ứng không.

### Giá trị trả về

Một phiên bản của giao diện {{domxref("InputDeviceCapabilities")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
