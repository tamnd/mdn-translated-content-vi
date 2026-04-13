---
title: WebXR permissions and security
slug: Web/API/WebXR_Device_API/Permissions_and_security
page-type: guide
---

{{DefaultAPISidebar("WebXR Device API")}}

[WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) có nhiều khía cạnh bảo mật cần xử lý, từ việc thiết lập [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) đến việc đảm bảo người dùng thực sự có ý định sử dụng trình bày thực tế hỗn hợp trước khi kích hoạt nó. Trong số những việc khác, bạn cần xác nhận quyền truy cập vào các tính năng thiết bị như micrô và/hoặc camera, lấy quyền dùng chế độ VR nhập vai (nếu có), và các việc tương tự. Sự đa dạng của phần cứng và phần mềm liên quan đến XR kéo theo nhiều API và công nghệ cùng tham gia. Trong hướng dẫn này, chúng ta sẽ xem cách đảm bảo ứng dụng của bạn có đủ quyền cần thiết để cung cấp trải nghiệm XR an toàn và riêng tư.

WebXR Device API chịu sự kiểm soát của nhiều cơ chế về quyền và bảo mật. Chúng không quá nặng nề, nhưng rất đáng để lưu ý. Phần lớn các cơ chế này xoay quanh chế độ phiên `immersive-vr` đắm chìm hoàn toàn, nhưng cũng có những điều cần chú ý khi thiết lập một phiên AR.

## Immersive presentation of VR

Trước tiên, mọi yêu cầu kích hoạt chế độ `immersive-vr` sẽ bị từ chối nếu miền gửi yêu cầu không có quyền bật một phiên nhập vai. Quyền này đến từ [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) `xr-spatial-tracking`.

Khi kiểm tra đó đã qua, yêu cầu vào chế độ `immersive-vr` sẽ được cho phép nếu tất cả các điều sau đều đúng:

- Lời gọi `requestSession()` được phát ra bởi mã đang chạy trong trình xử lý của một sự kiện người dùng, hoặc từ mã khởi động của một [web application](/en-US/docs/Web/Progressive_web_apps) do người dùng khởi chạy.
- Tài liệu được xem là đáng tin cậy, tức là nó là tài liệu chịu trách nhiệm, hiện đang hoạt động và đang có focus.
- Ý định của người dùng khi vào chế độ VR nhập vai được hiểu rõ; xem [User intent](#user_intent) bên dưới để biết chi tiết.

Nếu tất cả điều đó đều đúng, promise do `requestSession()` trả về sẽ được resolve và đối tượng {{domxref("XRSession")}} mới sẽ được chuyển vào trình xử lý hoàn tất. Nếu không, một ngoại lệ thích hợp sẽ được ném ra, chẳng hạn `SecurityError` nếu tài liệu không có quyền vào chế độ nhập vai.

## Inline presentation

Khi bạn yêu cầu một {{domxref("XRSession")}} với chế độ `inline` và có tính năng nào đó được yêu cầu bắt buộc hoặc tùy chọn, trình duyệt sẽ chỉ cho phép tạo phiên nếu lời gọi {{domxref("XRSystem/requestSession", "requestSession()")}} được thực hiện bởi mã đang chạy rõ ràng dựa trên **ý định của người dùng**.

Specifically:

- Nếu lời gọi `requestSession()` không đến từ trình xử lý được thực thi để đáp lại một sự kiện người dùng và cũng không được phát ra trong lúc khởi chạy một web application, yêu cầu sẽ bị từ chối và `false` sẽ được đưa tới trình xử lý hoàn tất của promise.
- Nếu tài liệu đưa ra yêu cầu không phải là tài liệu chịu trách nhiệm cho script, yêu cầu sẽ bị từ chối.
- Nếu tài liệu đưa ra yêu cầu không đáng tin cậy, yêu cầu sẽ bị từ chối và `false` sẽ được trả về qua quy trình hoàn tất của promise. Một tài liệu đáng tin cậy là tài liệu vừa chịu trách nhiệm vừa đang hoạt động và hiện có focus.
- Nếu ý định của người dùng khi mở một bản trình bày XR inline không được hiểu rõ, yêu cầu sẽ bị từ chối. Việc hiểu [ý định của người dùng](#user_intent) có thể là ngầm định hoặc tường minh.

> [!NOTE]
> Có thể phát sinh thêm các yêu cầu do các tính năng cụ thể được đối tượng tùy chọn yêu cầu khi gọi `requestSession()`.

## User intent

**Ý định của người dùng** là khái niệm chỉ việc một hành động do mã thực hiện có phải được thực hiện vì điều người dùng muốn làm hay không. Có hai kiểu ý định của người dùng: **ngầm định** và **tường minh**.

**Ý định người dùng tường minh** (sự đồng ý tường minh của người dùng) được cấp khi người dùng đã được hỏi cụ thể và trực tiếp về quyền thực hiện một hành động.

**Ý định người dùng ngầm định** (sự đồng ý ngầm định của người dùng) được giả định nếu rơi vào một trong các trường hợp sau:

- Người dùng đã tương tác với tài liệu theo cách nào đó và hành động đó làm cho yêu cầu của bạn xảy ra. Ví dụ, nếu bạn có nút "Enter XR mode" và người dùng nhấn vào nó, việc gọi `requestSession()` từ trình xử lý sự kiện {{domxref("Element.click_event", "click")}} của nút sẽ được phép.
- Nếu mã của bạn đang chạy trong lúc khởi chạy một web application, runtime có thể xem hành động khởi chạy ứng dụng web là ý định của người dùng.
