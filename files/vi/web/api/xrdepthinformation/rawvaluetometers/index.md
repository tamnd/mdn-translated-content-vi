---
title: "XRDepthInformation: rawValueToMeters property"
short-title: rawValueToMeters
slug: Web/API/XRDepthInformation/rawValueToMeters
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRDepthInformation.rawValueToMeters
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`rawValueToMeters`** của giao diện {{DOMxRef("XRDepthInformation")}} chứa hệ số tỷ lệ mà các giá trị độ sâu thô phải được nhân để có được độ sâu tính bằng mét.

Đối với thông tin độ sâu CPU, xem thêm phương thức {{domxref("XRCPUDepthInformation.getDepthInMeters()")}}.

## Giá trị

Một số.

## Ví dụ

Sử dụng {{domxref("XRFrame.getDepthInformation()")}} (CPU) hoặc {{domxref("XRWebGLBinding.getDepthInformation()")}} (WebGL) để lấy thông tin độ sâu. Các đối tượng được trả về sẽ chứa hệ số tỷ lệ `rawValueToMeters`, có thể được sử dụng để tính toán thêm.

Đối với thông tin độ sâu CPU và bộ đệm có định dạng "luminance-alpha":

```js
const uint16 = new Uint16Array(depthInfo.data);
const index = column + row * depthInfo.width;
const depthInMeters = uint16[index] * depthInfo.rawValueToMeters;
```

(Sử dụng {{jsxref("Float32Array")}} cho định dạng dữ liệu "float32".)

Lưu ý rằng độ sâu tính bằng mét là trong tọa độ bộ đệm độ sâu. Cần thêm các bước để chuyển đổi sang tọa độ khung nhìn chuẩn hóa, hoặc có thể sử dụng phương thức {{domxref("XRCPUDepthInformation.getDepthInMeters()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
