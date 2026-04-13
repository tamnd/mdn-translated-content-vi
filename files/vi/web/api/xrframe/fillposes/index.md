---
title: "XRFrame: phương thức fillPoses()"
short-title: fillPoses()
slug: Web/API/XRFrame/fillPoses
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.fillPoses
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`fillPoses()`** của giao diện {{domxref("XRFrame")}} điền một {{jsxref("Float32Array")}} với các ma trận tư thế tương đối với không gian cơ sở cho trước và trả về `true` nếu thành công cho tất cả các không gian.

## Cú pháp

```js-nolint
fillPoses(spaces, baseSpace, transforms)
```

### Tham số

- `spaces`
  - : Một mảng các đối tượng {{domxref("XRSpace")}} để lấy tư thế.
- `baseSpace`
  - : Một đối tượng {{domxref("XRSpace")}} được dùng làm cơ sở hoặc gốc tọa độ cho vị trí và hướng tương đối.
- `transforms`
  - : Một {{jsxref("Float32Array")}} được điền với các ma trận tư thế tương đối với `baseSpace` cho trước.

### Giá trị trả về

Một giá trị boolean cho biết liệu tất cả các không gian có tư thế hợp lệ hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu độ dài của `spaces` nhân với 16 lớn hơn số phần tử trong `transforms`.

## Ví dụ

### Lấy tư thế cho tất cả khớp của một bàn tay

Để hiệu quả lấy tất cả tư thế cho 25 khớp của mỗi {{domxref("XRHand")}}, bạn có thể sử dụng phương thức `fillPoses()`.

```js
let poses1 = new Float32Array(16 * 25);
let poses2 = new Float32Array(16 * 25);

function onXRFrame(xrFrame, renderer) {
  let hand1 = xrFrame.session.inputSources[0].hand;
  xrFrame.fillPoses(hand1.values(), renderer.referenceSpace, poses1);
  let hand2 = xrFrame.session.inputSources[1].hand;
  xrFrame.fillPoses(hand2.values(), renderer.referenceSpace, poses2);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRHand")}}
- {{domxref("XRJointSpace")}}
- {{jsxref("Float32Array")}}
