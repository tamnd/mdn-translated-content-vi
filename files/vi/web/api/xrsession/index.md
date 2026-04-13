---
title: XRSession
slug: Web/API/XRSession
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRSession
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRSession`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) biểu diễn một phiên XR đang diễn ra, cung cấp các phương thức và thuộc tính được sử dụng để tương tác và điều khiển phiên. Để mở một phiên WebXR, hãy sử dụng phương thức {{domxref("XRSystem.requestSession", "requestSession()")}} của giao diện {{domxref("XRSystem")}}.

Với các phương thức của `XRSession`, bạn có thể thăm dò vị trí và hướng của người xem ({{domxref("XRViewerPose")}}), thu thập thông tin về môi trường của người dùng và hiển thị hình ảnh cho người dùng. `XRSession` hỗ trợ cả chế độ nội tuyến và chế độ thực tế ảo/thực tế tăng cường nhập vai.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Ngoài các thuộc tính được liệt kê bên dưới, `XRSession` kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{DOMxRef("XRSession.depthDataFormat", "depthDataFormat")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về định dạng dữ liệu cảm biến độ sâu mà phiên đã được cấu hình.
- {{DOMxRef("XRSession.depthUsage", "depthUsage")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về cách sử dụng cảm biến độ sâu mà phiên đã được cấu hình.
- {{DOMxRef("XRSession.domOverlayState", "domOverlayState")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Cung cấp thông tin về lớp phủ DOM, nếu tính năng được bật.
- {{DOMxRef("XRSession.enabledFeatures", "enabledFeatures")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về một mảng các [tính năng phiên](/en-US/docs/Web/API/XRSystem/requestSession#session_features) đã được cấp phép.
- {{DOMxRef("XRSession.environmentBlendMode", "environmentBlendMode")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về chế độ hòa trộn của phiên này, cho biết mức độ hiển thị của môi trường thực tế qua thiết bị XR và cách thiết bị sẽ hòa trộn hình ảnh thiết bị với môi trường thực.
- {{DOMxRef("XRSession.inputSources", "inputSources")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về danh sách các {{DOMxRef("XRInputSource")}} của phiên này, mỗi cái biểu diễn một thiết bị đầu vào được sử dụng để điều khiển camera và/hoặc cảnh.
- {{DOMxRef("XRSession.interactionMode", "interactionMode")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về chế độ tương tác của phiên này, mô tả không gian tốt nhất (theo tác nhân người dùng) để ứng dụng vẽ giao diện người dùng tương tác cho phiên hiện tại.
- {{DOMxRef("XRSession.preferredReflectionFormat", "preferredReflectionFormat")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về định dạng phản chiếu ưa thích của phiên này được sử dụng cho dữ liệu texture ước tính ánh sáng.
- {{DOMxRef("XRSession.renderState", "renderState")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRRenderState")}} chứa các tùy chọn ảnh hưởng đến cách hình ảnh được kết xuất. Điều này bao gồm các mặt phẳng cắt gần và xa (các khoảng cách xác định vật thể có thể gần và xa đến đâu và vẫn được kết xuất), cũng như thông tin về trường nhìn.
- {{DOMxRef("XRSession.visibilityState", "visibilityState")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết hình ảnh của phiên có hiển thị cho người dùng hay không và nếu có, liệu nó có đang hiển thị nhưng không phải là mục tiêu của sự kiện người dùng hiện tại.

## Phương thức thể hiện

_Ngoài các phương thức kế thừa từ giao diện cha {{domxref("EventTarget")}}, `XRSession` cung cấp các phương thức sau._

- {{DOMxRef("XRSession.cancelAnimationFrame", "cancelAnimationFrame()")}} {{Experimental_Inline}}
  - : Xóa một callback khỏi tập hợp các callback kết xuất khung hình của `XRSession`, dựa trên giá trị định danh duy nhất được trả về bởi lệnh gọi {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} trước đó.
- {{DOMxRef("XRSession.end", "end()")}} {{Experimental_Inline}}
  - : Kết thúc phiên WebXR. Trả về một {{jsxref("promise")}} sẽ được resolve khi phiên đã được tắt hoàn toàn.
- {{DOMxRef("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} {{Experimental_Inline}}
  - : Lên lịch phương thức được chỉ định để được gọi lần tiếp theo khi {{glossary("user agent")}} đang thực hiện kết xuất một khung hình hoạt ảnh cho thiết bị WebXR. Trả về một giá trị số nguyên có thể được sử dụng để xác định yêu cầu nhằm mục đích hủy callback bằng `cancelAnimationFrame()`. Phương thức này có thể so sánh với phương thức {{domxref("Window.requestAnimationFrame()")}}.
- {{DOMxRef("XRSession.requestHitTestSource", "requestHitTestSource()")}} {{Experimental_Inline}}
  - : Yêu cầu một đối tượng {{domxref("XRHitTestSource")}} xử lý việc đăng ký kiểm tra va chạm.
- {{DOMxRef("XRSession.requestHitTestSourceForTransientInput", "requestHitTestSourceForTransientInput()")}} {{Experimental_Inline}}
  - : Yêu cầu một đối tượng {{domxref("XRTransientInputHitTestSource")}} xử lý việc đăng ký kiểm tra va chạm cho nguồn đầu vào tạm thời.
- {{DOMxRef("XRSession.requestLightProbe", "requestLightProbe()")}} {{Experimental_Inline}}
  - : Yêu cầu một {{domxref("XRLightProbe")}} ước tính thông tin ánh sáng tại một điểm nhất định trong môi trường của người dùng.
- {{DOMxRef("XRSession.requestReferenceSpace", "requestReferenceSpace()")}} {{Experimental_Inline}}
  - : Yêu cầu tạo một {{domxref("XRReferenceSpace")}} mới có kiểu được chỉ định. Trả về một promise sẽ resolve với `XRReferenceSpace` hoặc {{domxref("XRBoundedReferenceSpace")}} đã được yêu cầu, hoặc ném ra một {{domxref("DOMException")}} `NotSupportedError` nếu kiểu không gian được yêu cầu không được thiết bị hỗ trợ.
- {{DOMxRef("XRSession.updateRenderState", "updateRenderState()")}} {{Experimental_Inline}}
  - : Cập nhật các thuộc tính của trạng thái kết xuất phiên.

## Sự kiện

_Các sự kiện sau được gửi đến các đối tượng `XRSession`._

- {{domxref("XRSession.end_event", "end")}} {{Experimental_Inline}}
  - : Được gửi đến đối tượng `XRSession` sau khi phiên WebXR đã kết thúc và tất cả các hàm liên quan đến phần cứng đã hoàn tất. Sự kiện được biểu diễn bởi một đối tượng loại {{domxref("XRSessionEvent")}}. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onend`.
- {{domxref("XRSession.inputsourceschange_event", "inputsourceschange")}} {{Experimental_Inline}}
  - : Một sự kiện loại {{domxref("XRInputSourcesChangeEvent")}} được gửi đến `XRSession` khi danh sách các nguồn đầu vào XR đang hoạt động đã thay đổi. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `oninputsourceschange`.
- {{domxref("XRSession.select_event", "select")}} {{Experimental_Inline}}
  - : Một sự kiện loại {{domxref("XRInputSourceEvent")}} được gửi đến phiên khi một trong các nguồn đầu vào của phiên đã hoàn thành thành công một [hành động chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_action). Điều này thường tương ứng với việc người dùng nhấn cò, bàn di chuột hoặc nút, nói lệnh hoặc thực hiện một cử chỉ có thể nhận dạng. Sự kiện `select` được gửi sau sự kiện `selectstart` và ngay trước sự kiện `selectend`. Nếu `select` _không_ được gửi, thì hành động chọn đã bị hủy bỏ trước khi hoàn tất. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onselect`.
- {{domxref("XRSession.selectend_event", "selectend")}} {{Experimental_Inline}}
  - : Một sự kiện loại {{domxref("XRInputSourceEvent")}} được gửi đến đối tượng phiên khi một trong các thiết bị đầu vào của nó kết thúc hành động chính hoặc bị ngắt kết nối trong quá trình xử lý hành động chính. Ví dụ: đối với các hành động nút hoặc cò, điều này có nghĩa là nút đã được thả ra; đối với các lệnh nói, điều này có nghĩa là người dùng đã nói xong. Đây là sự kiện cuối cùng trong ba sự kiện `select*` được gửi. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onselectend`.
- {{domxref("XRSession.selectstart_event", "selectstart")}} {{Experimental_Inline}}
  - : Một sự kiện loại {{domxref("XRInputSourceEvent")}} được gửi đến đối tượng phiên khi một trong các thiết bị đầu vào của nó lần đầu tiên được người dùng kích hoạt theo cách gây ra bắt đầu hành động chính. Đây là sự kiện `session*` đầu tiên được gửi. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onselectstart`.
- {{domxref("XRSession.squeeze_event", "squeeze")}} {{Experimental_Inline}}
  - : Một {{domxref("XRInputSourceEvent")}} được gửi để cho biết rằng một [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action) đã hoàn thành thành công. Điều này cho biết thiết bị đang bị bóp đã được thả ra và có thể biểu thị việc thả một đối tượng đã nắm, ví dụ. Nó được gửi ngay trước sự kiện `squeezeend` để cho biết rằng hành động bóp đã kết thúc. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onsqueeze`.
- {{domxref("XRSession.squeezeend_event", "squeezeend")}} {{Experimental_Inline}}
  - : Một {{domxref("XRInputSourceEvent")}} được gửi đến `XRSession` khi [hành động bóp chính](/en-US/docs/Web/API/WebXR_Device_API/Inputs#primary_squeeze_action) kết thúc, bất kể hành động có thành công hay không. Cũng có sẵn bằng cách sử dụng thuộc tính trình xử lý sự kiện `onsqueezeend`.
- {{domxref("XRSession.squeezestart_event", "squeezestart")}} {{Experimental_Inline}}
  - : Một sự kiện loại {{domxref("XRInputSourceEvent")}} được gửi đến `XRSession` khi người dùng bắt đầu bóp một bộ điều khiển có thể bóp. Đây có thể là, ví dụ, một cò được sử dụng để biểu thị việc nắm bắt đối tượng, hoặc có thể biểu thị việc bóp thực tế khi đeo găng xúc giác. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onsqueezestart`.
- {{domxref("XRSession.visibilitychange_event", "visibilitychange")}} {{Experimental_Inline}}
  - : Một {{domxref("XRSessionEvent")}} được gửi đến phiên khi trạng thái hiển thị của nó được chỉ định bởi {{domxref("XRSession.visibilityState", "visibilityState")}} thay đổi. Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onvisibilitychange`.

## Ví dụ

Ví dụ này thiết lập một `XRSession` mới ở chế độ `inline` để nó có thể được hiển thị trong một phần tử HTML, tránh nhu cầu sử dụng thiết bị xem AR hoặc VR chuyên dụng như kính thực tế ảo.

```js
const XR = navigator.xr;

if (XR) {
  XR.requestSession("inline").then((xrSession) => {
    xrSession.requestReferenceSpace("local").then((xrReferenceSpace) => {
      xrSession.requestAnimationFrame((time, xrFrame) => {
        const viewer = xrFrame.getViewerPose(xrReferenceSpace);

        gl.bindFramebuffer(xrWebGLLayer.framebuffer);

        for (const xrView of viewer.views) {
          const xrViewport = xrWebGLLayer.getViewport(xrView);
          gl.viewport(
            xrViewport.x,
            xrViewport.y,
            xrViewport.width,
            xrViewport.height,
          );
        }
      });
    });
  });
} else {
  /* WebXR is not available */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
