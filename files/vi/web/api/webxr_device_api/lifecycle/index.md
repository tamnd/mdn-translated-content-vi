---
title: WebXR application life cycle
slug: Web/API/WebXR_Device_API/Lifecycle
page-type: guide
---

{{DefaultAPISidebar("WebXR Device API")}}

Trong hướng dẫn này, chúng ta sẽ có cái nhìn tổng quan từ trên cao về những gì liên quan đến việc tạo và điều khiển một ứng dụng WebXR, mà không đi xuống chi tiết ở mức mã. Điều này là phần chuẩn bị cho vài bài viết tiếp theo trong loạt hướng dẫn WebXR, gồm [khởi động và tắt](/en-US/docs/Web/API/WebXR_Device_API/Startup_and_shutdown) một phiên WebXR, [hình học](/en-US/docs/Web/API/WebXR_Device_API/Geometry), [mô phỏng camera](/en-US/docs/Web/API/WebXR_Device_API/Cameras), [theo dõi không gian](/en-US/docs/Web/API/WebXR_Device_API/Spatial_tracking), và nhiều nội dung khác.

## Life cycle outline

Phần lớn ứng dụng dùng WebXR sẽ theo một mẫu thiết kế tổng thể tương tự:

1. Kiểm tra xem thiết bị và trình duyệt của người dùng có đủ khả năng trình bày trải nghiệm XR mà bạn muốn cung cấp hay không.
   1. Đảm bảo WebXR API khả dụng; nếu {{domxref("navigator.xr")}} là `undefined`, bạn có thể giả định rằng trình duyệt và/hoặc thiết bị của người dùng không hỗ trợ WebXR. Nếu không được hỗ trợ, hãy vô hiệu hóa mọi giao diện dùng để kích hoạt tính năng XR và hủy mọi thử cố vào chế độ XR.
   2. Gọi {{DOMxRef("XRSystem/isSessionSupported","navigator.xr.isSessionSupported()")}}, chỉ định chế độ trải nghiệm WebXR bạn muốn cung cấp: `inline`, `immersive-vr`, hoặc `immersive-ar`, để xác định kiểu phiên bạn muốn có khả dụng hay không.
   3. Nếu kiểu phiên bạn muốn dùng khả dụng, hãy cung cấp giao diện phù hợp cho người dùng để họ có thể kích hoạt nó.

2. Khi người dùng yêu cầu kích hoạt chức năng WebXR bằng cách tương tác với giao diện ở trên, hãy yêu cầu một {{DOMxRef("XRSession")}} bằng chế độ mong muốn. Việc này được thực hiện bằng cách gọi {{DOMxRef("XRSystem/requestSession","navigator.xr.requestSession()")}}, cũng chỉ định chuỗi biểu thị chế độ bạn muốn bật: `inline`, `immersive-vr`, hoặc `immersive-ar`.
3. Nếu promise do `requestSession()` trả về được resolve, hãy dùng {{domxref("XRSession")}} mới để quản lý phiên WebXR trong suốt thời gian trải nghiệm WebXR. Điều này sẽ bao gồm việc quản lý đầu vào, hoạt ảnh và kết xuất.
   1. Gọi phương thức {{domxref("XRSession")}} {{DOMxRef("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} để lên lịch kết xuất khung hình đầu tiên cho thiết bị XR.
   2. Nếu cảnh của bạn phức tạp, bạn nên cân nhắc tạo một {{domxref("Worker")}} hoặc dùng một worker bạn đã tạo trước đó cho mục đích này để thực hiện các phép tính cần thiết cho từng khung hình. Điều này sẽ giảm khả năng quá trình kết xuất làm ứng dụng bị khựng thấy rõ.
   3. Mỗi callback `requestAnimationFrame()` nên dùng thông tin về các đối tượng nằm trong thế giới 3D để kết xuất khung hình bằng WebGL.
   4. Mỗi lần callback được gọi, nó nên gọi lại {{DOMxRef("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} để báo cho trình duyệt biết rằng callback cần được chạy lại khi đến lúc kết xuất khung hình tiếp theo.

4. Khi đến lúc cần dừng (chẳng hạn khi người dùng thoát ứng dụng hoặc rời khỏi trang), hãy kết thúc phiên XR; nếu không, tiếp tục vòng lặp cho đến khi người dùng chọn thoát chế độ XR.
   1. Để tự kết thúc phiên XR, hãy gọi {{DOMxRef("XRSession.end", "XRSession.end()")}}.
   2. Thêm một trình xử lý cho sự kiện {{domxref("XRSession")}} {{domxref("XRSession.end_event", "end")}} để được thông báo khi phiên đang kết thúc, bất kể việc kết thúc được khởi tạo bởi mã của bạn, người dùng hay trình duyệt.
