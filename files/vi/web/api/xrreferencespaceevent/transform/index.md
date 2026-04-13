---
title: "XRReferenceSpaceEvent: thuộc tính transform"
short-title: transform
slug: Web/API/XRReferenceSpaceEvent/transform
page-type: web-api-instance-property
browser-compat: api.XRReferenceSpaceEvent.transform
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`transform`** của {{domxref("XRReferenceSpaceEvent")}} cho biết vị trí và hướng của gốc gốc gốc của {{domxref("XRReferenceSpaceEvent.referenceSpace", "referenceSpace")}} được chỉ định sau khi các thay đổi mà sự kiện đại diện được áp dụng. `transform` được định nghĩa bằng cách sử dụng hệ tọa độ cũ, cho phép nó được sử dụng để chuyển đổi tọa độ từ hệ tọa độ trước sự kiện sang hệ tọa độ sau sự kiện.

## Giá trị

Một đối tượng {{domxref("XRRigidTransform")}} cung cấp biến đổi có thể được sử dụng để chuyển đổi tọa độ từ hệ tọa độ trước sự kiện sang hệ tọa độ sau sự kiện.

## Ghi chú sử dụng

Khi nhận được sự kiện `reset`, bạn có thể áp dụng `transform` vào thông tin vị trí hoặc hướng được lưu trong bộ nhớ cache để dịch chuyển chúng vào hệ tọa độ được cập nhật. Ngoài ra, bạn có thể loại bỏ bất kỳ thông tin vị trí nào được lưu trong bộ nhớ cache và tính toán lại từ đầu. Cách tiếp cận bạn chọn sẽ phụ thuộc vào nhu cầu của bạn.

Để biết chi tiết về nguyên nhân gây ra sự kiện `reset` và cách phản hồi, hãy xem tài liệu sự kiện {{domxref("XRReferenceSpace.reset_event", "reset")}}.

## Ví dụ

Ví dụ này xử lý sự kiện `reset` bằng cách duyệt qua tất cả các đối tượng trong cảnh, cập nhật vị trí của từng đối tượng bằng cách nhân với `transform` được cung cấp trong sự kiện. Cảnh được đại diện bởi đối tượng `scene`, với tất cả các đối tượng trong một mảng gọi là `objects` bên trong nó.

```js
xrReferenceSpace.addEventListener("reset", (event) => {
  for (const obj of scene.objects) {
    mat4.multiply(obj.transform, obj.transform, event.transform);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
