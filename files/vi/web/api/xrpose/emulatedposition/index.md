---
title: "XRPose: emulatedPosition property"
short-title: emulatedPosition
slug: Web/API/XRPose/emulatedPosition
page-type: web-api-instance-property
browser-compat: api.XRPose.emulatedPosition
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc `emulatedPosition` của giao diện {{DOMxRef("XRPose")}} là giá trị Boolean cho biết liệu thành phần {{domxref("XRRigidTransform.position", "position")}} của {{domxref("XRPose.transform", "transform")}} của pose có được lấy trực tiếp từ thiết bị XR hay không, hay nó được mô phỏng hoặc tính toán dựa trên các nguồn khác.

## Giá trị

Giá trị Boolean là `true` nếu vị trí của pose được tính toán dựa trên ước tính hoặc được suy ra từ các nguồn khác ngoài dữ liệu cảm biến trực tiếp. Nếu vị trí dựa chính xác trên đầu vào cảm biến trực tiếp, giá trị là `false`.

## Ghi chú sử dụng

Có hai loại hệ thống theo dõi XR cơ bản. Tai nghe XR cơ bản cung cấp ba bậc tự do (3DoF), theo dõi pitch, yaw và roll của đầu người dùng. Không có thông tin nào về chuyển động tiến, lùi hoặc sang ngang. Dữ liệu đó được lấy từ các nguồn khác, chẳng hạn như đầu vào từ bàn phím, chuột hoặc tay cầm game. Do đó, vị trí được coi là mô phỏng, vì vậy thuộc tính `emulatedPosition` là `true`.

Ngược lại, các thiết bị XR cũng có thể theo dõi chuyển động tiến, lùi và sang ngang (sáu bậc tự do, 6DoF) không cần thông tin từ các nguồn khác để xác định vị trí của người dùng, vì vậy giá trị của `emulatedPosition` là `false`.

Khái niệm tương tự không chỉ áp dụng cho đầu của người dùng mà còn cho bất kỳ đối tượng nào. Tay cầm điều khiển có thể trực tiếp báo cáo vị trí của nó sẽ có giá trị `false` cho thuộc tính này. Nếu vị trí của nó được tính toán là độ lệch từ một đối tượng khác, giá trị này là `true`.

Thông tin này quan trọng vì các thiết bị có vị trí mô phỏng dễ bị trôi dạt theo thời gian. Điều này là do mô phỏng vị trí dựa trên đầu vào gia tốc kế và mô hình có xu hướng tạo ra các lỗi nhỏ tích lũy theo thời gian.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
