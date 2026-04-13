---
title: "XRInputSource: targetRaySpace property"
short-title: targetRaySpace
slug: Web/API/XRInputSource/targetRaySpace
page-type: web-api-instance-property
browser-compat: api.XRInputSource.targetRaySpace
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`targetRaySpace`** của {{domxref("XRInputSource")}} trả về một {{domxref("XRSpace")}} (thường là {{domxref("XRReferenceSpace")}}) đại diện cho vị trí và hướng của tia mục tiêu trong không gian ảo. Gốc bản địa của nó theo dõi vị trí của điểm gốc của tia mục tiêu, và hướng của nó chỉ ra hướng của thiết bị điều khiển. Các giá trị này, được diễn giải trong ngữ cảnh của {{domxref("XRInputSource.targetRayMode", "targetRayMode")}} của nguồn đầu vào, có thể được sử dụng để diễn giải đầy đủ thiết bị như một nguồn đầu vào.

Để lấy một `XRSpace` đại diện cho vị trí và hướng của bộ điều khiển đầu vào trong không gian ảo, hãy sử dụng thuộc tính {{domxref("XRInputSource.gripSpace", "gripSpace")}}.

## Giá trị

Một đối tượng {{domxref("XRSpace")}}, thường là {{domxref("XRReferenceSpace")}} hoặc {{domxref("XRBoundedReferenceSpace")}}, đại diện cho vị trí và hướng của tia mục tiêu của bộ điều khiển đầu vào trong không gian ảo.

Gốc bản địa của `XRSpace` được trả về nằm ở điểm từ đó tia mục tiêu được phát ra, và hướng của không gian chỉ ra hướng tia mục tiêu đang chỉ.

## Ghi chú sử dụng

Tất cả các nguồn đầu vào, bất kể {{domxref("XRInputSource.targetRayMode", "targetRayMode")}} của chúng, đều có `targetRaySpace` hợp lệ. Tuy nhiên, ý nghĩa chính xác của không gian này thay đổi tùy thuộc vào chế độ:

- Mọi đầu vào nhìn (`targetRayMode` là `gaze`) đều chia sẻ cùng một đối tượng {{domxref("XRSpace")}} là không gian tia mục tiêu, vì đầu vào nhìn đến từ đầu người xem. Không gian chia sẻ này đại diện cho cùng vị trí như không gian được trả về bởi phương thức {{domxref("XRSession")}} {{domxref("XRSession.requestReferenceSpace", "requestReferenceSpace()")}}, nhưng được duy trì như một đối tượng khác để cho phép cải tiến API trong tương lai.
- Không gian tia mục tiêu được báo cáo bởi các đầu vào con trỏ được theo dõi (`targetRayMode` là `tracked-pointer`) thực sự dựa trên vị trí và hướng không gian thực sự của thiết bị đầu vào.

Để xác định vị trí và hướng của tia mục tiêu trong khi kết xuất một khung hình, hãy truyền nó vào phương thức {{domxref("XRFrame")}} {{domxref("XRFrame.getPose", "getPose()")}}, sau đó sử dụng {{domxref("XRPose.transform", "transform")}} của đối tượng {{domxref("XRPose")}} được trả về.

## Ví dụ

Đoạn code này cho thấy một phần của hàm được gọi mỗi khung hình. Nó tìm kiếm các đầu vào có `targetRaySpace` khác `null`. Các đầu vào có giá trị cho thuộc tính này đại diện cho các đầu vào chiếu tia mục tiêu ra ngoài từ người dùng.

Đối với mỗi đầu vào như vậy, ví dụ này tìm kiếm các đầu vào có {{domxref("XRInputSource.targetRayMode", "targetRayMode")}} là `tracked-pointer`. Đối với các con trỏ được theo dõi, hàm `myRenderTargetRayAsBeam()` được gọi để kết xuất một chùm từ vị trí ảo của bộ điều khiển đầu vào ra ngoài theo hướng nó đang chỉ.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- [Sử dụng gamepad trong ứng dụng WebXR](/en-US/docs/Web/API/WebXR_Device_API/Gamepads)
