---
title: XRRenderState
slug: Web/API/XRRenderState
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRRenderState
---

{{securecontext_header}}{{APIRef("WebXR")}}{{SeeCompatTable}}

Giao diện **`XRRenderState`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) chứa các giá trị có thể cấu hình ảnh hưởng đến cách hình ảnh được tạo ra bởi {{DOMxRef("XRSession")}} được tổng hợp. Các thuộc tính này bao gồm phạm vi khoảng cách từ người xem trong đó nội dung nên được kết xuất, trường nhìn dọc (cho trình bày nội tuyến), và tham chiếu đến {{domxref("XRWebGLLayer")}} đang được sử dụng làm mục tiêu kết xuất cảnh trước khi trình bày trên màn hình hoặc các màn hình của thiết bị XR.

Khi bạn áp dụng các thay đổi bằng phương thức {{domxref("XRSession.updateRenderState", "updateRenderState()")}} của `XRSession`, các thay đổi được chỉ định có hiệu lực sau khi frame hoạt ảnh hiện tại hoàn thành, nhưng trước khi frame tiếp theo bắt đầu.

## Thuộc tính phiên bản

- {{DOMxRef("XRRenderState.baseLayer")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : {{DOMxRef("XRWebGLLayer")}} từ đó hệ thống tổng hợp của trình duyệt lấy hình ảnh cho phiên XR.
- {{DOMxRef("XRRenderState.depthFar")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Khoảng cách, tính bằng mét, của **mặt phẳng clip xa** từ người xem. Mặt phẳng clip xa là mặt phẳng song song với màn hình mà sau đó việc kết xuất cảnh không còn diễn ra nữa. Về cơ bản, điều này chỉ định khoảng cách tối đa người dùng có thể thấy.
- {{DOMxRef("XRRenderState.depthNear")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Khoảng cách, tính bằng mét, của **mặt phẳng clip gần** từ người xem. Mặt phẳng clip gần là mặt phẳng song song với màn hình, tại đó việc kết xuất cảnh bắt đầu. Bất kỳ thứ gì gần người xem hơn điều này đều không được vẽ.
- {{DOMxRef("XRRenderState.inlineVerticalFieldOfView")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trường nhìn dọc mặc định, được định nghĩa bằng radian, để sử dụng khi phiên ở chế độ `inline`. `null` cho tất cả các phiên immersive.
- {{DOMxRef("XRRenderState.layers")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một mảng có thứ tự chứa các đối tượng {{domxref("XRLayer")}} được hiển thị bởi compositor XR.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("XRSession.renderState")}}
- {{DOMxRef("XRSession.updateRenderState()")}}
- {{DOMxRef("XRSystem.requestSession", "navigator.xr.requestSession()")}}
