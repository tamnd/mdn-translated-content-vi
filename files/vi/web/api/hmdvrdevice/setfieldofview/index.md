---
title: "HMDVRDevice: setFieldOfView() method"
short-title: setFieldOfView()
slug: Web/API/HMDVRDevice/setFieldOfView
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.HMDVRDevice.setFieldOfView
---

{{deprecated_header}}{{APIRef("WebVR API")}}{{Non-standard_header}}

Phương thức **`setFieldOfView()`** của giao diện {{domxref("HMDVRDevice")}} có thể được dùng để đặt trường nhìn cho một mắt, hoặc cả hai mắt đồng thời.

## Cú pháp

```js-nolint
setFieldOfView(leftFOV, rightFOV, zNear, zFar)
```

### Tham số

- `leftFOV` {{optional_inline}}
  - : Một đối tượng {{domxref("VRFieldOfView")}} định nghĩa trường nhìn mới cho mắt trái. Nếu không được chỉ định, trường nhìn của mắt trái không thay đổi.
- `rightFOV` {{optional_inline}}
  - : Một đối tượng {{domxref("VRFieldOfView")}} định nghĩa trường nhìn mới cho mắt phải. Nếu không được chỉ định, trường nhìn của mắt phải không thay đổi.
- `zNear` {{optional_inline}}
  - : Khoảng cách từ mắt đến điểm gần nhất của khung nhìn. Điều gần nhất có thể vẫn nằm trong khung nhìn. Nếu không được chỉ định, giá trị mặc định được sử dụng là `0.01`.
- `zFar` {{optional_inline}}
  - : Khoảng cách từ mắt đến điểm xa nhất của khung nhìn. Điều xa nhất có thể vẫn nằm trong khung nhìn. Nếu không được chỉ định, giá trị mặc định được sử dụng là `10000.0`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ đơn giản sau đây minh họa một hàm có thể được dùng để đặt trường nhìn tùy chỉnh với bốn giá trị độ được chỉ định cho lên, phải, xuống và trái. Hàm khởi tạo `VRFieldOfView()` được dùng để tạo đối tượng {{domxref("VRFieldOfView")}} từ các giá trị được cung cấp, sau đó được đưa vào phương thức `setFieldOfView()` (các giá trị mặc định `zNear` và `zFar` luôn được sử dụng trong trường hợp này.)

```js
function setCustomFOV(up, right, down, left) {
  const testFOV = new VRFieldOfView(up, right, down, left);

  gHMD.setFieldOfView(testFOV, testFOV, 0.01, 10000.0);

  const lEye = gHMD.getEyeParameters("left");
  const rEye = gHMD.getEyeParameters("right");
  console.log(lEye.currentFieldOfView);
  console.log(rEye.currentFieldOfView);
}
```

> [!NOTE]
> Khi kiểm thử, việc đặt trường nhìn kỳ lạ/quá nhỏ thực sự có thể làm rối loạn khung nhìn của bạn. Tốt nhất là lấy trường nhìn hiện tại trước (bằng {{domxref("VREyeParameters.fieldOfView")}}) trước khi thực hiện bất kỳ thay đổi mạnh mẽ nào, để bạn có thể đặt lại nó sau nếu cần.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
