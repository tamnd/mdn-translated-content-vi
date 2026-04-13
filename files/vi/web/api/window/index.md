---
title: Window
slug: Web/API/Window
page-type: web-api-interface
browser-compat: api.Window
---

{{APIRef("DOM")}}

Giao diện **`Window`** đại diện cho một cửa sổ chứa một tài liệu {{glossary("DOM")}}; thuộc tính `document` trỏ đến [tài liệu DOM](/en-US/docs/Web/API/Document) được tải trong cửa sổ đó.

Bạn có thể lấy một cửa sổ cho tài liệu hiện tại bằng thuộc tính {{domxref("document.defaultView")}}.

Một biến toàn cục, `window`, đại diện cho cửa sổ mà mã đang chạy, được bộc lộ cho mã JavaScript.

Giao diện `Window` là nơi chứa nhiều hàm, không gian tên, đối tượng và hàm tạo, không nhất thiết gắn trực tiếp với khái niệm cửa sổ giao diện người dùng. Tuy vậy, `Window` là một nơi phù hợp để đặt những phần tử cần có sẵn ở phạm vi toàn cục. Nhiều phần trong số đó được mô tả trong [Tài liệu tham chiếu JavaScript](/en-US/docs/Web/JavaScript/Reference) và [Tài liệu tham chiếu DOM](/en-US/docs/Web/API/Document_Object_Model).

Trong trình duyệt theo thẻ, mỗi thẻ được biểu diễn bởi một đối tượng `Window` riêng; `window` toàn cục mà mã JavaScript trong một thẻ nhìn thấy luôn đại diện cho chính thẻ đó. Dù vậy, ngay cả trong trình duyệt theo thẻ, một số thuộc tính và phương thức vẫn áp dụng cho toàn bộ cửa sổ chứa thẻ, chẳng hạn như {{Domxref("Window.resizeTo", "resizeTo()")}} và {{Domxref("Window.innerHeight", "innerHeight")}}. Nói chung, bất cứ thứ gì không thể hợp lý gắn với một thẻ thì sẽ gắn với cửa sổ.

{{InheritanceDiagram}}

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ {{domxref("EventTarget")}}._

Lưu ý rằng các thuộc tính là đối tượng (ví dụ để ghi đè prototype của các phần tử dựng sẵn) được liệt kê ở một phần riêng bên dưới.

- {{domxref("Window.caches")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("CacheStorage")}} gắn với ngữ cảnh hiện tại. Đối tượng này cho phép lưu tài nguyên để dùng khi ngoại tuyến và tạo phản hồi tùy biến cho các yêu cầu.
- {{domxref("Window.navigator", "Window.clientInformation")}} {{ReadOnlyInline}}
  - : Một bí danh của {{domxref("Window.navigator")}}.
- {{domxref("Window.closed")}} {{ReadOnlyInline}}
  - : Cho biết cửa sổ hiện tại đã được đóng hay chưa.
- {{domxref("Window.cookieStore")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về tham chiếu đến đối tượng {{domxref("CookieStore")}} cho ngữ cảnh tài liệu hiện tại.
- {{domxref("Window.credentialless")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị boolean cho biết tài liệu hiện tại có được tải bên trong một {{htmlelement("iframe")}} credentialless hay không. Xem thêm [IFrame credentialless](/en-US/docs/Web/HTTP/Guides/IFrame_credentialless).
- {{domxref("Window.crossOriginIsolated")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết trang web có đang ở trạng thái cô lập theo nguồn gốc hay không.
- {{domxref("Window.crypto")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Crypto")}} gắn với đối tượng toàn cục.
- {{domxref("Window.customElements")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến đối tượng {{domxref("CustomElementRegistry")}}, có thể dùng để đăng ký [phần tử tùy biến](/en-US/docs/Web/API/Web_components/Using_custom_elements) mới và lấy thông tin về các phần tử đã đăng ký trước đó.
- {{domxref("Window.devicePixelRatio")}} {{ReadOnlyInline}}
  - : Trả về tỉ lệ giữa pixel vật lý và pixel độc lập theo thiết bị trên màn hình hiện tại.
- {{domxref("Window.document")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến tài liệu mà cửa sổ đang chứa.
- {{domxref("Window.documentPictureInPicture")}} {{ReadOnlyInline}} {{experimental_inline}} {{SecureContext_Inline}}
  - : Trả về tham chiếu đến cửa sổ [document Picture-in-Picture](/en-US/docs/Web/API/Document_Picture-in-Picture_API) của ngữ cảnh tài liệu hiện tại.
- {{domxref("Window.fence")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một thể hiện đối tượng {{domxref("Fence")}} cho ngữ cảnh tài liệu hiện tại. Chỉ có sẵn cho các tài liệu được nhúng bên trong {{htmlelement("fencedframe")}}.
- {{domxref("Window.frameElement")}} {{ReadOnlyInline}}
  - : Trả về phần tử trong đó cửa sổ được nhúng, hoặc null nếu cửa sổ không được nhúng.
- {{domxref("Window.frames")}} {{ReadOnlyInline}}
  - : Trả về một mảng các khung con trong cửa sổ hiện tại.
- {{domxref("Window.fullScreen")}} {{Non-standard_Inline}}
  - : Cho biết cửa sổ có đang được hiển thị ở chế độ toàn màn hình hay không.
- {{domxref("Window.history")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến đối tượng history.
- {{domxref("Window.indexedDB")}} {{ReadOnlyInline}}
  - : Cung cấp cơ chế để ứng dụng truy cập bất đồng bộ các khả năng của cơ sở dữ liệu được lập chỉ mục; trả về đối tượng {{domxref("IDBFactory")}}.
- {{domxref("Window.innerHeight")}} {{ReadOnlyInline}}
  - : Lấy chiều cao của vùng nội dung của cửa sổ trình duyệt, bao gồm cả thanh cuộn ngang nếu được hiển thị.
- {{domxref("Window.innerWidth")}} {{ReadOnlyInline}}
  - : Lấy chiều rộng của vùng nội dung của cửa sổ trình duyệt, bao gồm cả thanh cuộn dọc nếu được hiển thị.
- {{domxref("Window.isSecureContext")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết ngữ cảnh hiện tại có an toàn (`true`) hay không (`false`).
- {{domxref("Window.launchQueue")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Khi một [ứng dụng web tiến bộ](/en-US/docs/Web/Progressive_web_apps) (PWA) được khởi chạy với giá trị `client_mode` của [`launch_handler`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/launch_handler) là `focus-existing`, `navigate-new`, hoặc `navigate-existing`, `launchQueue` cung cấp truy cập đến lớp {{domxref("LaunchQueue")}}, cho phép triển khai xử lý điều hướng khởi chạy tùy biến cho PWA.
- {{domxref("Window.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng khung trong cửa sổ. Xem thêm {{domxref("window.frames")}}.
- {{domxref("Window.localStorage")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến đối tượng lưu trữ cục bộ dùng để lưu dữ liệu chỉ có thể được truy cập bởi nguồn gốc đã tạo ra nó.
- {{domxref("Window.location")}}
  - : Lấy/đặt vị trí, hoặc URL hiện tại, của đối tượng cửa sổ.
- {{domxref("Window.locationbar")}} {{ReadOnlyInline}}
  - : Trả về đối tượng locationbar.
- {{domxref("Window.menubar")}} {{ReadOnlyInline}}
  - : Trả về đối tượng menubar.
- {{domxref("Window.mozInnerScreenX")}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về tọa độ ngang (X) của góc trên bên trái của vùng nhìn thấy của cửa sổ, theo hệ tọa độ màn hình. Giá trị này được báo cáo bằng pixel CSS.
- {{domxref("Window.mozInnerScreenY")}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về tọa độ dọc (Y) của góc trên bên trái của vùng nhìn thấy của cửa sổ, theo hệ tọa độ màn hình. Giá trị này được báo cáo bằng pixel CSS.
- {{domxref("Window.name")}}
  - : Lấy/đặt tên của cửa sổ.
- {{domxref("Window.navigation")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Navigation")}} gắn với `window` hiện tại. Đây là điểm vào của [Navigation API](/en-US/docs/Web/API/Navigation_API).
- {{domxref("Window.navigator")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến đối tượng navigator.
- {{domxref("Window.opener")}}
  - : Trả về tham chiếu đến cửa sổ đã mở cửa sổ hiện tại này.
- {{domxref("Window.origin")}} {{ReadOnlyInline}}
  - : Trả về origin của đối tượng toàn cục, được tuần tự hóa thành chuỗi.
- {{domxref("Window.originAgentCluster")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu cửa sổ này thuộc về một cụm tác tử được khóa theo origin.
- {{domxref("Window.outerHeight")}} {{ReadOnlyInline}}
  - : Trả về chiều cao của phần hiển thị bên ngoài của cửa sổ.
- {{domxref("Window.outerWidth")}} {{ReadOnlyInline}}
  - : Trả về chiều rộng của phần hiển thị bên ngoài của cửa sổ.
- {{domxref("Window.parent")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến cửa sổ cha.
- {{domxref("Window.performance")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Performance")}} cho phép đo thời gian và hiệu năng.
- {{domxref("Window.personalbar")}} {{ReadOnlyInline}}
  - : Trả về đối tượng personalbar.
- {{domxref("Window.screen")}} {{ReadOnlyInline}}
  - : Trả về đối tượng screen.
- {{domxref("Window.screenX")}} và {{domxref("Window.screenLeft")}} {{ReadOnlyInline}}
  - : Cả hai thuộc tính đều trả về khoảng cách theo chiều ngang từ mép trái của vùng nhìn thấy của trình duyệt đến cạnh trái của màn hình.
- {{domxref("Window.screenY")}} và {{domxref("Window.screenTop")}} {{ReadOnlyInline}}
  - : Cả hai thuộc tính đều trả về khoảng cách theo chiều dọc từ mép trên của vùng nhìn thấy của trình duyệt đến cạnh trên của màn hình.
- {{domxref("Window.scrollbars")}} {{ReadOnlyInline}}
  - : Trả về đối tượng scrollbars.
- {{domxref("Window.scrollMaxX")}} {{Non-standard_Inline}} {{ReadOnlyInline}}
  - : Độ lệch tối đa mà cửa sổ có thể cuộn theo chiều ngang, tức là chiều rộng tài liệu trừ chiều rộng khung nhìn.
- {{domxref("Window.scrollMaxY")}} {{Non-standard_Inline}} {{ReadOnlyInline}}
  - : Độ lệch tối đa mà cửa sổ có thể cuộn theo chiều dọc, tức là chiều cao tài liệu trừ chiều cao khung nhìn.
- {{domxref("Window.scrollX")}} {{ReadOnlyInline}}
  - : Trả về số pixel mà tài liệu đã được cuộn theo chiều ngang.
- {{domxref("Window.scrollY")}} {{ReadOnlyInline}}
  - : Trả về số pixel mà tài liệu đã được cuộn theo chiều dọc.
- {{domxref("Window.self")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến chính đối tượng window.
- {{domxref("Window.sessionStorage")}}
  - : Trả về tham chiếu đến đối tượng lưu trữ phiên dùng để lưu dữ liệu chỉ có thể được truy cập bởi nguồn gốc đã tạo ra nó.
- {{domxref("Window.sharedStorage")}} {{ReadOnlyInline}} {{SecureContext_Inline}} {{deprecated_inline}}
  - : Trả về đối tượng {{domxref("WindowSharedStorage")}} cho origin hiện tại. Đây là điểm vào chính để ghi dữ liệu vào shared storage bằng [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API).
- {{domxref("Window.speechSynthesis")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("SpeechSynthesis")}}, là điểm vào để dùng chức năng tổng hợp giọng nói của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API).
- {{domxref("Window.statusbar")}} {{ReadOnlyInline}}
  - : Trả về đối tượng statusbar.
- {{domxref("Window.toolbar")}} {{ReadOnlyInline}}
  - : Trả về đối tượng toolbar.
- {{domxref("Window.top")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến cửa sổ cao nhất trong hệ thống phân cấp cửa sổ. Thuộc tính này chỉ đọc.
- {{domxref("Window.trustedTypes")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("TrustedTypePolicyFactory")}} gắn với đối tượng toàn cục, cung cấp điểm vào để dùng {{domxref("Trusted Types API", "", "", "nocode")}}.
- {{domxref("Window.viewport")}} {{Experimental_inline}} {{ReadOnlyInline}}
  - : Trả về một thể hiện đối tượng {{domxref("Viewport")}}, cung cấp thông tin về trạng thái hiện tại của khung nhìn thiết bị.
- {{domxref("Window.visualViewport")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("VisualViewport")}} đại diện cho khung nhìn trực quan của một cửa sổ.
- {{domxref("Window.window")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến cửa sổ hiện tại.
- `window[0]`, `window[1]`, v.v.
  - : Trả về tham chiếu đến đối tượng `window` trong các khung. Xem thêm {{domxref("Window.frames")}}.
- Thuộc tính có tên
  - : Một số phần tử trong tài liệu cũng được bộc lộ như thuộc tính của `window`:
    - Với mỗi phần tử {{HTMLElement("embed")}}, {{HTMLElement("form")}}, {{HTMLElement("iframe")}}, {{HTMLElement("img")}}, và {{HTMLElement("object")}}, tên `name` của nó (nếu không rỗng) sẽ được bộc lộ.
      Ví dụ, nếu tài liệu chứa `<form name="my_form">`, thì `window["my_form"]` (và tương đương `window.my_form`) trả về tham chiếu đến phần tử đó.
    - Với mỗi phần tử HTML, `id` của nó (nếu không rỗng) sẽ được bộc lộ.

    Nếu một thuộc tính tương ứng với một phần tử duy nhất, phần tử đó sẽ được trả về trực tiếp. Nếu một thuộc tính tương ứng với nhiều phần tử, thì một {{domxref("HTMLCollection")}} chứa tất cả chúng sẽ được trả về. Nếu bất kỳ phần tử nào là một `<iframe>` hoặc `<object>` có thể điều hướng, thì thay vào đó sẽ trả về {{domxref("HTMLIFrameElement/contentWindow", "contentWindow")}} của iframe đầu tiên như vậy.

### Thuộc tính đã lỗi thời

- {{domxref("Window.event")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về **sự kiện hiện tại**, tức là sự kiện đang được xử lý bởi ngữ cảnh mã JavaScript, hoặc `undefined` nếu hiện không có sự kiện nào đang được xử lý. Nên dùng trực tiếp đối tượng {{domxref("Event")}} được truyền đến các bộ xử lý sự kiện khi có thể.
- {{domxref("Window.external")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về một đối tượng với các hàm để thêm nhà cung cấp tìm kiếm bên ngoài cho trình duyệt.
- {{domxref("Window.orientation")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về hướng của khung nhìn theo độ, theo bước 90 độ, tương đối với hướng tự nhiên của thiết bị.
- {{domxref("Window.status")}} {{Deprecated_Inline}}
  - : Lấy/đặt văn bản trong statusbar ở cuối trình duyệt.

## Phương thức instance

_Giao diện này kế thừa các phương thức từ {{domxref("EventTarget")}}._

- {{domxref("Window.atob()")}}
  - : Giải mã một chuỗi dữ liệu đã được mã hóa bằng base-64.
- {{domxref("Window.alert()")}}
  - : Hiển thị hộp thoại cảnh báo.
- {{domxref("Window.blur()")}} {{deprecated_inline}}
  - : Đưa tiêu điểm ra khỏi cửa sổ.
- {{domxref("Window.btoa()")}}
  - : Tạo một chuỗi ASCII được mã hóa base-64 từ một chuỗi dữ liệu nhị phân.
- {{domxref("Window.cancelAnimationFrame()")}}
  - : Cho phép hủy một callback đã được lên lịch trước đó với {{domxref("Window.requestAnimationFrame")}}.
- {{domxref("Window.cancelIdleCallback()")}}
  - : Cho phép hủy một callback đã được lên lịch trước đó với {{domxref("Window.requestIdleCallback")}}.
- {{domxref("Window.clearInterval()")}}
  - : Hủy việc thực thi lặp lại đã được thiết lập bằng {{domxref("Window.setInterval()")}}.
- {{domxref("Window.clearTimeout()")}}
  - : Hủy việc thực thi trì hoãn đã được thiết lập bằng {{domxref("Window.setTimeout()")}}.
- {{domxref("Window.close()")}}
  - : Đóng cửa sổ hiện tại.
- {{domxref("Window.confirm()")}}
  - : Hiển thị một hộp thoại với thông điệp mà người dùng cần phản hồi.
- {{domxref("Window.createImageBitmap()")}}
  - : Nhận vào nhiều loại nguồn ảnh khác nhau và trả về một {{jsxref("Promise")}} sẽ được giải quyết thành một {{domxref("ImageBitmap")}}. Tùy chọn, nguồn có thể được cắt theo hình chữ nhật pixel bắt đầu tại _(sx, sy)_ với chiều rộng sw và chiều cao sh.
- {{domxref("Window.dump()")}} {{Non-standard_Inline}}
  - : Ghi một thông điệp ra console.
- {{domxref("Window.fetch()")}}
  - : Bắt đầu quá trình lấy một tài nguyên từ mạng.
- {{domxref("Window.fetchLater()")}} {{experimental_inline}}
  - : Tạo một yêu cầu fetch trì hoãn, được gửi sau khi trang được điều hướng rời đi, hoặc sau khi hết thời gian `activateAfter` được cung cấp, tùy điều kiện nào đến trước.
- {{domxref("Window.find()")}} {{Non-standard_Inline}}
  - : Tìm một chuỗi cho trước trong cửa sổ.
- {{domxref("Window.focus()")}}
  - : Đặt tiêu điểm vào cửa sổ hiện tại.
- {{domxref("Window.getComputedStyle()")}}
  - : Lấy style tính toán cho phần tử được chỉ định. Style tính toán biểu thị các giá trị đã tính của tất cả thuộc tính CSS của phần tử.
- {{domxref("Window.getDefaultComputedStyle()")}} {{Non-standard_Inline}}
  - : Lấy style tính toán mặc định cho phần tử được chỉ định, bỏ qua stylesheet của tác giả.
- {{domxref("Window.getScreenDetails()")}} {{experimental_inline}} {{securecontext_inline}}
  - : Trả về một {{jsxref("Promise")}} sẽ hoàn tất với một thể hiện đối tượng {{domxref("ScreenDetails")}} đại diện cho thông tin về tất cả màn hình có sẵn của thiết bị người dùng.
- {{domxref("Window.getSelection()")}}
  - : Trả về đối tượng selection đại diện cho mục đã chọn.
- {{domxref("Window.matchMedia()")}}
  - : Trả về một đối tượng {{domxref("MediaQueryList")}} đại diện cho chuỗi truy vấn media đã chỉ định.
- {{domxref("Window.moveBy()")}}
  - : Di chuyển cửa sổ hiện tại theo một khoảng được chỉ định.
- {{domxref("Window.moveTo()")}}
  - : Di chuyển cửa sổ đến các tọa độ được chỉ định.
