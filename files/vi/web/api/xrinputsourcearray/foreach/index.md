---
title: "XRInputSourceArray: forEach() method"
short-title: forEach()
slug: Web/API/XRInputSourceArray/forEach
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRInputSourceArray.forEach
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`forEach()`** của {{domxref("XRInputSourceArray")}} thực thi callback được chỉ định một lần cho mỗi nguồn đầu vào trong mảng, bắt đầu từ chỉ mục 0 và tiến đến cuối danh sách.

## Cú pháp

```js-nolint
forEach(callback)
forEach(callback, thisArg)
```

### Tham số

- `callback`
  - : Một hàm thực thi một lần cho mỗi mục trong mảng `xrInputSourceArray`. Callback chấp nhận tối đa ba tham số:
    - `currentValue`
      - : Một đối tượng {{domxref("XRInputSource")}} là giá trị của mục từ trong `xrInputSourceArray` đang được xử lý hiện tại.
    - `currentIndex` {{Optional_Inline}}
      - : Một giá trị số nguyên cung cấp chỉ mục vào mảng tại vị trí phần tử được cho bởi `currentValue`. Nếu bạn không cần biết số chỉ mục, bạn có thể bỏ qua điều này.
    - `sourceList` {{Optional_Inline}}
      - : Đối tượng {{domxref("XRInputSourceArray")}} đang được xử lý. Nếu bạn không cần thông tin này, bạn có thể bỏ qua điều này.

- `thisArg` {{Optional_Inline}}
  - : Giá trị được sử dụng cho [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) trong khi thực thi callback. Lưu ý rằng nếu bạn sử dụng [ký hiệu hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) (`=>`) để cung cấp callback, bạn có thể bỏ qua `thisArg`, vì tất cả hàm mũi tên đều liên kết `this` theo từ vựng.

### Giá trị trả về

Undefined.

## Ví dụ

Đoạn code này lấy danh sách đầu vào cho một phiên và cố gắng xử lý từng loại thiết bị đầu vào mà nó hỗ trợ.

```js
let inputSources = xrSession.inputSources;

inputSources.forEach((input) => {
  if (input.gamepad) {
    checkGamepad(input.gamepad);
  } else if (
    input.targetRayMode === "tracked-pointer" &&
    input.handedness === player.handedness
  ) {
    /* Handle main hand controller */
    handleMainHandInput(input);
  } else {
    /* Handle other inputs */
  }
});
```

Đối với mỗi đầu vào trong danh sách, callback gửi đầu vào gamepad đến `checkGamepad()` với đối tượng {{domxref("Gamepad")}} của đầu vào.

Đối với các thiết bị khác, chúng ta tìm kiếm các thiết bị `tracked-pointer` trong tay chính của người chơi, gửi chúng đến phương thức `handleMainHandInput()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Inputs and input sources](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- Phương thức `forEach()` của [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
- {{domxref("XRInputSource")}}
