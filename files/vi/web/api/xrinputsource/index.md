---
title: XRInputSource
slug: Web/API/XRInputSource
page-type: web-api-interface
browser-compat: api.XRInputSource
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Giao diện **`XRInputSource`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) mô tả một nguồn đầu vào điều khiển đơn lẻ là một phần của hệ thống thực tế ảo hoặc thực tế tăng cường tương thích WebXR của người dùng. Thiết bị dành riêng cho nền tảng đang được sử dụng, nhưng cung cấp hướng mà nó đang nhắm tới và có thể tạo ra sự kiện nếu người dùng thực hiện các hành động bằng thiết bị.

## Thuộc tính phiên bản

- {{domxref("XRInputSource.gamepad", "gamepad")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("Gamepad")}} mô tả trạng thái của các nút và trục trên nguồn đầu vào XR, nếu đó là gamepad hoặc thiết bị tương tự. Nếu thiết bị không phải là thiết bị giống gamepad, giá trị của thuộc tính này là `null`.
- {{domxref('XRInputSource.gripSpace', 'gripSpace')}} {{ReadOnlyInline}}
  - : Một {{domxref("XRSpace")}} có gốc bản địa theo dõi tư thế dùng để kết xuất các đối tượng ảo sao cho chúng trông như được cầm trong tay được chỉ ra bởi `handedness`. Hướng của không gian này cho biết góc mà tay đang cầm đối tượng. Đọc thêm trong bài viết chính về {{domxref("XRInputSource.gripSpace", "gripSpace")}} để biết thêm chi tiết về cách sử dụng không gian này.
- {{domxref('XRInputSource.hand', 'hand')}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRHand")}} cung cấp quyền truy cập vào thiết bị theo dõi tay cơ bản.
- {{domxref('XRInputSource.handedness', 'handedness')}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết tay nào của người dùng đang dùng thiết bị được đại diện bởi `XRInputSource` này, nếu có. Giá trị sẽ là `left`, `right` hoặc `none`.
- {{domxref('XRInputSource.profiles', 'profiles')}} {{ReadOnlyInline}}
  - : Một mảng các chuỗi, mỗi chuỗi chỉ định tên của một hồ sơ đầu vào mô tả cách trình bày trực quan và hành vi ưa thích của nguồn đầu vào này.
- {{domxref('XRInputSource.targetRayMode', 'targetRayMode')}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết phương pháp được sử dụng để tạo tia mục tiêu: `gaze`, `tracked-pointer` hoặc `screen`.
- {{domxref('XRInputSource.targetRaySpace', 'targetRaySpace')}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRSpace")}} xác định gốc của tia mục tiêu và hướng nó mở rộng. Không gian này được thiết lập bằng phương pháp được định nghĩa bởi `targetRayMode`.

## Phương thức phiên bản

_Giao diện `XRInputSource` không định nghĩa phương thức nào._

## Ghi chú sử dụng

### Hành động và tia mục tiêu

Nếu thiết bị cung cấp chỉ báo về hướng nó đang nhắm, điều này được thực hiện bằng **tia mục tiêu**. Đây là tia mở rộng từ vị trí của thiết bị ra ngoài theo hướng nó đang nhắm.

**Tia mục tiêu phát ra từ bộ điều khiển tay.**

![Ảnh chụp màn hình hiển thị tia mục tiêu phát ra từ bộ điều khiển tay](https://mdn.github.io/shared-assets/images/examples/hand-controller-target-ray.gif)

Nếu thiết bị bao gồm cò súng hoặc đầu vào có thể bóp khác, chẳng hạn như thiết bị cử chỉ tay nhận biết khi người dùng nắm chặt tay, hành động đó được gọi là **hành động bóp chính**. Hành động bóp chính nên tương ứng với một hành động cầm nắm trong thực tế, chẳng hạn như cầm một đối tượng hoặc nhấn cò súng trên một công cụ hoặc vũ khí. Khi hành động bóp bắt đầu, như khi người dùng nhấn cò hoặc siết chặt tay, sự kiện {{domxref("XRSession.squeezestart_event", "squeezestart")}} được gửi đến `XRSession`. Khi hành động hoàn thành và người dùng đã nhả cò hoặc nắm tay, sự kiện {{domxref("XRSession.squeeze_event", "squeeze")}} được gửi. Tiếp theo là {{domxref("XRSession.squeezeend_event", "squeezeend")}}, cũng được gửi nếu hành động bị hủy bỏ thay vì hoàn thành.

Nếu thiết bị có nút hoặc điều khiển đầu vào có thể nhấn khác, đó là **nguồn đầu vào chính** và nút này là **hành động chính**. Hành động chính có thể xảy ra khi người dùng nhấn nút, nhấp trên touchpad hoặc nút đầu cần joystick, hoặc sử dụng cử chỉ tay hoặc lệnh giọng nói gọi ra hành động giống nút. Khi hành động chính bắt đầu, sự kiện {{domxref("XRSession.selectstart_event", "selectstart")}} được gửi đến {{domxref("XRSession")}}. Khi hành động hoàn thành (chẳng hạn khi người dùng nhả nút), sự kiện {{domxref("XRSession.select_event", "select")}} được gửi. Cuối cùng, sau khi hoàn thành hoặc nếu người dùng hủy bỏ hành động, sự kiện {{domxref("XRSession.selectend_event", "selectend")}} được gửi đến đối tượng session.

Hành động có thể bị hủy bỏ bởi người dùng theo cách dành riêng cho thiết bị hoặc nếu thiết bị đầu vào bị ngắt kết nối trước khi hành động hoàn thành.

### Hệ tọa độ cục bộ

Mỗi nguồn đầu vào có hệ tọa độ cục bộ riêng, được mô tả bởi thuộc tính {{domxref("XRInputSource.gripSpace", "gripSpace")}}, là một {{domxref("XRSpace")}} dùng để ánh xạ hệ tọa độ đầu vào vào hệ tọa độ thế giới. Hệ tọa độ của không gian grip sau đó có thể được sử dụng để kết xuất các đối tượng sao cho chúng trông như được cầm trong tay người dùng.

![Sơ đồ hiển thị hệ tọa độ được định nghĩa bởi thuộc tính gripSpace](xr-hand-axes.svg)

Để biết thêm chi tiết về hệ tọa độ của nguồn đầu vào, xem bài viết đề cập chi tiết thuộc tính {{domxref("XRInputSource.gripSpace", "gripSpace")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- {{domxref("XRInputSourceArray")}}
- {{domxref("XRSpace")}}
