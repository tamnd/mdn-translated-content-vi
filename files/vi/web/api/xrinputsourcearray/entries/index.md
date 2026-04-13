---
title: "XRInputSourceArray: entries() method"
short-title: entries()
slug: Web/API/XRInputSourceArray/entries
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRInputSourceArray.entries
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`entries()`** của giao diện {{domxref("XRInputSourceArray")}} trả về một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) JavaScript có thể được sử dụng để lặp qua các cặp key/value trong mảng nguồn đầu vào. Mỗi mục trong mảng là một đối tượng {{domxref("XRInputSource")}}.

Thường xuyên nhất, bạn sẽ sử dụng điều này kết hợp với các câu lệnh như [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of).

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) có thể được sử dụng để duyệt danh sách các đối tượng `XRInputSource` có trong mảng nguồn đầu vào.

## Ví dụ

Đoạn code này lấy danh sách đầu vào cho một phiên và cố gắng xử lý từng loại thiết bị đầu vào mà nó hỗ trợ.

```js
let sources = xrSession.inputSources;

for (const input of sources.entries()) {
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
}
```

Đối với mỗi đầu vào trong danh sách, đầu vào gamepad được gửi đến `checkGamepad()` với đối tượng {{domxref("Gamepad")}} của đầu vào, lấy từ thuộc tính {{domxref("XRInputSource.gamepad", "gamepad")}} của nó.

Đối với các thiết bị khác, chúng ta tìm kiếm các thiết bị `tracked-pointer` trong tay chính của người chơi, gửi chúng đến phương thức `handleMainHandInput()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
