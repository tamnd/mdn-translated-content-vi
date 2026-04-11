---
title: Navigator
slug: Web/API/Navigator
page-type: web-api-interface
browser-compat: api.Navigator
---

{{APIRef("DOM")}}

Giao diện **`Navigator`** thể hiện trạng thái và danh tính của tác nhân người dùng. Nó cho phép các tập lệnh truy vấn nó và tự đăng ký để thực hiện một số hoạt động.

Có thể truy xuất đối tượng `Navigator` bằng thuộc tính {{domxref("window.navigator")}} chỉ đọc.

## Thuộc tính phiên bản

_Không kế thừa bất kỳ thuộc tính nào._

### Thuộc tính tiêu chuẩn

- {{domxref("Navigator.audioSession")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("AudioSession")}} có thể được sử dụng để kiểm soát cách âm thanh từ ứng dụng web tương tác với âm thanh khác đang phát trên thiết bị.
- {{domxref("Navigator.bluetooth")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("Bluetooth")}} cho tài liệu hiện tại, cung cấp quyền truy cập vào chức năng [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API).
- {{domxref("Navigator.clipboard")}} {{ReadOnlyInline}} {{securecontext_inline}}
  - : Trả về đối tượng {{domxref("Clipboard")}} cung cấp quyền truy cập đọc và ghi vào bảng tạm hệ thống.
- {{domxref("Navigator.connection")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("NetworkInformation")}} chứa thông tin về kết nối mạng của thiết bị.
- {{domxref("Navigator.contacts")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về giao diện {{domxref('ContactsManager')}} cho phép người dùng chọn các mục từ danh sách liên hệ của họ và chia sẻ chi tiết hạn chế về các mục đã chọn với một trang web hoặc ứng dụng.
- {{domxref("Navigator.cookieEnabled")}} {{ReadOnlyInline}}
  - : Trả về false nếu việc đặt cookie sẽ bị bỏ qua và ngược lại là true.
- {{domxref("Navigator.credentials")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về giao diện {{domxref("CredentialsContainer")}} hiển thị các phương thức yêu cầu thông tin xác thực và thông báo cho tác nhân người dùng khi xảy ra các sự kiện thú vị như đăng nhập hoặc đăng xuất thành công.
- {{domxref("Navigator.deviceMemory")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về dung lượng bộ nhớ thiết bị tính bằng gigabyte. Giá trị này là giá trị gần đúng được tính bằng cách làm tròn đến lũy thừa gần nhất của 2 và chia số đó cho 1024.
- {{domxref("Navigator.devicePosture")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("DevicePosture")}} của trình duyệt, cho phép nhà phát triển truy vấn tư thế hiện tại của thiết bị (nghĩa là chế độ xem ở trạng thái phẳng hay gập) và chạy mã để phản hồi các thay đổi về tư thế.
- {{domxref("Navigator.geolocation")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Geolocation")}} cho phép truy cập vị trí của thiết bị.
- {{domxref("Navigator.gpu")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("GPU")}} cho ngữ cảnh duyệt hiện tại. Điểm vào của {{domxref("WebGPU_API", "WebGPU API", "", "nocode")}}.
- {{domxref("Navigator.hardwareConcurrency")}} {{ReadOnlyInline}}
  - : Trả về số lõi xử lý logic có sẵn.
- {{domxref("Navigator.hid")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("HID")}} cung cấp các phương thức kết nối với thiết bị HID, liệt kê các thiết bị HID đính kèm và trình xử lý sự kiện cho các thiết bị HID được kết nối.
- {{domxref("Navigator.ink")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("Ink")}} cho tài liệu hiện tại, cung cấp quyền truy cập vào chức năng [Ink API](/en-US/docs/Web/API/Ink_API).
- {{domxref('Navigator.keyboard')}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref('Keyboard')}} cung cấp quyền truy cập vào các chức năng truy xuất sơ đồ bố cục bàn phím và chuyển đổi việc ghi lại các lần nhấn phím từ bàn phím vật lý.
- {{domxref("Navigator.language")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi biểu thị ngôn ngữ ưa thích của người dùng, thường là ngôn ngữ của giao diện người dùng trình duyệt. Giá trị `null` được trả về khi không xác định được giá trị này.
- {{domxref("Navigator.languages")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi các chuỗi biểu thị các ngôn ngữ mà người dùng đã biết, theo thứ tự ưu tiên.
- {{domxref("Navigator.locks")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("LockManager")}} cung cấp các phương thức để yêu cầu đối tượng {{domxref('Lock')}} mới và truy vấn đối tượng {{domxref('Lock')}} hiện có.
- {{domxref("Navigator.login")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Cung cấp quyền truy cập vào đối tượng {{domxref("NavigatorLogin")}} của trình duyệt mà nhà cung cấp danh tính liên kết (IdP) có thể sử dụng để đặt trạng thái đăng nhập của người dùng khi họ đăng nhập hoặc đăng xuất khỏi IdP. Xem [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API) để biết thêm chi tiết.
- {{domxref("Navigator.maxTouchPoints")}} {{ReadOnlyInline}}
  - : Trả về số điểm tiếp xúc đồng thời tối đa được thiết bị hiện tại hỗ trợ.
- {{domxref("Navigator.mediaCapabilities")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("MediaCapabilities")}} có thể hiển thị thông tin về khả năng giải mã và mã hóa cho một định dạng và khả năng đầu ra nhất định.
- {{domxref("Navigator.mediaDevices")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về tham chiếu đến đối tượng {{domxref("MediaDevices")}}, sau đó có thể được sử dụng để lấy thông tin về các thiết bị phương tiện có sẵn ({{domxref("MediaDevices.enumerateDevices()")}}), tìm hiểu những thuộc tính ràng buộc nào được hỗ trợ cho phương tiện trên máy tính của người dùng và tác nhân người dùng ({{domxref("MediaDevices.getSupportedConstraints()")}}) và để yêu cầu quyền truy cập vào phương tiện bằng {{domxref("MediaDevices.getUserMedia()")}}.
- {{domxref("Navigator.mediaSession")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("MediaSession")}} có thể được sử dụng để cung cấp siêu dữ liệu mà trình duyệt có thể sử dụng để hiển thị thông tin về phương tiện hiện đang phát cho người dùng, chẳng hạn như trong giao diện người dùng điều khiển phương tiện toàn cầu.
- {{domxref("Navigator.onLine")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết trình duyệt có hoạt động trực tuyến hay không.
- {{domxref("Navigator.pdfViewerEnabled")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu trình duyệt có thể hiển thị nội tuyến tệp PDF khi điều hướng đến chúng và `false` nếu không.
- {{domxref("Navigator.permissions")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Permissions")}} có thể được sử dụng để truy vấn và cập nhật trạng thái cấp phép của các API thuộc phạm vi [Permissions API](/en-US/docs/Web/API/Permissions_API).
- {{domxref("Navigator.preferences")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("PreferenceManager")}} hiện tại của tài liệu, cung cấp quyền truy cập vào thông tin [user preference](/en-US/docs/Web/API/User_Preferences_API).
- {{domxref("Navigator.presentation")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về tham chiếu đến API {{domxref("Presentation")}}.
- {{domxref("Navigator.scheduling")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("Scheduling")}} cho tài liệu hiện tại.
- {{domxref("Navigator.serial")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("Serial")}}, đại diện cho điểm vào [Web Serial API](/en-US/docs/Web/API/Web_Serial_API) để cho phép điều khiển các cổng nối tiếp.
- {{domxref("Navigator.serviceWorker")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("ServiceWorkerContainer")}}, cung cấp quyền truy cập để đăng ký, xóa, nâng cấp và liên lạc với các đối tượng {{domxref("ServiceWorker")}} cho [associated document](https://html.spec.whatwg.org/multipage/browsers.html#concept-document-window).
- {{domxref("Navigator.storage")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref('StorageManager')}} đơn lẻ được sử dụng để quản lý các quyền liên tục và ước tính dung lượng lưu trữ có sẵn trên cơ sở từng trang web/từng ứng dụng.
- {{domxref("Navigator.usb")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("USB")}} cho tài liệu hiện tại, cung cấp quyền truy cập vào chức năng [WebUSB API](/en-US/docs/Web/API/WebUSB_API).
- {{domxref("Navigator.userActivation")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("UserActivation")}} chứa thông tin về trạng thái kích hoạt người dùng của cửa sổ hiện tại.
- {{domxref("Navigator.userAgent")}} {{ReadOnlyInline}}
  - : Trả về chuỗi tác nhân người dùng cho trình duyệt hiện tại.
- {{domxref("Navigator.userAgentData")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("NavigatorUAData")}}, cho phép truy cập thông tin về trình duyệt và hệ điều hành của người dùng.
- {{domxref("Navigator.virtualKeyboard")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về tham chiếu đến API {{domxref("VirtualKeyboard")}}, để kiểm soát bàn phím ảo trên màn hình.
- {{domxref("Navigator.wakeLock")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về giao diện {{domxref("WakeLock")}} mà bạn có thể sử dụng để yêu cầu khóa đánh thức màn hình và ngăn màn hình mờ, tắt hoặc hiển thị trình bảo vệ màn hình.
- {{domxref("Navigator.webdriver")}} {{ReadOnlyInline}}
  - : Cho biết liệu tác nhân người dùng có được điều khiển bằng tự động hóa hay không.
- {{domxref("Navigator.windowControlsOverlay")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về giao diện {{domxref("WindowControlsOverlay")}} hiển thị thông tin về hình dạng của thanh tiêu đề trong Ứng dụng web lũy tiến trên máy tính để bàn và một sự kiện để biết bất cứ khi nào nó thay đổi.
- {{domxref("Navigator.xr")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("XRSystem")}}, đại diện cho điểm vào [WebXR API](/en-US/docs/Web/API/WebXR_Device_API).

### Thuộc tính không chuẩn

- {{domxref("Navigator.buildID")}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về mã định danh bản dựng của trình duyệt. Trong các trình duyệt hiện đại, thuộc tính này hiện trả về dấu thời gian cố định làm biện pháp bảo mật, ví dụ: `20181001000000` trong Firefox 64 trở đi.
- {{domxref("Navigator.globalPrivacyControl")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một boolean cho biết sự đồng ý của người dùng đối với việc thông tin của họ được chia sẻ hoặc bán.
- {{domxref("Navigator.standalone")}} {{Non-standard_Inline}}
  - : Trả về một boolean cho biết trình duyệt có đang chạy ở chế độ độc lập hay không. Chỉ khả dụng trên iOS Safari của Apple.

### Thuộc tính không được dùng nữa

- {{domxref("Navigator.activeVRDisplays")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một mảng chứa mọi đối tượng {{domxref("VRDisplay")}} hiện đang hiển thị ({{domxref("VRDisplay.isPresenting")}} là `true`).
- {{domxref("Navigator.appCodeName")}} {{ReadOnlyInline}}
  - : Luôn trả về `'Mozilla'`, trong mọi trình duyệt.
- {{domxref("Navigator.appName")}} {{ReadOnlyInline}}
  - : Luôn trả về `'Netscape'`, trong mọi trình duyệt.
- {{domxref("Navigator.appVersion")}} {{ReadOnlyInline}}
  - : Trả về phiên bản của trình duyệt dưới dạng chuỗi. Không dựa vào thuộc tính này để trả về giá trị chính xác.
- {{domxref("Navigator.doNotTrack")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Báo cáo giá trị tùy chọn không theo dõi của người dùng. Khi giá trị này là "1", trang web hoặc ứng dụng của bạn sẽ không theo dõi người dùng.
- {{domxref("Navigator.mimeTypes")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("MimeTypeArray")}} liệt kê các loại MIME được trình duyệt hỗ trợ.
- {{domxref("Navigator.oscpu")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho hệ điều hành hiện tại.
- {{domxref("Navigator.platform")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho nền tảng của trình duyệt. Đừng dựa vào hàm này để trả về một giá trị quan trọng.
- {{domxref("Navigator.plugins")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("PluginArray")}} liệt kê các plugin được cài đặt trong trình duyệt.
- {{domxref("Navigator.product")}} {{ReadOnlyInline}}
  - : Luôn trả về `'Gecko'`, trong mọi trình duyệt.
- {{domxref("Navigator.productSub")}} {{ReadOnlyInline}}
  - : Trả về chuỗi `'20030107'` hoặc `'"20100101'`.
- {{domxref("Navigator.vendor")}} {{ReadOnlyInline}}
  - : Trả về chuỗi trống `'Apple Computer Inc.'` hoặc `'Google Inc.'`.
- {{domxref("Navigator.vendorSub")}} {{ReadOnlyInline}}
  - : Luôn trả về chuỗi trống.

## Các phương thức thực thể

_Không kế thừa bất kỳ phương thức nào._

- {{domxref("Navigator.canShare()")}} {{SecureContext_Inline}}
  - : Trả về `true` nếu cuộc gọi tới `Navigator.share()` thành công.
- {{domxref("Navigator.clearAppBadge()")}} {{SecureContext_Inline}}
  - : Xóa huy hiệu trên biểu tượng của ứng dụng hiện tại và trả về {{jsxref("Promise")}} phân giải bằng {{jsxref("undefined")}}.
- {{domxref("Navigator.deprecatedReplaceInURN()")}} {{Experimental_Inline}}
  - : Thay thế các chuỗi được chỉ định bên trong URL được ánh xạ tương ứng với thuộc tính nội bộ `url` của URN hoặc `FencedFrameConfig` mờ đục nhất định. Phương pháp này đã được cung cấp dưới dạng biện pháp tạm thời (do đó "không được dùng nữa") để cho phép thay thế các URL khung có rào chắn, giúp các nhà cung cấp công nghệ quảng cáo di chuyển các hoạt động triển khai hiện có sang API [privacy sandbox](https://privacysandbox.google.com/).
- {{domxref("Navigator.getAutoplayPolicy()")}} {{Experimental_Inline}}
  - : Trả về giá trị cho biết liệu phần tử phương tiện, ngữ cảnh âm thanh hoặc "loại" tính năng phương tiện đã chỉ định có được phép tự động phát hay không.
- {{domxref("Navigator.getBattery()")}} {{SecureContext_Inline}}
  - : Trả về lời hứa được giải quyết bằng đối tượng {{domxref("BatteryManager")}} trả về thông tin về trạng thái sạc pin.
- {{domxref("Navigator.getGamepads()")}}
  - : trả về một mảng các đối tượng {{domxref("Gamepad")}}, một đối tượng cho mỗi gamepad được kết nối với thiết bị.
- {{domxref("Navigator.getInstalledRelatedApps()")}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về một lời hứa có thể giải quyết bằng một mảng đối tượng đại diện cho bất kỳ gốc hoặc [Progressive Web Applications](/en-US/docs/Web/Progressive_web_apps) có liên quan nào mà người dùng đã cài đặt.
- {{domxref("Navigator.registerProtocolHandler()")}} {{SecureContext_Inline}}
  - : Cho phép các trang web tự đăng ký làm trình xử lý khả thi cho một giao thức nhất định.
- {{domxref("Navigator.requestMediaKeySystemAccess()")}} {{SecureContext_Inline}}
  - : Trả về {{jsxref("Promise")}} cho đối tượng MediaKeySystemAccess.
- {{domxref("Navigator.requestMIDIAccess()")}} {{SecureContext_Inline}}
  - : Trả về {{jsxref('Promise')}} thể hiện yêu cầu truy cập vào thiết bị MIDI trên hệ thống của người dùng.
- {{domxref("Navigator.sendBeacon()")}}
  - : Được sử dụng để truyền không đồng bộ một lượng nhỏ dữ liệu bằng {{Glossary("HTTP")}} từ Tác nhân người dùng đến máy chủ web.
- {{domxref("Navigator.setAppBadge()")}} {{SecureContext_Inline}}
  - : Đặt huy hiệu trên biểu tượng được liên kết với ứng dụng này và trả về {{jsxref("Promise")}} phân giải bằng {{jsxref("undefined")}}.
- {{domxref("Navigator.share()")}} {{SecureContext_Inline}}
  - : Gọi cơ chế chia sẻ gốc của nền tảng hiện tại.
- {{domxref("Navigator.vibrate()")}}
  - : Gây rung trên các thiết bị có hỗ trợ rung. Không có tác dụng gì nếu không có hỗ trợ rung.
- {{domxref("Navigator.unregisterProtocolHandler()")}} {{SecureContext_Inline}}
  - : Hủy đăng ký một trang web xử lý một giao thức nhất định.

### Các phương thức không được dùng nữa

- {{domxref("Navigator.getUserMedia()")}} {{Deprecated_Inline}} {{SecureContext_Inline}}
  - : Sau khi nhắc người dùng cấp quyền, trả về luồng âm thanh hoặc video được liên kết với camera hoặc micrô trên máy tính cục bộ.
- {{domxref("Navigator.getVRDisplays()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một lời hứa phân giải thành một mảng các đối tượng {{domxref("VRDisplay")}} đại diện cho mọi thiết bị VR có sẵn được kết nối với máy tính.
- {{domxref("Navigator.javaEnabled()")}}
  - : Luôn trả về sai.
- {{domxref("Navigator.taintEnabled()")}}
  - : Trả về `false`. Các chức năng không bị lỗi/không bị lỗi của JavaScript đã bị loại bỏ trong JavaScript 1.2.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
