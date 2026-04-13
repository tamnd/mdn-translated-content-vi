---
title: "XRProjectionLayer: textureArrayLength property"
short-title: textureArrayLength
slug: Web/API/XRProjectionLayer/textureArrayLength
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRProjectionLayer.textureArrayLength
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`textureArrayLength`** của giao diện {{domxref("XRProjectionLayer")}} cho biết số lượng layer của layer cho texture mảng khi sử dụng `texture-array` làm `textureType`.

Số lượng layer của projection layer cho texture mảng được xác định bởi user agent hoặc thiết bị. Nó được báo cáo trong {{domxref("XRSubImage")}}, chỉ có thể được truy cập bên trong vòng lặp frame. Nếu bạn muốn quản lý các depth buffer của riêng mình và không muốn đợi frame đầu tiên sau khi tạo layer để xác định kích thước cần thiết cho các buffer đó, thuộc tính `textureArrayLength` cho phép truy cập số lượng layer cho texture mảng bên ngoài vòng lặp frame. Việc phân bổ các buffer này có thể xảy ra ngay sau khi tạo layer.

## Giá trị

Một số cho biết số lượng layer của texture màu sắc khi sử dụng `texture-array` làm `textureType`. Ngược lại sẽ là `1`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSubImage")}}
