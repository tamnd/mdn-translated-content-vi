---
title: "XRInputSource: targetRayMode property"
short-title: targetRayMode
slug: Web/API/XRInputSource/targetRayMode
page-type: web-api-instance-property
browser-compat: api.XRInputSource.targetRayMode
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`targetRayMode`** của {{domxref("XRInputSource")}} cho biết phương pháp mà tia mục tiêu cho nguồn đầu vào nên được tạo ra và cách trình bày cho người dùng.

Thông thường, một tia mục tiêu được vẽ từ nguồn của hệ thống nhắm mục tiêu dọc theo tia mục tiêu theo hướng người dùng đang nhìn hoặc chỉ vào. Phong cách của tia nói chung là tùy bạn, cũng như phương pháp để chỉ ra điểm cuối của tia. Điểm hoặc đối tượng được nhắm tới có thể được chỉ ra bằng cách vẽ một hình dạng hoặc tô sáng bề mặt hoặc đối tượng được nhắm tới.

Tia mục tiêu phát ra từ bộ điều khiển tay:

![Ảnh chụp màn hình hiển thị tia mục tiêu phát ra từ bộ điều khiển tay](https://mdn.github.io/shared-assets/images/examples/hand-controller-target-ray.gif)

Tia mục tiêu có thể là bất cứ thứ gì, từ một đường đơn giản (lý tưởng là mờ dần theo khoảng cách) đến một hiệu ứng animated, chẳng hạn như kiểu "phaser" khoa học viễn tưởng được hiển thị trong ảnh chụp màn hình ở trên.

## Giá trị

Một chuỗi cho biết phương pháp nào để sử dụng khi tạo và trình bày tia mục tiêu cho người dùng. Các giá trị có thể là:

- `gaze`
  - : Người dùng đang sử dụng hệ thống theo dõi mắt (hoặc **đầu vào nhìn**) phát hiện hướng người dùng đang nhìn. Tia mục tiêu sẽ được vẽ bắt đầu từ mắt người xem và theo hướng họ đang nhìn.
- `screen`
  - : Hướng của tia mục tiêu được chỉ ra bằng cách nhấp trên màn hình cảm ứng, chuột hoặc thiết bị đầu vào xúc giác khác.
- `tracked-pointer`
  - : Nhắm mục tiêu đang được thực hiện bằng thiết bị cầm tay hoặc hệ thống theo dõi tay mà người dùng chỉ theo hướng của mục tiêu. Tia mục tiêu mở rộng từ tay (hoặc đối tượng trong tay) theo hướng được nhắm tới.
- `transient-pointer`
  - : Nguồn đầu vào được tạo ra như một phần của ý định tương tác hệ điều hành thay vì một phần cứng cụ thể. Một số ví dụ bao gồm các ý định người dùng dựa trên thông tin quá nhạy cảm để hiển thị trực tiếp như nhìn, đầu vào được tổng hợp từ trình điều khiển web hoặc đầu vào được tạo ra bởi các công nghệ hỗ trợ.

## Ghi chú sử dụng

{{domxref("XRInputSource.targetRaySpace", "targetRaySpace")}} của nguồn đầu vào cho biết vị trí và hướng của tia mục tiêu, và có thể được dùng để xác định nơi kết xuất tia.

## Ví dụ

Đoạn code này cho thấy một phần của hàm được gọi mỗi khung hình. Nó tìm kiếm các đầu vào có {{domxref("XRInputSource.targetRaySpace", "targetRaySpace")}} khác `null`. Các đầu vào có giá trị cho thuộc tính này đại diện cho các đầu vào chiếu tia mục tiêu ra ngoài từ người dùng.

Đối với mỗi đầu vào như vậy, ví dụ này tìm kiếm các đầu vào có `targetRayMode` là `tracked-pointer`, cho biết đầu vào thực sự nhằm mục đích đại diện cho thiết bị nhắm mục tiêu thay vì thiết bị nhìn, nhấp màn hình hoặc nhấp chuột. Đối với các con trỏ được theo dõi, hàm `myRenderTargetRayAsBeam()` được gọi để kết xuất một chùm từ vị trí ảo của bộ điều khiển đầu vào ra ngoài theo hướng nó đang chỉ.

```js
function updateInputSources(session, frame, refSpace) {
  for (const source of session.getInputSources()) {
    const targetRayPose = frame.getPose(inputSource.targetRaySpace, refSpace);

    if (targetRayPose) {
      if (source.targetRayMode === "tracked-pointer") {
        myRenderTargetRayAsBeam(targetRayPose);
      }
    }

    // …
  }
}
```

Xem bài viết [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs) để biết thêm chi tiết và ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- [Sử dụng gamepad trong ứng dụng WebXR](/en-US/docs/Web/API/WebXR_Device_API/Gamepads)
