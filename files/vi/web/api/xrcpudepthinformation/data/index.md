---
title: "XRCPUDepthInformation: thuộc tính data"
short-title: data
slug: Web/API/XRCPUDepthInformation/data
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCPUDepthInformation.data
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính _chỉ đọc_ **`data`** của giao diện {{DOMxRef("XRCPUDepthInformation")}} là một {{jsxref("ArrayBuffer")}} chứa thông tin bộ đệm độ sâu ở định dạng thô.

Dữ liệu được lưu trữ theo định dạng hàng-chính, không có padding, với mỗi mục tương ứng với khoảng cách từ mặt phẳng gần của view đến môi trường của người dùng, tính theo đơn vị chưa xác định. Kích thước của mỗi mục dữ liệu và kiểu dữ liệu được xác định bởi {{domxref("XRSession.depthDataFormat", "depthDataFormat")}}. Các giá trị có thể được chuyển đổi từ đơn vị chưa xác định sang mét bằng cách nhân chúng với {{domxref("XRDepthInformation.rawValueToMeters", "rawValueToMeters")}}. Thuộc tính {{domxref("XRDepthInformation.normDepthBufferFromNormView", "normDepthBufferFromNormView")}} có thể được sử dụng để biến đổi từ tọa độ view chuẩn hóa (gốc tọa độ ở góc trên bên trái của view, trục X tăng sang phải, trục Y tăng xuống dưới) vào hệ tọa độ của bộ đệm độ sâu.

## Giá trị

Một {{jsxref("ArrayBuffer")}}.

## Ví dụ

Sử dụng {{domxref("XRFrame.getDepthInformation()")}} để lấy thông tin độ sâu. Đối tượng `XRCPUDepthInformation` được trả về sẽ chứa bộ đệm `data`.

Đối với thông tin độ sâu CPU và bộ đệm có định dạng "luminance-alpha":

```js
const uint16 = new Uint16Array(depthInfo.data);
const index = column + row * depthInfo.width;
const depthInMeters = uint16[index] * depthInfo.rawValueToMeters;
```

(Sử dụng {{jsxref("Float32Array")}} cho định dạng dữ liệu "float32".)

Lưu ý rằng độ sâu tính bằng mét nằm trong tọa độ bộ đệm độ sâu. Cần thêm các bước để chuyển đổi chúng sang tọa độ view chuẩn hóa, hoặc có thể sử dụng phương thức {{domxref("XRCPUDepthInformation.getDepthInMeters()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
