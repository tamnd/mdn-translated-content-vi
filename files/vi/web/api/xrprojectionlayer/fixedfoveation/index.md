---
title: "XRProjectionLayer: fixedFoveation property"
short-title: fixedFoveation
slug: Web/API/XRProjectionLayer/fixedFoveation
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRProjectionLayer.fixedFoveation
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`fixedFoveation`** của giao diện {{domxref("XRProjectionLayer")}} là một số cho biết mức độ foveation được compositor XR sử dụng cho layer. Fixed Foveated Rendering (FFR) kết xuất các cạnh của texture mắt ở độ phân giải thấp hơn so với trung tâm và giảm tải GPU.

Nó hữu ích nhất cho các texture ít tương phản như hình nền, nhưng ít hữu ích hơn cho các hình ảnh có độ tương phản cao như văn bản hoặc hình ảnh chi tiết. Các tác giả có thể điều chỉnh mức độ trên cơ sở từng frame để đạt được sự cân bằng tốt nhất giữa hiệu suất và chất lượng hình ảnh.

## Giá trị

Một số từ 0 đến 1.

- Mức độ foveation tối thiểu được biểu thị bằng 0 (độ phân giải đầy đủ).
- Mức độ foveation tối đa được biểu thị bằng 1 (các cạnh kết xuất ở độ phân giải thấp hơn).

User agent quyết định cách giải thích các số trong phạm vi này. Khi thay đổi mức độ foveation, hiệu ứng sẽ hiển thị trong {{domxref("XRFrame")}} tiếp theo.

Lưu ý rằng một số user agent có thể triển khai các mức độ foveation nhất định, vì vậy bạn có thể cần điều chỉnh mức độ foveation theo các bước lớn để thấy hiệu ứng. Các mức độ ví dụ:

- `0`: không có foveation
- `1/3`: foveation thấp
- `2/3`: foveation trung bình
- `1.0`: foveation tối đa

Một số thiết bị không hỗ trợ kết xuất foveated. Trong trường hợp đó `fixedFoveation` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và việc đặt nó sẽ không có tác dụng.

## Ví dụ

### Đặt mức độ fixed foveation rendering động

Thuộc tính `fixedFoveation` cho phép bạn đặt mức độ foveation tại thời điểm chạy và cho mỗi frame. Để đặt foveation tối đa cho một {{domxref("XRProjectionLayer")}} nhất định, hãy sử dụng giá trị `1`.

```js
let glProjectionLayer = glBinding.createProjectionLayer(/* … */);
glProjectionLayer.fixedFoveation = 1; // maximum foveation
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Foveated rendering](https://en.wikipedia.org/wiki/Foveated_rendering)
