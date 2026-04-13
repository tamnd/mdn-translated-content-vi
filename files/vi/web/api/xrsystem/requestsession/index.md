---
title: "XRSystem: phương thức requestSession()"
short-title: requestSession()
slug: Web/API/XRSystem/requestSession
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSystem.requestSession
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestSession()`** của giao diện **{{domxref("XRSystem")}}** trả về một {{jsxref("promise")}} phân giải thành đối tượng {{domxref("XRSession")}} thông qua đó bạn có thể quản lý loại phiên WebXR được yêu cầu.

Trong khi chỉ có thể có một phiên VR nhập vai hoạt động tại một thời điểm, nhiều phiên inline có thể đang diễn ra cùng lúc.

## Cú pháp

```js-nolint
requestSession(mode)
requestSession(mode, options)
```

### Tham số

- `mode`
  - : Một {{jsxref("String")}} định nghĩa chế độ phiên XR. Các chế độ được hỗ trợ là:
    - {{Experimental_Inline}} `immersive-ar`: Đầu ra của phiên sẽ được cấp quyền truy cập độc quyền vào thiết bị nhập vai,
      nhưng nội dung được render sẽ được pha trộn với môi trường thực tế.
      {{DOMxRef("XRSession.environmentBlendMode", "environmentBlendMode")}} của phiên chỉ ra phương thức
      để pha trộn nội dung với nhau.
    - `immersive-vr`: Chỉ ra rằng phiên được render sẽ được hiển thị bằng thiết bị XR nhập vai
      ở chế độ VR; nó không nhằm mục đích phủ lên hoặc tích hợp vào môi trường xung quanh.
      {{DOMxRef("XRSession.environmentBlendMode", "environmentBlendMode")}} được mong đợi là
      `opaque` nếu có thể, nhưng có thể là `additive` nếu phần cứng yêu cầu.
    - `inline`: Đầu ra được hiển thị nội tuyến trong ngữ cảnh của một phần tử trong tài liệu HTML tiêu chuẩn,
      thay vì chiếm toàn bộ không gian trực quan. Các phiên inline có thể được trình bày ở chế độ mono hoặc stereo,
      và có thể hoặc không có theo dõi người xem. Các phiên inline không yêu cầu phần cứng đặc biệt và nên
      có sẵn trên bất kỳ {{Glossary("user agent")}} nào hỗ trợ WebXR API.

- `options` {{Optional_Inline}}
  - : Một đối tượng để cấu hình {{domxref("XRSession")}}. Nếu không có tùy chọn nào, thiết bị sẽ sử dụng cấu hình tính năng mặc định cho tất cả các tùy chọn.
    - `requiredFeatures` {{Optional_Inline}}: Một mảng các giá trị mà {{domxref("XRSession")}} được trả về _phải_ hỗ trợ. Xem [Tính năng phiên](#tính-năng-phiên) bên dưới.
    - `optionalFeatures` {{Optional_Inline}}: Một mảng các giá trị xác định các tính năng mà {{domxref("XRSession")}} được trả về có thể tùy chọn hỗ trợ. Xem [Tính năng phiên](#tính-năng-phiên) bên dưới.
    - `domOverlay` {{Optional_Inline}}: Một đối tượng với thuộc tính `root` bắt buộc chỉ định phần tử overlay sẽ được hiển thị cho người dùng như nội dung của DOM overlay.
    - `depthSensing` {{Optional_Inline}}: Một đối tượng với hai thuộc tính bắt buộc {{domxref("XRSession.depthUsage", "usagePreference")}} và {{domxref("XRSession.depthDataFormat", "dataFormatPreference")}} để cấu hình cách thực hiện cảm biến độ sâu.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành đối tượng {{domxref("XRSession")}} nếu thiết bị và tác nhân người dùng hỗ trợ chế độ và tính năng được yêu cầu.

### Ngoại lệ

Phương thức này không ném ngoại lệ thực sự; thay vào đó, nó từ chối promise được trả về, truyền vào một {{domxref("DOMException")}} có `name` là một trong các giá trị sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu chế độ phiên được yêu cầu là `immersive-vr` nhưng đã có một phiên VR nhập vai đang hoạt động hoặc đang trong quá trình thiết lập. Chỉ có thể có một phiên VR nhập vai tại một thời điểm.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được trả về nếu không có thiết bị tương thích WebXR nào có sẵn, hoặc thiết bị không hỗ trợ `sessionMode` được chỉ định; điều này cũng có thể bị ném nếu bất kỳ tùy chọn _bắt buộc_ nào không được hỗ trợ.
- `SecurityError` {{domxref("DOMException")}}
  - : Được trả về nếu quyền truy cập vào chế độ XR được chỉ định bị từ chối. Điều này có thể xảy ra vì một số lý do, được đề cập chi tiết hơn trong [Quyền và bảo mật](/en-US/docs/Web/API/WebXR_Device_API/Permissions_and_security).

## Tính năng phiên

Các tính năng phiên và không gian tham chiếu sau đây có thể được yêu cầu, dưới dạng `optionalFeatures` hoặc `requiredFeatures`.

- `anchors`
  - : Cho phép sử dụng các đối tượng {{domxref("XRAnchor")}}.
- `bounded-floor`
  - : Tương tự như loại `local`, ngoại trừ người dùng không được di chuyển ra ngoài ranh giới được xác định trước, được cung cấp bởi {{domxref("XRBoundedReferenceSpace.boundsGeometry", "boundsGeometry")}} trong đối tượng được trả về.
- `depth-sensing`
  - : Cho phép khả năng thu thập thông tin độ sâu bằng cách sử dụng các đối tượng {{domxref("XRDepthInformation")}}.
- `dom-overlay`
  - : Cho phép chỉ định một phần tử DOM overlay sẽ được hiển thị cho người dùng.
- `hand-tracking`
  - : Cho phép thông tin tư thế bàn tay có khớp từ các bộ điều khiển đầu vào dựa trên bàn tay (xem {{domxref("XRHand")}} và {{domxref("XRInputSource.hand")}}).
- `hit-test`
  - : Cho phép các tính năng kiểm tra va chạm để thực hiện kiểm tra va chạm với hình học thực tế.
- `layers`
  - : Cho phép khả năng tạo các loại layer khác nhau (ngoài {{domxref("XRProjectionLayer")}}).
- `light-estimation`
  - : Cho phép khả năng ước tính điều kiện ánh sáng môi trường bằng cách sử dụng các đối tượng {{domxref("XRLightEstimate")}}.
- `local`
  - : Cho phép một không gian theo dõi có gốc gốc gần vị trí của người xem tại thời điểm phiên được tạo.
- `local-floor`
  - : Tương tự như loại `local`, ngoại trừ vị trí bắt đầu được đặt ở một vị trí an toàn cho người xem đứng.
- `secondary-views`
  - : Cho phép các đối tượng {{domxref("XRView")}} là các chế độ xem phụ.
- `unbounded`
  - : Cho phép một không gian theo dõi cho phép người dùng tự do di chuyển hoàn toàn.
- `viewer`
  - : Cho phép một không gian theo dõi có gốc gốc theo dõi vị trí và hướng của người xem.

## Bảo mật

Một số tính năng phiên và các không gian tham chiếu khác nhau có yêu cầu bảo mật và quyền riêng tư tối thiểu, như yêu cầu sự đồng ý của người dùng hoặc yêu cầu chỉ thị {{HTTPHeader("Permissions-Policy")}}: [`xr-spatial-tracking`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/xr-spatial-tracking) được đặt.

| Tính năng phiên | Yêu cầu đồng ý người dùng      | Yêu cầu chính sách quyền |
| --------------- | ------------------------------ | ------------------------ |
| `bounded-floor` | Luôn bắt buộc                  | `xr-spatial-tracking`    |
| `depth-sensing` | —                              | `xr-spatial-tracking`    |
| `hand-tracking` | Luôn bắt buộc                  | —                        |
| `hit-test`      | —                              | `xr-spatial-tracking`    |
| `local`         | Luôn bắt buộc cho phiên inline | `xr-spatial-tracking`    |
| `local-floor`   | Luôn bắt buộc                  | `xr-spatial-tracking`    |
| `unbounded`     | Luôn bắt buộc                  | `xr-spatial-tracking`    |
| `viewer`        | Luôn bắt buộc                  | —                        |

Xem thêm [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation).

## Ví dụ

### Tạo phiên VR nhập vai

Ví dụ sau gọi `requestSession()` yêu cầu phiên `"immersive-vr"`. Nếu {{jsxref("Promise")}} được phân giải, nó thiết lập một phiên và bắt đầu vòng lặp hoạt ảnh.

```js
navigator.xr
  .requestSession("immersive-vr")
  .then((xrSession) => {
    xrSession.addEventListener("end", onXRSessionEnded);
    // Thực hiện thiết lập phiên cần thiết ở đây.
    // Bắt đầu vòng lặp hoạt ảnh của phiên.
    xrSession.requestAnimationFrame(onXRAnimationFrame);
  })
  .catch((error) => {
    // Phiên "immersive-vr" không được hỗ trợ
    console.error(
      "'immersive-vr' isn't supported, or an error occurred activating VR!",
    );
  });
```

### Xác minh hỗ trợ WebXR và sử dụng nút để bắt đầu chế độ VR

Ví dụ sau cho thấy cách sử dụng cả `isSessionSupported()` và `requestSession()`.

```js
if (navigator.xr) {
  navigator.xr.isSessionSupported("immersive-vr").then((isSupported) => {
    if (isSupported) {
      immersiveButton.addEventListener("click", onButtonClicked);
      immersiveButton.textContent = "Enter XR";
      immersiveButton.disabled = false;
    } else {
      console.error("WebXR doesn't support immersive-vr mode!");
    }
  });
} else {
  console.error("WebXR is not available!");
}

function onButtonClicked() {
  if (!xrSession) {
    navigator.xr.requestSession("immersive-vr").then((session) => {
      xrSession = session;
      // onSessionStarted() không được hiển thị vì lý do ngắn gọn và rõ ràng.
      onSessionStarted(xrSession);
    });
  } else {
    // Nút là nút bật/tắt.
    xrSession.end().then(() => (xrSession = null));
  }
}
```

### Yêu cầu phiên với các tính năng bắt buộc

Yêu cầu một trải nghiệm không giới hạn trong đó người dùng có thể tự do di chuyển xung quanh môi trường vật lý của họ:

```js
navigator.xr.requestSession("immersive-vr", {
  requiredFeatures: ["unbounded"],
});
```

### Yêu cầu phiên với DOM overlay

```js
navigator.xr.requestSession("immersive-ar", {
  optionalFeatures: ["dom-overlay"],
  domOverlay: {
    root: document.getElementById("xr-overlay"),
  },
});
```

### Yêu cầu phiên cảm biến độ sâu

```js
navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["depth-sensing"],
  depthSensing: {
    usagePreference: ["cpu-optimized", "gpu-optimized"],
    dataFormatPreference: ["luminance-alpha", "float32"],
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
