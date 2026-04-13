---
title: "XRFrame: phương thức fillJointRadii()"
short-title: fillJointRadii()
slug: Web/API/XRFrame/fillJointRadii
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.fillJointRadii
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`fillJointRadii()`** của giao diện {{domxref("XRFrame")}} điền một {{jsxref("Float32Array")}} với bán kính cho danh sách các không gian khớp tay và trả về `true` nếu thành công cho tất cả các không gian.

## Cú pháp

```js-nolint
fillJointRadii(jointSpaces, radii)
```

### Tham số

- `jointSpaces`
  - : Một mảng các đối tượng {{domxref("XRJointSpace")}} để lấy bán kính.
- `radii`
  - : Một {{jsxref("Float32Array")}} được điền với bán kính của các `jointSpaces`.

### Giá trị trả về

Một giá trị boolean cho biết liệu tất cả các không gian có tư thế hợp lệ hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu độ dài của `jointSpaces` lớn hơn số phần tử trong `radii`.

## Ví dụ

### Lấy bán kính cho tất cả khớp của một bàn tay

Để hiệu quả lấy tất cả bán kính cho 25 khớp của mỗi {{domxref("XRHand")}}, bạn có thể sử dụng phương thức `fillJointRadii()`.

```js
let radii1 = new Float32Array(25);
let radii2 = new Float32Array(25);

function onXRFrame(xrFrame, renderer) {
  let hand1 = xrFrame.session.inputSources[0].hand;
  xrFrame.fillJointRadii(hand1.values(), radii1);
  let hand2 = xrFrame.session.inputSources[1].hand;
  xrFrame.fillJointRadii(hand2.values(), radii2);
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
