---
title: SVGSVGElement
slug: Web/API/SVGSVGElement
page-type: web-api-interface
browser-compat: api.SVGSVGElement
---

{{APIRef("SVG")}}

Giao diện **`SVGSVGElement`** cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("svg")}}, cũng như các phương thức để thao tác với chúng. Giao diện này còn chứa nhiều phương thức tiện ích thường dùng khác, chẳng hạn như các phép toán ma trận và khả năng kiểm soát thời điểm vẽ lại trên các thiết bị hiển thị trực quan.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGSVGElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("svg")}} đã cho.
- {{domxref("SVGSVGElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("svg")}} đã cho.
- {{domxref("SVGSVGElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("svg")}} đã cho.
- {{domxref("SVGSVGElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("svg")}} đã cho.
- {{domxref("SVGSVGElement.viewBox")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedRect")}} tương ứng với thuộc tính {{SVGAttr("viewBox")}} của phần tử {{SVGElement("svg")}} đã cho.
- {{domxref("SVGSVGElement.preserveAspectRatio")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedPreserveAspectRatio")}} tương ứng với thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử {{SVGElement("svg")}} đã cho.
- {{domxref("SVGSVGElement.pixelUnitToMillimeterX")}} {{Deprecated_Inline}}
  - : Một số thực (float) biểu thị kích thước của đơn vị pixel (theo định nghĩa của CSS2) theo trục x của khung nhìn, nằm trong khoảng từ 70dpi đến 120dpi, và trên các hệ thống hỗ trợ, có thể khớp với đặc điểm của phương tiện đích. Trên các hệ thống không thể biết kích thước pixel, một giá trị mặc định phù hợp sẽ được cung cấp.
- {{domxref("SVGSVGElement.pixelUnitToMillimeterY")}} {{Deprecated_Inline}}
  - : Một số thực biểu thị kích thước của một đơn vị pixel theo trục y của khung nhìn.
- {{domxref("SVGSVGElement.screenPixelToMillimeterX")}} {{Deprecated_Inline}}
  - : Các sự kiện giao diện người dùng (UI) trong DOM Level 2 cho biết vị trí màn hình mà sự kiện UI đã xảy ra. Khi trình duyệt thực sự biết kích thước vật lý của "đơn vị màn hình", thuộc tính float này sẽ thể hiện thông tin đó; nếu không, tác nhân người dùng sẽ cung cấp giá trị mặc định phù hợp (chẳng hạn như `.28mm`).
- {{domxref("SVGSVGElement.screenPixelToMillimeterY")}} {{Deprecated_Inline}}
  - : Kích thước tương ứng của một pixel màn hình theo trục y của khung nhìn.
- {{domxref("SVGSVGElement.useCurrentView")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Chế độ xem ban đầu (tức là trước khi phóng to và di chuyển) của mảnh tài liệu SVG trong cùng hiện tại có thể là chế độ xem "chuẩn" (dựa trên các thuộc tính của phần tử {{SVGElement("svg")}} như {{SVGAttr("viewBox")}}) hoặc chế độ xem "tùy chỉnh" (siêu liên kết đến một {{SVGElement("view")}} hoặc phần tử cụ thể khác). Nếu chế độ xem ban đầu là "chuẩn", thuộc tính này là `false`. Nếu là "tùy chỉnh", thuộc tính này là `true`.
- {{domxref("SVGSVGElement.currentView")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một {{domxref("SVGViewSpec")}} xác định chế độ xem ban đầu (tức là trước khi phóng to và di chuyển) của mảnh tài liệu SVG trong cùng hiện tại. Ý nghĩa phụ thuộc vào tình huống: Nếu chế độ xem ban đầu là chế độ "chuẩn", thì:
    - các giá trị của `viewBox`, `preserveAspectRatio` và `zoomAndPan` trong `currentView` sẽ khớp với giá trị của các thuộc tính DOM tương ứng trực tiếp trên `SVGSVGElement`
    - giá trị của `transform` trong `currentView` sẽ là `null`

    Nếu chế độ xem ban đầu là liên kết vào phần tử {{SVGElement("view")}}, thì:
    - các giá trị của `viewBox`, `preserveAspectRatio` và `zoomAndPan` trong `currentView` sẽ tương ứng với các thuộc tính của phần tử {{SVGElement("view")}} đã cho
    - giá trị của `transform` trong `currentView` sẽ là `null`

    Nếu chế độ xem ban đầu là liên kết vào một phần tử khác (tức là khác với {{SVGElement("view")}}), thì:
    - các giá trị của `viewBox`, `preserveAspectRatio` và `zoomAndPan` trong `currentView` sẽ khớp với giá trị của các thuộc tính DOM tương ứng trực tiếp trên `SVGSVGElement` cho phần tử {{SVGElement("svg")}} tổ tiên gần nhất
    - các giá trị của `transform` trong `currentView` sẽ là `null`

    Nếu chế độ xem ban đầu là liên kết vào mảnh tài liệu SVG bằng mã định danh mảnh đặc tả view SVG (tức là `#svgView(…)`), thì:
    - các giá trị của `viewBox`, `preserveAspectRatio`, `zoomAndPan` và `transform` trong `currentView` sẽ tương ứng với các giá trị từ mã định danh mảnh đặc tả view SVG

- {{domxref("SVGSVGElement.currentScale")}}
  - : Trên phần tử {{SVGElement("svg")}} ngoài cùng, thuộc tính float này cho biết hệ số tỉ lệ hiện tại so với chế độ xem ban đầu, tính đến các thao tác phóng to và di chuyển của người dùng. Các thuộc tính DOM `currentScale` và `currentTranslate` tương đương với ma trận 2×3 `[a b c d e f] = [currentScale 0 0 currentScale currentTranslate.x currentTranslate.y]`. Nếu "phóng to" được bật (tức là `zoomAndPan="magnify"`), hiệu ứng như thể có một phép biến đổi bổ sung được đặt ở cấp ngoài cùng trên mảnh tài liệu SVG (tức là bên ngoài phần tử {{SVGElement("svg")}} ngoài cùng).
- {{domxref("SVGSVGElement.currentTranslate")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMPointReadOnly")}} biểu thị hệ số dịch chuyển tính đến thao tác "phóng to" của người dùng tương ứng với phần tử {{SVGElement("svg")}} ngoài cùng. Hành vi không xác định đối với các phần tử `<svg>` không ở cấp ngoài cùng.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGSVGElement.suspendRedraw()")}} {{Deprecated_Inline}}
  - : Nhận một giá trị thời gian chờ cho biết không nên vẽ lại cho đến khi:

    lệnh gọi `unsuspendRedraw()` tương ứng đã được thực hiện, lệnh gọi `unsuspendRedrawAll()` đã được thực hiện, hoặc bộ đếm thời gian đã hết hạn.

    Trong các môi trường không hỗ trợ tương tác (ví dụ: phương tiện in), thì không nên tạm hoãn vẽ lại. Các lệnh gọi `suspendRedraw()` và `unsuspendRedraw()` nên, nhưng không bắt buộc, được thực hiện theo cặp cân bằng.

    Để tạm hoãn các hành động vẽ lại trong khi một tập hợp thay đổi SVG DOM xảy ra, hãy đặt trước các thay đổi vào SVG DOM bằng một lệnh gọi phương thức tương tự như:

    ```js
    const suspendHandleID = suspendRedraw(maxWaitMilliseconds);
    ```

    và theo sau các thay đổi bằng một lệnh gọi phương thức tương tự như:

    ```js
    unsuspendRedraw(suspendHandleID);
    ```

    Lưu ý rằng có thể sử dụng nhiều lệnh gọi `suspendRedraw()` cùng lúc, và mỗi lệnh gọi như vậy được xử lý độc lập với các lệnh gọi `suspendRedraw()` khác.

- {{domxref("SVGSVGElement.unsuspendRedraw()")}} {{Deprecated_Inline}}
  - : Hủy một `suspendRedraw()` đã chỉ định bằng cách cung cấp ID xử lý tạm hoãn duy nhất được trả về bởi lệnh gọi `suspendRedraw()` trước đó.
- {{domxref("SVGSVGElement.unsuspendRedrawAll()")}} {{Deprecated_Inline}}
  - : Hủy tất cả các lệnh gọi phương thức `suspendRedraw()` đang hoạt động hiện tại. Phương thức này hữu ích nhất ở cuối một tập hợp lệnh gọi SVG DOM để đảm bảo rằng tất cả các lệnh gọi phương thức `suspendRedraw()` đang chờ xử lý đã bị hủy.
- {{domxref("SVGSVGElement.forceRedraw()")}} {{Deprecated_Inline}}
  - : Trong các môi trường kết xuất hỗ trợ tương tác, buộc tác nhân người dùng vẽ lại ngay lập tức tất cả các vùng của khung nhìn cần cập nhật.
- {{domxref("SVGSVGElement.pauseAnimations()")}}
  - : Tạm dừng tất cả các hoạt hình đang chạy hiện tại được xác định trong mảnh tài liệu SVG tương ứng với phần tử {{SVGElement("svg")}} này, khiến đồng hồ hoạt hình tương ứng với mảnh tài liệu này đứng yên cho đến khi được tiếp tục.
- {{domxref("SVGSVGElement.unpauseAnimations()")}}
  - : Tiếp tục các hoạt hình đang chạy hiện tại được xác định trong mảnh tài liệu SVG, khiến đồng hồ hoạt hình tiếp tục từ thời điểm nó bị tạm dừng.
- {{domxref("SVGSVGElement.animationsPaused()")}}
  - : Trả về `true` nếu mảnh tài liệu SVG này đang ở trạng thái tạm dừng.
- {{domxref("SVGSVGElement.getCurrentTime()")}}
  - : Trả về thời gian hiện tại tính bằng giây so với thời gian bắt đầu của mảnh tài liệu SVG hiện tại. Nếu `getCurrentTime()` được gọi trước khi dòng thời gian tài liệu bắt đầu (ví dụ: bởi script chạy trong phần tử {{SVGElement("script")}} trước khi sự kiện `SVGLoad` của tài liệu được gửi đi), thì `0` được trả về.
- {{domxref("SVGSVGElement.setCurrentTime()")}}
  - : Điều chỉnh đồng hồ cho mảnh tài liệu SVG này, thiết lập một thời gian hiện tại mới. Nếu `setCurrentTime()` được gọi trước khi dòng thời gian tài liệu bắt đầu (ví dụ: bởi script chạy trong phần tử {{SVGElement("script")}} trước khi sự kiện `SVGLoad` của tài liệu được gửi đi), thì giá trị giây trong lần gọi cuối cùng của phương thức sẽ là thời gian mà tài liệu sẽ tua tới khi dòng thời gian tài liệu bắt đầu.
- {{domxref("SVGSVGElement.getIntersectionList()")}}
  - : Trả về một {{domxref("NodeList")}} các phần tử đồ họa có nội dung kết xuất giao nhau với hình chữ nhật được cung cấp. Mỗi phần tử đồ họa ứng viên chỉ được coi là khớp nếu cùng phần tử đồ họa đó có thể là đích của sự kiện con trỏ như được xác định trong quá trình xử lý {{SVGAttr("pointer-events")}}.
- {{domxref("SVGSVGElement.getEnclosureList()")}}
  - : Trả về một {{domxref("NodeList")}} các phần tử đồ họa có nội dung kết xuất hoàn toàn nằm trong hình chữ nhật được cung cấp. Mỗi phần tử đồ họa ứng viên chỉ được coi là khớp nếu cùng phần tử đồ họa đó có thể là đích của sự kiện con trỏ như được xác định trong quá trình xử lý {{SVGAttr("pointer-events")}}.
- {{domxref("SVGSVGElement.checkIntersection()")}}
  - : Trả về `true` nếu nội dung kết xuất của phần tử đã cho giao nhau với hình chữ nhật được cung cấp. Mỗi phần tử đồ họa ứng viên chỉ được coi là khớp nếu cùng phần tử đồ họa đó có thể là đích của sự kiện con trỏ như được xác định trong quá trình xử lý {{SVGAttr("pointer-events")}}.
- {{domxref("SVGSVGElement.checkEnclosure()")}}
  - : Trả về `true` nếu nội dung kết xuất của phần tử đã cho hoàn toàn nằm trong hình chữ nhật được cung cấp. Mỗi phần tử đồ họa ứng viên chỉ được coi là khớp nếu cùng phần tử đồ họa đó có thể là đích của sự kiện con trỏ như được xác định trong quá trình xử lý {{SVGAttr("pointer-events")}}.
- {{domxref("SVGSVGElement.deselectAll()")}}
  - : Bỏ chọn tất cả các đối tượng đang được chọn, bao gồm mọi lựa chọn chuỗi văn bản và thanh nhập liệu.
- {{domxref("SVGSVGElement.createSVGNumber()")}}
  - : Tạo một đối tượng {{domxref("SVGNumber")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo thành `0`.
- {{domxref("SVGSVGElement.createSVGLength()")}}
  - : Tạo một đối tượng {{domxref("SVGLength")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo thành `0` đơn vị người dùng.
- {{domxref("SVGSVGElement.createSVGAngle()")}}
  - : Tạo một đối tượng {{domxref("SVGAngle")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo với giá trị `0` độ (không có đơn vị).
- {{domxref("SVGSVGElement.createSVGPoint()")}}
  - : Tạo một đối tượng {{domxref("DOMPoint")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo tại điểm `(0,0)` trong hệ tọa độ người dùng.
- {{domxref("SVGSVGElement.createSVGMatrix()")}}
  - : Tạo một đối tượng {{domxref("DOMMatrix")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo thành ma trận đơn vị.
- {{domxref("SVGSVGElement.createSVGRect()")}}
  - : Tạo một đối tượng {{domxref("SVGRect")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo sao cho tất cả các giá trị được đặt thành `0` đơn vị người dùng.
- {{domxref("SVGSVGElement.createSVGTransform()")}}
  - : Tạo một đối tượng {{domxref("SVGTransform")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo thành phép biến đổi ma trận đơn vị (`SVG_TRANSFORM_MATRIX`).
- {{domxref("SVGSVGElement.createSVGTransformFromMatrix()")}}
  - : Tạo một đối tượng {{domxref("SVGTransform")}} bên ngoài bất kỳ cây tài liệu nào. Đối tượng được khởi tạo thành phép biến đổi ma trận đã cho (tức là `SVG_TRANSFORM_MATRIX`). Các giá trị từ tham số ma trận được sao chép; tham số ma trận không được áp dụng là `SVGTransform::matrix`.
- {{domxref("SVGSVGElement.getElementById()")}}
  - : Tìm kiếm trong mảnh tài liệu SVG này (tức là, tìm kiếm được giới hạn trong một tập con của cây tài liệu) một phần tử có `id` bằng với `elementId`. Nếu tìm thấy phần tử, phần tử đó sẽ được trả về. Nếu không tồn tại phần tử như vậy, trả về `null`. Hành vi không xác định nếu có nhiều hơn một phần tử có id này.

## Trình xử lý sự kiện

Các thuộc tính trình xử lý sự kiện `onXYZ` của {{domxref("Window")}} sau đây cũng có sẵn dưới dạng bí danh nhắm đến đối tượng `window`. Tuy nhiên, nên lắng nghe chúng trực tiếp trên đối tượng `window` thay vì trên `SVGSVGElement`.

> [!NOTE]
> Sử dụng `addEventListener()` trên `SVGSVGElement` sẽ không hoạt động đối với các trình xử lý sự kiện `onXYZ` được liệt kê bên dưới. Hãy lắng nghe các sự kiện trên đối tượng {{domxref("window")}} thay thế.

- {{domxref("window.afterprint_event", "SVGSVGElement.onafterprint")}}
  - : Được kích hoạt sau khi tài liệu liên kết đã bắt đầu in hoặc bản xem trước in đã đóng.
- {{domxref("window.beforeprint_event", "SVGSVGElement.onbeforeprint")}}
  - : Được kích hoạt khi tài liệu liên kết sắp được in hoặc xem trước để in.
- {{domxref("window.beforeunload_event", "SVGSVGElement.onbeforeunload")}}
  - : Được kích hoạt khi cửa sổ, tài liệu và tài nguyên của nó sắp được giải phóng.
- {{domxref("window.gamepadconnected_event", "SVGSVGElement.ongamepadconnected")}}
  - : Được kích hoạt khi trình duyệt phát hiện một tay cầm trò chơi đã kết nối hoặc lần đầu tiên một nút/trục của tay cầm được sử dụng.
- {{domxref("window.gamepaddisconnected_event", "SVGSVGElement.ongamepaddisconnected")}}
  - : Được kích hoạt khi trình duyệt phát hiện một tay cầm trò chơi đã ngắt kết nối.
- {{domxref("window.hashchange_event", "SVGSVGElement.onhashchange")}}
  - : Được kích hoạt khi mã định danh mảnh của URL đã thay đổi (phần URL bắt đầu và theo sau ký hiệu `#`).
- {{domxref("window.languagechange_event", "SVGSVGElement.onlanguagechange")}}
  - : Được kích hoạt khi ngôn ngữ ưa thích của người dùng thay đổi.
- {{domxref("window.message_event", "SVGSVGElement.onmessage")}}
  - : Được kích hoạt khi cửa sổ nhận được tin nhắn, ví dụ từ lệnh gọi [`Window.postMessage()`](/en-US/docs/Web/API/Window/postMessage) từ ngữ cảnh duyệt web khác.
- {{domxref("window.messageerror_event", "SVGSVGElement.onmessageerror")}}
  - : Được kích hoạt khi cửa sổ nhận được tin nhắn không thể giải mã.
- {{domxref("window.offline_event", "SVGSVGElement.onoffline")}}
  - : Được kích hoạt khi trình duyệt mất quyền truy cập mạng và giá trị của {{domxref("Navigator.onLine")}} chuyển sang `false`.
- {{domxref("window.online_event", "SVGSVGElement.ononline")}}
  - : Được kích hoạt khi trình duyệt có quyền truy cập mạng và giá trị của {{domxref("Navigator.onLine")}} chuyển sang `true`.
- {{domxref("window.pagehide_event", "SVGSVGElement.onpagehide")}}
  - : Được kích hoạt khi trình duyệt ẩn trang hiện tại trong quá trình hiển thị trang khác từ lịch sử phiên.
- {{domxref("window.pageshow_event", "SVGSVGElement.onpageshow")}}
  - : Được kích hoạt khi trình duyệt hiển thị tài liệu của cửa sổ do điều hướng.
- {{domxref("window.popstate_event", "SVGSVGElement.onpopstate")}}
  - : Được kích hoạt khi mục nhập lịch sử đang hoạt động thay đổi trong khi người dùng điều hướng lịch sử phiên.
- {{domxref("window.rejectionhandled_event", "SVGSVGElement.onrejectionhandled")}}
  - : Được kích hoạt mỗi khi một {{jsxref("Promise")}} JavaScript bị từ chối và việc từ chối đã được xử lý.
- {{domxref("window.storage_event", "SVGSVGElement.onstorage")}}
  - : Được kích hoạt khi một vùng lưu trữ (`localStorage`) đã được sửa đổi trong ngữ cảnh của tài liệu khác.
- {{domxref("window.unhandledrejection_event", "SVGSVGElement.onunhandledrejection")}}
  - : Được kích hoạt mỗi khi một {{jsxref("Promise")}} bị từ chối nhưng việc từ chối không được xử lý.
- {{domxref("window.unload_event", "SVGSVGElement.onunload")}}
  - : Được kích hoạt khi tài liệu đang được giải phóng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("circle")}}
