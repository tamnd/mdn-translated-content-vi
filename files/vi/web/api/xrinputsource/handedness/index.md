---
title: "XRInputSource: handedness property"
short-title: handedness
slug: Web/API/XRInputSource/handedness
page-type: web-api-instance-property
browser-compat: api.XRInputSource.handedness
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`handedness`** của {{domxref("XRInputSource")}} cho biết nguồn đầu vào WebXR được liên kết với tay nào của người dùng, hoặc không liên kết với tay nào cả.

## Giá trị

Một chuỗi cho biết bộ điều khiển đầu vào có được cầm trong một trong hai tay của người dùng hay không, và nếu có thì là tay nào. Giá trị là một trong các giá trị sau:

- `none`
  - : Bộ điều khiển đầu vào không liên kết với một trong hai tay của người dùng.
- `left`
  - : Bộ điều khiển đầu vào đang được cầm, đeo hoặc gắn vào tay trái của người dùng.
- `right`
  - : Bộ điều khiển đầu vào đang được cầm, đeo hoặc gắn vào tay phải của người dùng.

## Ghi chú sử dụng

Nếu nguồn đầu vào không phải là thiết bị liên kết với tay người dùng (dù bằng cách cầm, gắn hoặc đeo), giá trị của `handedness` là `none`. Điều này có thể chỉ ra, ví dụ, một nguồn đầu vào không phải cầm tay, chẳng hạn như điều khiển tích hợp trong tai nghe hoặc thiết bị đầu vào gắn vào đầu hoặc cơ thể.

## Ví dụ

Một trong những tình huống quan trọng khi sử dụng `handedness` là xác định bộ điều khiển ở tay nào để bạn có thể vẽ biểu diễn của tay đó (hoặc thiết bị tay đó đang điều khiển) trong không gian ảo.

```js
function updateInputSources(session, frame, refSpace) {
  for (const source of session.inputSources) {
    if (source.gripSpace) {
      const gripPose = frame.getPose(source.gripSpace, refSpace);

      if (gripPose) {
        myRenderHandObject(gripPose, inputSource.handedness);
      }
    }
  }
}
```

Hàm này, được gọi mỗi khung hình animation (hoặc định kỳ, tùy thuộc vào mức độ mượt mà cần thiết và bất kỳ ràng buộc hiệu suất nào), quét danh sách các nguồn đầu vào để tìm bất kỳ nguồn nào có {{domxref("XRInputSource.gripSpace", "gripSpace")}} khác `null`. Nếu có `gripSpace`, hàm tiếp tục lấy tư thế cho `gripSpace` được biến đổi sang không gian tham chiếu hiện tại. Giả sử tư thế hợp lệ, hàm `myRenderHandObject()` được gọi với tư thế grip và giá trị `handedness`. Nó sau đó vẽ mô hình phù hợp được định vị và tạo hình cho tay đúng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- [Sử dụng gamepad trong ứng dụng WebXR](/en-US/docs/Web/API/WebXR_Device_API/Gamepads)
