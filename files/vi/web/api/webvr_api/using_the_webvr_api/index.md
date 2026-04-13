---
title: Using the WebVR API
slug: Web/API/WebVR_API/Using_the_WebVR_API
page-type: guide
---

{{DefaultAPISidebar("WebVR API")}}

> [!NOTE]
> WebVR API được thay thế bởi [WebXR API](/en-US/docs/Web/API/WebXR_Device_API). WebVR chưa bao giờ được phê chuẩn thành một tiêu chuẩn, chỉ được triển khai và bật mặc định trong rất ít trình duyệt, và chỉ hỗ trợ một số ít thiết bị.

WebVR API là một bổ sung rất hữu ích cho bộ công cụ của nhà phát triển web, cho phép các cảnh WebGL được hiển thị trong các màn hình thực tế ảo như Oculus Rift và HTC Vive. Nhưng làm thế nào để bạn bắt đầu phát triển ứng dụng VR cho web? Bài viết này sẽ hướng dẫn bạn các bước cơ bản.

## Bắt đầu

Để bắt đầu, bạn cần:

- Phần cứng VR được hỗ trợ.
  - Tùy chọn rẻ nhất là dùng một thiết bị di động, trình duyệt hỗ trợ và bộ gắn thiết bị (ví dụ, Google Cardboard). Trải nghiệm sẽ không tốt bằng phần cứng chuyên dụng, nhưng bạn sẽ không cần mua một máy tính mạnh hay màn hình VR chuyên dụng.
  - Phần cứng chuyên dụng có thể tốn kém, nhưng mang lại trải nghiệm tốt hơn. Phần cứng tương thích WebVR nhất hiện tại là HTC VIVE và Oculus Rift. Trang chủ của [webvr.info](https://webvr.info/) có thêm một số thông tin hữu ích về phần cứng sẵn có và trình duyệt nào hỗ trợ chúng.

- Một máy tính đủ mạnh để xử lý việc render/hiển thị cảnh VR bằng phần cứng VR chuyên dụng của bạn, nếu cần. Để biết bạn cần gì, hãy xem hướng dẫn tương ứng cho bộ VR bạn định mua (ví dụ, [VIVE READY Computers](https://www.vive.com/us/vive-ready/)).
- Một trình duyệt được hỗ trợ đã cài đặt - [Firefox Nightly](https://www.firefox.com/en-US/channel/desktop/) mới nhất hoặc [Chrome](https://www.google.com/chrome/index.html) là lựa chọn tốt nhất hiện nay, trên máy tính để bàn hoặc di động.

Khi đã chuẩn bị xong mọi thứ, bạn có thể kiểm tra xem thiết lập của mình có hoạt động với WebVR hay không bằng cách truy cập [bản demo A-Frame đơn giản](https://mdn.github.io/webvr-tests/webvr/aframe-demo/) của chúng tôi, rồi xem cảnh có render hay không và bạn có thể vào chế độ hiển thị VR bằng cách nhấn nút ở góc dưới bên phải hay không.

[A-Frame](https://aframe.io/) cho đến nay là lựa chọn tốt nhất nếu bạn muốn tạo nhanh một cảnh 3D tương thích WebVR mà không cần hiểu quá nhiều mã JavaScript mới. Tuy nhiên nó không dạy bạn cách API WebVR thô hoạt động, và đó là điều chúng ta sẽ nói đến tiếp theo.

## Giới thiệu demo của chúng tôi

Để minh họa cách WebVR API hoạt động, chúng ta sẽ xem xét ví dụ raw-webgl-example của mình, trông hơi giống như thế này:

![A gray rotating 3D cube](capture1.png)

> [!NOTE]
> Bạn có thể tìm thấy [mã nguồn demo của chúng tôi](https://github.com/mdn/webvr-tests/tree/main/webvr/raw-webgl-example) trên GitHub, và [xem trực tiếp ở đây](https://mdn.github.io/webvr-tests/webvr/raw-webgl-example/).

> [!NOTE]
> Nếu WebVR không hoạt động trong trình duyệt của bạn, bạn có thể cần bảo đảm nó đang chạy thông qua card đồ họa của bạn. Ví dụ, với card NVIDIA, nếu bạn đã thiết lập thành công NVIDIA control panel, sẽ có một tùy chọn trong menu ngữ cảnh - nhấp chuột phải vào Firefox, rồi chọn _Run with graphics processor > High-performance NVIDIA processor_.

Demo của chúng tôi có viên ngọc kinh điển của các demo WebGL - một khối lập phương 3D đang quay. Chúng tôi triển khai nó bằng mã thuần [WebGL API](/en-US/docs/Web/API/WebGL_API). Chúng tôi sẽ không dạy JavaScript hay WebGL cơ bản, chỉ phần WebVR.

Demo của chúng tôi cũng có:

- Một nút để bắt đầu (và dừng) việc trình chiếu cảnh của chúng tôi trong màn hình VR.
- Một nút để hiện (và ẩn) dữ liệu pose VR, tức là vị trí và hướng của headset, được cập nhật theo thời gian thực.

Khi bạn xem mã nguồn của [tệp JavaScript chính của demo](https://github.com/mdn/webvr-tests/blob/main/webvr/raw-webgl-example/webgl-demo.js), bạn có thể dễ dàng tìm thấy các phần dành riêng cho WebVR bằng cách tìm chuỗi "WebVR" trong các chú thích phía trước.

> [!NOTE]
> Để tìm hiểu thêm về JavaScript cơ bản và WebGL, hãy tham khảo [tài liệu học JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) và [WebGL Tutorial](/en-US/docs/Web/API/WebGL_API/Tutorial).

## Nó hoạt động thế nào?

Ở thời điểm này, hãy xem các phần WebVR của mã hoạt động ra sao.

Một ứng dụng WebVR điển hình (đơn giản) hoạt động như sau:

1. {{domxref("Navigator.getVRDisplays()")}} được dùng để lấy tham chiếu tới màn hình VR của bạn.
2. {{domxref("VRDisplay.requestPresent()")}} được dùng để bắt đầu trình chiếu lên màn hình VR.
3. Phương thức chuyên dụng của WebVR, {{domxref("VRDisplay.requestAnimationFrame()")}}, được dùng để chạy vòng lặp render của ứng dụng ở tốc độ làm mới phù hợp với màn hình.
4. Bên trong vòng lặp render, bạn lấy dữ liệu cần để hiển thị khung hiện tại ({{domxref("VRDisplay.getFrameData()")}}), vẽ cảnh hiển thị hai lần - một lần cho góc nhìn của mỗi mắt - rồi gửi khung đã render tới màn hình để hiển thị cho người dùng qua ({{domxref("VRDisplay.submitFrame()")}}).

Ở các phần dưới đây, chúng ta sẽ xem chi tiết raw-webgl-demo của mình và xem chính xác các tính năng trên được dùng ở đâu.

### Bắt đầu với một số biến

Phần mã liên quan đến WebVR đầu tiên bạn sẽ gặp là khối sau:

```js
// WebVR variables

const frameData = new VRFrameData();
let vrDisplay;
const btn = document.querySelector(".stop-start");
let normalSceneFrame;
let vrSceneFrame;

const poseStatsBtn = document.querySelector(".pose-stats");
const poseStatsSection = document.querySelector("section");
poseStatsSection.style.visibility = "hidden"; // hide it initially

const posStats = document.querySelector(".pos");
const orientStats = document.querySelector(".orient");
const linVelStats = document.querySelector(".lin-vel");
const linAccStats = document.querySelector(".lin-acc");
const angVelStats = document.querySelector(".ang-vel");
const angAccStats = document.querySelector(".ang-acc");
let poseStatsDisplayed = false;
```

Hãy giải thích ngắn gọn:

- `frameData` chứa một đối tượng {{domxref("VRFrameData")}}, được tạo bằng hàm tạo {{domxref("VRFrameData.VRFrameData", "VRFrameData()")}}. Ban đầu nó rỗng, nhưng sau này sẽ chứa dữ liệu cần để render từng khung hiển thị trên màn hình VR, được cập nhật liên tục khi vòng lặp render chạy.
- `vrDisplay` ban đầu chưa được khởi tạo, nhưng về sau sẽ giữ tham chiếu tới headset VR của chúng ta ({{domxref("VRDisplay")}} - đối tượng điều khiển trung tâm của API).
- `btn` và `poseStatsBtn` giữ tham chiếu tới hai nút chúng ta dùng để điều khiển ứng dụng.
- `normalSceneFrame` và `vrSceneFrame` ban đầu chưa được khởi tạo, nhưng về sau sẽ giữ tham chiếu tới các lời gọi {{domxref("Window.requestAnimationFrame()")}} và {{domxref("VRDisplay.requestAnimationFrame()")}} - chúng sẽ kích hoạt một vòng lặp render bình thường và một vòng lặp render WebVR đặc biệt; chúng ta sẽ giải thích sự khác nhau giữa hai vòng này ở phần sau.
- Các biến còn lại lưu tham chiếu tới các phần khác nhau của hộp hiển thị dữ liệu pose VR, mà bạn có thể thấy ở góc dưới bên phải của giao diện.

### Lấy tham chiếu tới màn hình VR của chúng ta

Để bắt đầu, chúng ta lấy một ngữ cảnh WebGL để dùng render đồ họa 3D vào phần tử {{htmlelement("canvas")}} trong [HTML của chúng ta](https://github.com/mdn/webvr-tests/blob/main/webvr/raw-webgl-example/index.html). Sau đó chúng ta kiểm tra xem ngữ cảnh `gl` có khả dụng hay không - nếu có, chúng ta chạy một số hàm để thiết lập cảnh hiển thị.

```js
const canvas = document.getElementById("gl-canvas");

initWebGL(canvas); // Initialize the GL context

// WebGL setup code here
```

Tiếp theo, chúng ta bắt đầu quá trình render cảnh thực sự lên canvas, bằng cách đặt canvas chiếm toàn bộ viewport của trình duyệt và chạy vòng lặp render (`drawScene()`) lần đầu tiên. Đây là vòng lặp render bình thường, không phải WebVR.

```js
// draw the scene normally, without WebVR - for those who don't have it and want to see the scene in their browser

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
drawScene();
```

Bây giờ đến đoạn mã WebVR đầu tiên. Trước hết, chúng ta kiểm tra xem {{domxref("Navigator.getVRDisplays")}} có tồn tại hay không - đây là điểm vào của API, và do đó là cách phát hiện tính năng cơ bản tốt cho WebVR. Nếu nó không tồn tại, chúng ta ghi một thông điệp để cho biết WebVR 1.1 không được trình duyệt hỗ trợ.

```js
// WebVR: Check to see if WebVR is supported
if (navigator.getVRDisplays) {
  console.log("WebVR 1.1 supported");
  // ...
} else {
  console.log("WebVR API not supported by this browser.");
}
```

Phần còn lại của mã nằm trong khối `if (navigator.getVRDisplays) { }`, ताकि chỉ chạy khi WebVR được hỗ trợ.

Chúng ta trước tiên gọi hàm {{domxref("Navigator.getVRDisplays()")}}. Hàm này trả về một promise, được fulfill với một mảng chứa tất cả các thiết bị màn hình VR đang kết nối với máy tính. Nếu không có thiết bị nào được kết nối, mảng sẽ rỗng.

Bên trong khối `then()` của promise, chúng ta kiểm tra xem độ dài của mảng có lớn hơn 0 hay không; nếu có, chúng ta gán giá trị của biến `vrDisplay` thành phần tử ở vị trí 0 trong mảng. `vrDisplay` giờ chứa một đối tượng {{domxref("VRDisplay")}} đại diện cho màn hình đã kết nối của chúng ta!

```js
// Then get the displays attached to the computer
navigator.getVRDisplays().then((displays) => {
  // If a display is available, use it to present the scene
  if (displays.length > 0) {
    vrDisplay = displays[0];
    console.log("Display found");
    // ...
  }
});
```

Phần còn lại của mã nằm trong khối `if (displays.length > 0) { }`, ताकि chỉ chạy nếu có ít nhất một màn hình VR khả dụng.

> [!NOTE]
> Khả năng bạn có nhiều màn hình VR được kết nối với máy tính là khá thấp, và đây chỉ là một demo đơn giản, nên như vậy là đủ cho bây giờ.

### Bắt đầu và dừng trình chiếu VR

Bây giờ chúng ta đã có một đối tượng {{domxref("VRDisplay")}}, có thể dùng nó để làm nhiều việc. Việc tiếp theo chúng ta muốn làm là gắn chức năng để bắt đầu và dừng việc trình chiếu nội dung WebGL lên màn hình.

Tiếp tục với khối mã trước đó, giờ chúng ta thêm một trình lắng nghe sự kiện vào nút bắt đầu/dừng (`btn`) - khi nút này được nhấn, chúng ta muốn kiểm tra xem mình đã đang trình chiếu lên màn hình hay chưa (chúng ta làm điều này khá đơn giản, bằng cách kiểm tra `textContent` của nút chứa gì).

Nếu màn hình chưa trình chiếu, chúng ta dùng phương thức {{domxref("VRDisplay.requestPresent()")}} để yêu cầu trình duyệt bắt đầu trình chiếu nội dung lên màn hình. Phương thức này nhận một mảng các đối tượng {{domxref("VRLayerInit")}} mô tả các lớp bạn muốn trình chiếu trong màn hình.

Vì số lớp tối đa bạn có thể hiển thị hiện tại là 1, và thành viên đối tượng duy nhất bắt buộc là thuộc tính {{domxref("VRLayerInit.source")}} (là tham chiếu tới {{htmlelement("canvas")}} bạn muốn trình chiếu trong lớp đó; các tham số khác có giá trị mặc định hợp lý - xem {{domxref("VRLayerInit.leftBounds", "leftBounds")}} và {{domxref("VRLayerInit.rightBounds", "rightBounds")}}), nên tham số là `[{ source: canvas }]`.

`requestPresent()` trả về một promise được fulfill khi việc trình chiếu bắt đầu thành công.

```js
// Starting the presentation when the button is clicked: It can only be called in response to a user gesture
btn.addEventListener("click", () => {
  if (btn.textContent === "Start VR display") {
    vrDisplay.requestPresent([{ source: canvas }]).then(() => {
      console.log("Presenting to WebVR display");
      // ...
    });
  } else {
    // ...
  }
});
```

Khi yêu cầu trình chiếu thành công, chúng ta muốn bắt đầu thiết lập để render nội dung cho VRDisplay. Trước hết, ta đặt canvas có cùng kích thước với vùng hiển thị VR. Ta làm điều này bằng cách lấy {{domxref("VREyeParameters")}} cho cả hai mắt bằng {{domxref("VRDisplay.getEyeParameters()")}}.

Sau đó, ta dùng một chút toán học đơn giản để tính tổng chiều rộng của vùng render VRDisplay dựa trên {{domxref("VREyeParameters.renderWidth")}} và {{domxref("VREyeParameters.renderHeight")}} của mỗi mắt.

```js
vrDisplay.requestPresent([{ source: canvas }]).then(() => {
  // ...
  // Set the canvas size to the size of the vrDisplay viewport

  const leftEye = vrDisplay.getEyeParameters("left");
  const rightEye = vrDisplay.getEyeParameters("right");

  canvas.width = Math.max(leftEye.renderWidth, rightEye.renderWidth) * 2;
  canvas.height = Math.max(leftEye.renderHeight, rightEye.renderHeight);
  // ...
});
```

Tiếp theo, chúng ta [hủy vòng lặp animation](/en-US/docs/Web/API/Window/cancelAnimationFrame) đã được khởi động trước đó bởi lời gọi {{domxref("Window.requestAnimationFrame()")}} trong hàm `drawScene()`, rồi gọi `drawVRScene()` thay thế. Hàm này render cùng cảnh như trước, nhưng có thêm một chút "phép thuật" WebVR đặc biệt. Vòng lặp bên trong được duy trì bởi phương thức đặc biệt của WebVR là {{domxref("VRDisplay.requestAnimationFrame")}}.

```js
vrDisplay.requestPresent([{ source: canvas }]).then(() => {
  // ...
  // stop the normal presentation, and start the vr presentation
  window.cancelAnimationFrame(normalSceneFrame);
  drawVRScene();
  // ...
});
```

Cuối cùng, chúng ta cập nhật văn bản của nút để lần tới khi nó được nhấn, nó sẽ dừng trình chiếu lên màn hình VR.

```js
vrDisplay.requestPresent([{ source: canvas }]).then(() => {
  // ...
  btn.textContent = "Exit VR display";
});
```

Để dừng trình chiếu VR khi nút được nhấn lần sau, chúng ta gọi {{domxref("VRDisplay.exitPresent()")}}. Chúng ta cũng đảo lại nội dung văn bản của nút, và chuyển đổi các lời gọi `requestAnimationFrame`. Ở đây bạn có thể thấy chúng ta dùng {{domxref("VRDisplay.cancelAnimationFrame")}} để dừng vòng lặp render VR, rồi khởi động lại vòng lặp render bình thường bằng cách gọi `drawScene()`.

```js
if (btn.textContent === "Start VR display") {
  // ...
} else {
  vrDisplay.exitPresent();
  console.log("Stopped presenting to WebVR display");

  btn.textContent = "Start VR display";

  // Stop the VR presentation, and start the normal presentation
  vrDisplay.cancelAnimationFrame(vrSceneFrame);
  drawScene();
}
```

Khi trình chiếu bắt đầu, bạn sẽ có thể thấy ...
