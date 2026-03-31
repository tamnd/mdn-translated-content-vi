---
title: Permissions-Policy header
short-title: Permissions-Policy
slug: Web/HTTP/Reference/Headers/Permissions-Policy
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Permissions-Policy
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Permissions-Policy`** {{Glossary("response header")}} cung cấp cơ chế để cho phép và từ chối sử dụng các tính năng của trình duyệt trong tài liệu hoặc trong bất kỳ phần tử {{HTMLElement("iframe")}} nào trong tài liệu.

Để biết thêm thông tin, xem bài viết chính về [Chính sách quyền hạn](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Permissions-Policy: <directive>=<allowlist>
```

- `<directive>`
  - : Chỉ thị Chính sách quyền hạn để áp dụng `allowlist`. Xem [Chỉ thị](#directives) bên dưới để biết danh sách tên chỉ thị được phép.
- `<allowlist>`
  - : Danh sách cho phép là danh sách các nguồn gốc nhận một hoặc nhiều giá trị sau được chứa trong dấu ngoặc đơn, phân tách bằng dấu cách:
    - `*` (ký tự đại diện)
      - : Tính năng sẽ được phép trong tài liệu này và tất cả các ngữ cảnh duyệt web lồng nhau (`<iframe>`) bất kể nguồn gốc của chúng.
    - `()` (danh sách cho phép trống)
      - : Tính năng bị tắt trong các ngữ cảnh duyệt web cấp cao nhất và lồng nhau. Tương đương cho thuộc tính `allow` `<iframe>` là `'none'`.
    - `self`
      - : Tính năng sẽ được phép trong tài liệu này và trong tất cả các ngữ cảnh duyệt web lồng nhau (`<iframe>`) chỉ trong cùng nguồn gốc. Tính năng không được phép trong các tài liệu khác nguồn gốc trong các ngữ cảnh duyệt web lồng nhau. `self` có thể được coi là viết tắt cho `https://your-site.example.com`. Tương đương cho thuộc tính `allow` `<iframe>` là `self`.
    - `src`
      - : Tính năng sẽ được phép trong `<iframe>` này, miễn là tài liệu được tải vào nó đến từ cùng nguồn gốc với URL trong thuộc tính {{HTMLElement('iframe','src','#Attributes')}} của nó. Giá trị này chỉ được sử dụng trong thuộc tính `allow` `<iframe>`, và là giá trị `allowlist` _mặc định_ trong `<iframe>`.
    - `"<origin>"`
      - : Tính năng được phép cho các nguồn gốc cụ thể (ví dụ: `"https://a.example.com"`). Các nguồn gốc nên được phân tách bằng dấu cách. Lưu ý rằng các nguồn gốc trong thuộc tính `allow` `<iframe>` không được trích dẫn.

    Các giá trị `*` và `()` chỉ có thể được sử dụng một mình, trong khi `self` và `src` có thể được sử dụng kết hợp với một hoặc nhiều nguồn gốc.

    > [!NOTE]
    > Các chỉ thị có danh sách cho phép mặc định, luôn là một trong `*`, `self` hoặc `none` cho tiêu đề HTTP `Permissions-Policy`, và điều chỉnh hành vi mặc định nếu chúng không được liệt kê rõ ràng trong chính sách.
    > Những điều này được chỉ định trên các [trang tham chiếu chỉ thị riêng lẻ](#directives). Đối với thuộc tính `allow` `<iframe>`, hành vi mặc định luôn là `src`.

Khi được hỗ trợ, bạn có thể bao gồm ký tự đại diện trong các nguồn gốc Chính sách quyền hạn. Điều này có nghĩa là thay vì phải chỉ định rõ ràng nhiều tên miền con khác nhau trong danh sách cho phép, bạn có thể chỉ định tất cả trong một nguồn gốc với ký tự đại diện.

Vì vậy, thay vì

```http
("https://example.com" "https://a.example.com" "https://b.example.com" "https://c.example.com")
```

Bạn có thể chỉ định

```http
("https://example.com" "https://*.example.com")
```

> [!NOTE]
> `"https://*.example.com"` không khớp `"https://example.com"`.

## Chỉ thị

- {{httpheader('Permissions-Policy/accelerometer','accelerometer')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép thu thập thông tin về gia tốc của thiết bị thông qua giao diện {{DOMxRef("Accelerometer")}} hay không.

- {{httpheader('Permissions-Policy/ambient-light-sensor','ambient-light-sensor')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép thu thập thông tin về lượng ánh sáng trong môi trường xung quanh thiết bị thông qua giao diện {{DOMxRef("AmbientLightSensor")}} hay không.

- {{httpheader("Permissions-Policy/aria-notify", "aria-notify")}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng phương thức {{domxref("Document.ariaNotify", "ariaNotify()")}} để kích hoạt thông báo {{glossary("screen reader")}} hay không.

- {{httpheader('Permissions-Policy/attribution-reporting','attribution-reporting')}} {{deprecated_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) hay không.

- {{httpheader('Permissions-Policy/autoplay','autoplay')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép tự động phát phương tiện được yêu cầu thông qua giao diện {{domxref("HTMLMediaElement")}} hay không.

- {{httpheader('Permissions-Policy/bluetooth','bluetooth')}} {{Experimental_Inline}}
  - : Kiểm soát xem việc sử dụng [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) có được phép hay không.

- {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}} {{deprecated_inline}} {{non-standard_inline}}
  - : Kiểm soát quyền truy cập vào [Topics API](/en-US/docs/Web/API/Topics_API).

- {{httpheader('Permissions-Policy/camera', 'camera')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng thiết bị đầu vào video hay không.

- {{HTTPHeader('Permissions-Policy/captured-surface-control', 'captured-surface-control')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu có được phép sử dụng [Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) hay không.

- {{HTTPHeader('Permissions-Policy/ch-ua-high-entropy-values', 'ch-ua-high-entropy-values')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu có được phép sử dụng phương thức {{domxref("NavigatorUAData.getHighEntropyValues()")}} để lấy dữ liệu tác nhân người dùng entropy cao hay không.

- {{httpheader('Permissions-Policy/compute-pressure','compute-pressure')}} {{Experimental_Inline}}
  - : Kiểm soát quyền truy cập vào [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API).

- {{httpheader('Permissions-Policy/cross-origin-isolated','cross-origin-isolated')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có thể được coi là {{domxref("Window.crossOriginIsolated", "cách ly khác nguồn gốc", "", 1)}} hay không.

- {{HTTPHeader('Permissions-Policy/deferred-fetch', 'deferred-fetch')}} {{experimental_inline}}
  - : Kiểm soát việc phân bổ hạn ngạch [`fetchLater()` của nguồn gốc cấp cao nhất](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas).

- {{HTTPHeader('Permissions-Policy/deferred-fetch-minimal', 'deferred-fetch-minimal')}} {{experimental_inline}}
  - : Kiểm soát việc phân bổ hạn ngạch [`fetchLater()` được chia sẻ khung con khác nguồn gốc](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas).

- {{HTTPHeader('Permissions-Policy/display-capture', 'display-capture')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng phương thức {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} để chụp nội dung màn hình hay không.

- {{httpheader('Permissions-Policy/encrypted-media', 'encrypted-media')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) (EME) hay không.

- {{httpheader('Permissions-Policy/fullscreen','fullscreen')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng {{DOMxRef("Element.requestFullscreen()")}} hay không.

- {{httpheader('Permissions-Policy/gamepad','gamepad')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Gamepad API](/en-US/docs/Web/API/Gamepad_API) hay không.

- {{httpheader('Permissions-Policy/geolocation','geolocation')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng giao diện {{domxref('Geolocation')}} hay không.

- {{httpheader('Permissions-Policy/gyroscope','gyroscope')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép thu thập thông tin về hướng của thiết bị thông qua giao diện {{DOMxRef("Gyroscope")}} hay không.

- {{httpheader('Permissions-Policy/hid','hid')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng {{domxref("WebHID API", "WebHID API", "", "nocode")}} để kết nối với các thiết bị giao diện người dùng không phổ biến hay không.

- {{httpheader('Permissions-Policy/identity-credentials-get','identity-credentials-get')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Federated Credential Management API (FedCM)](/en-US/docs/Web/API/FedCM_API) hay không.

- {{httpheader('Permissions-Policy/idle-detection','idle-detection')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng {{domxref("Idle Detection API", "Idle Detection API", "", "nocode")}} để phát hiện khi người dùng đang tương tác với thiết bị của họ hay không.

- {{httpheader("Permissions-Policy/language-detector", "language-detector")}} {{Experimental_Inline}}
  - : Kiểm soát quyền truy cập vào chức năng phát hiện ngôn ngữ của [Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs).

- {{httpheader('Permissions-Policy/local-fonts','local-fonts')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép thu thập dữ liệu về phông chữ cục bộ đã cài đặt của người dùng thông qua phương thức {{DOMxRef("Window.queryLocalFonts()")}} hay không.

- {{httpheader('Permissions-Policy/magnetometer','magnetometer')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép thu thập thông tin về hướng của thiết bị thông qua giao diện {{DOMxRef("Magnetometer")}} hay không.

- {{httpheader('Permissions-Policy/microphone','microphone')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng thiết bị đầu vào âm thanh hay không.

- {{httpheader('Permissions-Policy/midi', 'midi')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) hay không.

- {{httpheader("Permissions-Policy/on-device-speech-recognition", "on-device-speech-recognition")}} {{Experimental_Inline}}
  - : Kiểm soát quyền truy cập vào chức năng [nhận dạng giọng nói trên thiết bị](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API).

- {{httpheader("Permissions-Policy/otp-credentials", "otp-credentials")}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [WebOTP API](/en-US/docs/Web/API/WebOTP_API) để yêu cầu mật khẩu một lần (OTP) hay không.

- {{httpheader('Permissions-Policy/payment', 'payment')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) hay không.

- {{httpheader('Permissions-Policy/picture-in-picture', 'picture-in-picture')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép phát video ở chế độ Picture-in-Picture thông qua API tương ứng hay không.

- {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} {{Experimental_Inline}}
  - : Kiểm soát việc sử dụng các thao tác [private state token](/en-US/docs/Web/API/Private_State_Token_API) `token-request`.

- {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}} {{Experimental_Inline}}
  - : Kiểm soát việc sử dụng các thao tác [private state token](/en-US/docs/Web/API/Private_State_Token_API) `token-redemption` và `send-redemption-record`.

- {{httpheader("Permissions-Policy/publickey-credentials-create", "publickey-credentials-create")}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) để tạo thông tin xác thực khóa bất đối xứng mới hay không.

- {{httpheader("Permissions-Policy/publickey-credentials-get", "publickey-credentials-get")}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) để lấy thông tin xác thực khóa công khai đã lưu hay không.

- {{httpheader('Permissions-Policy/screen-wake-lock', 'screen-wake-lock')}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Screen Wake Lock API](/en-US/docs/Web/API/Screen_Wake_Lock_API) để chỉ báo rằng thiết bị không nên tắt hoặc làm mờ màn hình hay không.

- {{httpheader('Permissions-Policy/serial','serial')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng {{domxref("Web Serial API", "Web Serial API", "", "nocode")}} để giao tiếp với các thiết bị nối tiếp hay không.

- {{httpheader("Permissions-Policy/speaker-selection", "speaker-selection")}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Audio Output Devices API](/en-US/docs/Web/API/Audio_Output_Devices_API) để liệt kê và chọn loa hay không.

- {{httpheader("Permissions-Policy/storage-access", "storage-access")}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu được tải trong ngữ cảnh bên thứ ba (tức là nhúng trong {{htmlelement("iframe")}}) có được phép sử dụng {{domxref("Storage Access API", "Storage Access API", "", "nocode")}} để yêu cầu quyền truy cập vào cookie không được phân vùng hay không.

- {{httpheader("Permissions-Policy/translator", "translator")}} {{Experimental_Inline}}
  - : Kiểm soát quyền truy cập vào chức năng dịch thuật của [Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs).

- {{httpheader("Permissions-Policy/summarizer", "summarizer")}} {{Experimental_Inline}}
  - : Kiểm soát quyền truy cập vào [Summarizer API](/en-US/docs/Web/API/Summarizer_API).

- {{httpheader('Permissions-Policy/usb', 'usb')}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [WebUSB API](/en-US/docs/Web/API/WebUSB_API) hay không.

- {{httpheader("Permissions-Policy/web-share", "web-share")}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng {{domxref("Navigator.share","Navigator.share()")}} của [Web Share API](/en-US/docs/Web/API/Web_Share_API) để chia sẻ văn bản, liên kết, hình ảnh và nội dung khác hay không.

- {{httpheader("Permissions-Policy/window-management", "window-management")}} {{experimental_inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [Window Management API](/en-US/docs/Web/API/Window_Management_API) để quản lý cửa sổ trên nhiều màn hình hay không.

- {{httpheader("Permissions-Policy/xr-spatial-tracking", "xr-spatial-tracking")}} {{Experimental_Inline}}
  - : Kiểm soát xem tài liệu hiện tại có được phép sử dụng [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) để tương tác với phiên WebXR hay không.

## Ví dụ

### Sử dụng cơ bản

#### Tiêu đề Permissions-Policy

Để cho phép tất cả các nguồn gốc truy cập vào định vị địa lý, bạn làm điều này:

```http
Permissions-Policy: geolocation=*
```

Hoặc để cho phép truy cập cho một tập hợp con các nguồn gốc, bạn làm điều này:

```http
Permissions-Policy: geolocation=(self "https://a.example.com" "https://b.example.com")
```

Một số tính năng có thể được kiểm soát đồng thời bằng cách gửi tiêu đề với danh sách chính sách phân tách bằng dấu phẩy, hoặc bằng cách gửi tiêu đề riêng cho mỗi chính sách.

Ví dụ: sau đây là tương đương:

```http
Permissions-Policy: picture-in-picture=(), geolocation=(self https://example.com/), camera=*

Permissions-Policy: picture-in-picture=()
Permissions-Policy: geolocation=(self https://example.com/)
Permissions-Policy: camera=*
```

#### iframe

Để `<iframe>` có tính năng được bật, nguồn gốc được phép của nó cũng phải có trong danh sách cho phép của trang cha. Do [hành vi kế thừa](/en-US/docs/Web/HTTP/Guides/Permissions_Policy#inheritance_of_policies_for_embedded_content) này, nên chỉ định hỗ trợ rộng nhất có thể chấp nhận cho một tính năng trong tiêu đề HTTP, sau đó chỉ định tập con hỗ trợ bạn cần trong mỗi `<iframe>`.

Để cho phép tất cả các nguồn gốc truy cập vào định vị địa lý, bạn làm điều này:

```html
<iframe src="https://example.com" allow="geolocation *"></iframe>
```

Để áp dụng chính sách cho nguồn gốc hiện tại và các nguồn gốc khác, bạn làm điều này:

```html
<iframe
  src="https://example.com"
  allow="geolocation 'self' https://a.example.com https://b.example.com"></iframe>
```

### Từ chối quyền truy cập vào các tính năng mạnh

SecureCorp Inc. muốn tắt Microphone (ví dụ: {{domxref("MediaDevices.getUserMedia()")}}) và {{domxref("Geolocation")}} APIs trong ứng dụng của mình. Họ có thể làm điều đó bằng tiêu đề phản hồi sau:

```http
Permissions-Policy: microphone=(), geolocation=()
```

Bằng cách chỉ định `()` cho danh sách nguồn gốc, các tính năng được chỉ định sẽ bị vô hiệu hóa cho tất cả các ngữ cảnh duyệt web (bao gồm tất cả `<iframe>`), bất kể nguồn gốc của chúng.

### Kết hợp tiêu đề HTTP và chính sách `<iframe>`

Ví dụ: giả sử chúng ta muốn bật sử dụng định vị địa lý trên nguồn gốc của chúng ta, và trong nội dung nhúng đến từ mạng quảng cáo đáng tin cậy của chúng ta. Chúng ta có thể thiết lập Chính sách quyền hạn toàn trang như sau:

```http
Permissions-Policy: geolocation=(self https://trusted-ad-network.com)
```

Trong các `<iframe>` quảng cáo của chúng ta, chúng ta có thể đặt quyền truy cập vào nguồn gốc `https://trusted-ad-network.com` như sau:

```html
<iframe src="https://trusted-ad-network.com" allow="geolocation"></iframe>
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chính sách quyền hạn](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
- {{DOMxRef("Document.featurePolicy")}} và {{DOMxRef("FeaturePolicy")}}
- {{HTTPHeader("Content-Security-Policy")}}
- {{HTTPHeader("Referrer-Policy")}}
