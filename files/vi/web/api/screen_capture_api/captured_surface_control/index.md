---
title: Dùng Captured Surface Control API
slug: Web/API/Screen_Capture_API/Captured_Surface_Control
page-type: guide
---

{{DefaultAPISidebar("Screen Capture API")}}

Hướng dẫn này giải thích cách dùng các tính năng do Captured Surface Control API cung cấp để điều khiển một vùng hiển thị (tab trình duyệt, cửa sổ hoặc màn hình) được ghi bởi [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API).

## Bối cảnh

Screen Capture API thường được dùng để chia sẻ một tab hoặc cửa sổ đang mở trên thiết bị của bạn với những người tham gia họp khác trong một ứng dụng hội nghị, chẳng hạn để trình diễn một tính năng mới hoặc trình bày một báo cáo.

Một vấn đề đáng kể là khi bạn muốn tương tác với vùng hiển thị đã ghi, chẳng hạn cuộn màn hình hoặc phóng to nó, bạn không thể làm vậy nếu không chuyển sang chính vùng hiển thị đã ghi. Điều này tạo ra nhiều rắc rối và khiến ứng dụng khó chịu hơn cần thiết. Người dùng chia sẻ màn hình sẽ phải liên tục qua lại giữa ứng dụng họp và vùng hiển thị được ghi để điều chỉnh nội dung media, cho phép người đến muộn tham gia, đọc tin nhắn chat, v.v.

Captured Surface Control API giải quyết các vấn đề này bằng cách cho phép nhà phát triển triển khai một bộ tính năng giới hạn mà người tham gia cuộc họp có thể dùng để điều khiển vùng hiển thị được ghi trực tiếp ngay trong ứng dụng, mà không làm giảm bảo mật.

Hiện tại, các tính năng đó là:

1. Phóng to vùng hiển thị được ghi.
2. Dùng cử chỉ bánh xe chuột/touchpad (và các dạng tương đương khác) để cuộn vùng hiển thị được ghi.

Toàn bộ chức năng này được truy cập qua đối tượng {{domxref("CaptureController")}}. Để điều khiển một vùng hiển thị được ghi, một capture controller phải được truyền vào lời gọi {{domxref("MediaDevices.getDisplayMedia()")}} bên trong đối tượng tùy chọn của nó:

```js
controller = new CaptureController();

const displayMediaOptions = {
  controller,
};

videoElem.srcObject =
  await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
```

Sau đó, controller có thể được dùng để, ví dụ, phóng to vùng hiển thị được ghi:

```js
controller.increaseZoomLevel();
```

Trong bài viết này chúng ta sẽ đi qua mã của một ứng dụng chia sẻ màn hình cơ bản, cho thấy cách triển khai các tính năng như vậy.

## Lưu ý về quyền

Một website có thể kiểm soát quyền truy cập vào Captured Surface Control API bằng chỉ thị {{HTTPHeader("Permissions-Policy")}} {{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}}, hoặc giá trị thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) tương đương của {{HTMLElement("iframe")}}:

```html
<iframe allow="captured-surface-control" src="/some-other-document.html">
  ...
</iframe>
```

Cụ thể, các phương thức {{domxref("CaptureController.forwardWheel", "forwardWheel()")}}, {{domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()")}}, {{domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()")}} và {{domxref("CaptureController.resetZoomLevel", "resetZoomLevel()")}} được kiểm soát bởi chỉ thị này.

Danh sách cho phép mặc định cho `captured-surface-control` là `self`, cho phép mọi nội dung trong cùng origin dùng Captured Surface Control.

Nếu quyền được cho phép bởi chính sách của website, người dùng sau đó có thể cấp (hoặc từ chối) quyền truy cập vào các API được điều khiển. Quyền này có thể là quyền tường minh, được cấp bằng cách phản hồi một lời nhắc, hoặc quyền ngầm định được cấp khi tương tác với một điều khiển gọi một trong các phương thức ([transient activation](/en-US/docs/Glossary/Transient_activation)) khi quyền của người dùng chưa bị từ chối tường minh.

Xem thêm [Screen Capture API > Security considerations](/en-US/docs/Web/API/Screen_Capture_API#security_considerations).

## HTML của ứng dụng

Đánh dấu cho ứng dụng mẫu của chúng ta như sau:

```html live-sample___surface-control-demo
<h1>Captured Surface Control API demo</h1>

<p>
  <button id="start">Start Capture</button>
  <button id="stop">Stop Capture</button>
</p>
<p id="zoom-controls">
  <button id="dec">Zoom -</button>
  <output>100%</output>
  <button id="inc">Zoom +</button>
  <button id="reset">Reset zoom</button>
</p>

<video autoplay></video>
```

Đoạn này chứa hai nhóm phần tử {{htmlelement("button")}} - một nhóm để bắt đầu và dừng ghi màn hình, và một nhóm để điều khiển việc phóng to vùng hiển thị được ghi. Nhóm sau cũng có một phần tử {{htmlelement("output")}} để in mức zoom hiện tại.

Cuối cùng, chúng ta thêm một phần tử {{htmlelement("video")}} để hiển thị vùng hiển thị được ghi.

## CSS của ứng dụng

CSS của ứng dụng rất tối giản; đáng chú ý là chúng ta đã đặt {{cssxref("max-width")}} của `<video>` là `100%` để nó bị giới hạn bên trong `<body>`. `<video>` có thể lớn lên rất nhiều khi vùng hiển thị được ghi được nhúng vào bên trong nó (kích thước của nó là kích thước nội tại của vùng ghi), điều này có thể gây tràn nếu ta không giới hạn nó.

```css live-sample___surface-control-demo
body {
  max-width: 640px;
  margin: 0 auto;
}

video {
  max-width: 100%;
}
```

## Thiết lập ban đầu

Trong phần script đầu tiên, chúng ta định nghĩa các biến cần để thiết lập ứng dụng:

```js live-sample___surface-control-demo
// Lấy tham chiếu đến phần tử <video> và các điều khiển zoom
const videoElem = document.querySelector("video");
const zoomControls = document.getElementById("zoom-controls");

// Lấy tham chiếu đến các nút bắt đầu và dừng ghi
const startBtn = document.getElementById("start");
const stopBtn = document.getElementById("stop");

// Lấy tham chiếu đến các nút zoom ra, zoom vào, reset,
// và phần tử output hiển thị mức zoom
const decBtn = document.getElementById("dec");
const outputElem = document.querySelector("output");
const incBtn = document.getElementById("inc");
const resetBtn = document.getElementById("reset");

// Định nghĩa các biến để lưu controller và các mức zoom
// sau này chúng ta sẽ tạo chúng
let controller = undefined;
let zoomLevels = undefined;
```

Sau đó, chúng ta ẩn thanh điều khiển surface ban đầu bằng cách đặt thuộc tính CSS {{cssxref("display")}} của nó thành `none`, và vô hiệu hóa nút stop bằng cách đặt thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) thành `true`. Những điều khiển này không liên quan cho đến khi bắt đầu ghi, nên ta không muốn làm người dùng rối ngay từ đầu.

```js live-sample___surface-control-demo
zoomControls.style.display = "none";
stopBtn.disabled = true;
```

## Điều khiển screen capture

Tiếp theo, chúng ta thêm trình nghe sự kiện `click` (dùng {{domxref("EventTarget.addEventListener()")}}) cho các nút start và stop để bắt đầu và dừng ghi màn hình khi chúng được nhấn.

```js live-sample___surface-control-demo
startBtn.addEventListener("click", startCapture);
stopBtn.addEventListener("click", stopCapture);
```

Hàm `startCapture()`, dùng để bắt đầu ghi màn hình, trông như sau. Trước tiên chúng ta tạo một `CaptureController` mới, rồi truyền nó vào đối tượng [`MediaDisplayOptions`](/en-US/docs/Web/API/MediaDevices/getDisplayMedia#options) cùng với một ràng buộc [`displaySurface`](/en-US/docs/Web/API/MediaTrackConstraints/displaySurface) khiến ứng dụng khuyến nghị chia sẻ các tab trình duyệt.

Bây giờ là lúc ghi media; chúng ta làm điều đó bằng một lời gọi {{domxref("MediaDevices.getDisplayMedia()")}}, truyền cho nó đối tượng tùy chọn của chúng ta, rồi gán promise kết quả cho thuộc tính {{domxref("HTMLMediaElement.srcObject", "srcObject")}} của phần tử `<video>`. Khi nó được giải quyết, chúng ta tiếp tục hàm bằng cách gọi {{domxref("CaptureController.resetZoomLevel()")}} và đặt nội dung của phần tử `<output>` thành `100%`. Điều này không hoàn toàn bắt buộc, nhưng có thể hơi khó hiểu khi bạn ghi một tab rồi thấy nó đã bị zoom ra hoặc zoom vào sẵn. Đặt mức zoom về `100%` khi bắt đầu ghi cảm giác hợp lý hơn. Các dòng này xử lý trường hợp ứng dụng được tải lại mà không bấm "Stop Capture", rồi việc ghi được bắt đầu lại.

Bước tiếp theo là gọi {{domxref("CaptureController.getSupportedZoomLevels()")}} để lấy các mức zoom mà vùng hiển thị được ghi hỗ trợ, rồi lưu mảng kết quả vào biến `zoomLevels`.

Tiếp theo, chúng ta dùng sự kiện {{domxref("CaptureController.zoomlevelchange_event", "zoomlevelchange")}} của controller để phát hiện khi mức zoom thay đổi, in {{domxref("CaptureController.zoomLevel", "zoomLevel")}} hiện tại ra phần tử `<output>`, và gọi hàm `updateZoomButtonState()` do người dùng định nghĩa. Hàm này sẽ truy vấn mảng `zoomLevels` để kiểm tra xem người dùng còn có thể zoom vào hay zoom ra thêm sau mỗi lần thay đổi zoom hay không. Chúng ta sẽ giải thích `updateZoomButtonState()` sau.

Sau đó chúng ta hiện lại thanh điều khiển zoom bằng `display: block`, bật nút stop, và vô hiệu hóa nút start để trạng thái điều khiển có ý nghĩa sau khi việc ghi đã bắt đầu.

Để kết thúc hàm, chúng ta gọi {{domxref("CaptureController.setFocusBehavior()")}} để ngăn việc focus chuyển sang tab được ghi khi việc ghi bắt đầu, và gọi hàm `startForwarding()` do người dùng định nghĩa để bật việc cuộn vùng hiển thị được ghi bằng cử chỉ bánh xe/touchpad. Chúng ta sẽ giải thích hàm này sau.

```js live-sample___surface-control-demo
async function startCapture() {
  try {
    // Tạo một thể hiện CaptureController mới
    controller = new CaptureController();

    // Tùy chọn cho getDisplayMedia()
    const displayMediaOptions = {
      controller,
      video: {
        displaySurface: "browser",
      },
    };

    // Ghi một tab và hiển thị nó bên trong phần tử video
    videoElem.srcObject =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);

    // Đặt lại mức zoom khi bắt đầu ghi
    controller.resetZoomLevel();
    outputElem.textContent = `100%`;

    // Lấy các mức zoom của vùng hiển thị đang được ghi
    zoomLevels = controller.getSupportedZoomLevels();

    // Báo cáo mức zoom khi nó thay đổi
    controller.addEventListener("zoomlevelchange", () => {
      outputElem.textContent = `${controller.zoomLevel}%`;
      updateZoomButtonState();
    });

    zoomControls.style.display = "block";
    stopBtn.disabled = false;
    startBtn.disabled = true;

    // Ngăn focus nhảy sang tab được ghi, nếu bạn đang tự chia sẻ
    controller.setFocusBehavior("focus-capturing-application");

    // Bắt đầu chuyển tiếp các sự kiện wheel
    startForwarding();
  } catch (e) {
    console.error(e);
  }
}
```

Bây giờ đến định nghĩa hàm `stopCapture()`, dùng để dừng ghi màn hình. Chúng ta bắt đầu hàm này bằng cách lại gọi {{domxref("CaptureController.resetZoomLevel()")}} và đặt nội dung của phần tử `<output>` thành `100%` để đặt lại mức zoom. Điều này xử lý trường hợp bạn dừng ghi bằng nút "Stop Capture" rồi bắt đầu lại.

Sau đó chúng ta lặp qua tất cả các đối tượng {{domxref("MediaStreamTrack")}} liên kết với {{domxref("MediaStream")}} và gọi {{domxref("MediaStreamTrack.stop", "stop()")}} cho từng đối tượng. Tiếp theo chúng ta gọi hàm `resetApp()`, hàm này đặt lại `srcObject` của phần tử `<video>` về `null`, ẩn các điều khiển zoom, vô hiệu hóa nút stop và bật nút start.

```js live-sample___surface-control-demo
function stopCapture() {
  let tracks = videoElem.srcObject.getTracks();
  tracks.forEach((track) => track.stop());
  resetApp();
}

function resetApp() {
  videoElem.srcObject = null;
  zoomControls.style.display = "none";
  stopBtn.disabled = true;
  startBtn.disabled = false;
}
```

## Triển khai điều khiển zoom

Ở phần tiếp theo của script, chúng ta gắn các nút zoom vào các hàm xử lý `click` phù hợp để có thể zoom vùng hiển thị được ghi vào và ra. Các hàm được chạy khi nhấp như sau:

- Nút "Zoom out": `decreaseZoom()`. Hàm này gọi phương thức {{domxref("CaptureController.decreaseZoomLevel()")}}, làm vùng ghi zoom ra.
- Nút "Zoom in": `increaseZoom()`. Hàm này gọi phương thức {{domxref("CaptureController.increaseZoomLevel()")}}, làm vùng ghi zoom vào.
- Nút "Reset zoom": `resetZoom()`. Hàm này gọi phương thức {{domxref("CaptureController.resetZoomLevel()")}}, đặt lại vùng ghi về mức zoom ban đầu là `100`.

```js live-sample___surface-control-demo
decBtn.addEventListener("click", decreaseZoom);
incBtn.addEventListener("click", increaseZoom);
resetBtn.addEventListener("click", resetZoom);

async function decreaseZoom() {
  try {
    await controller.decreaseZoomLevel();
  } catch (e) {
    console.log(e);
  }
}

async function increaseZoom() {
  try {
    await controller.increaseZoomLevel();
  } catch (e) {
    console.log(e);
  }
}

async function resetZoom() {
  await controller.resetZoomLevel();
}
```

> [!NOTE]
> Nhìn chung, nên gọi `decreaseZoomLevel()` và `increaseZoomLevel()` trong một khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) vì mức zoom có thể bị thay đổi không đồng bộ bởi một thực thể khác ngoài ứng dụng, điều này có thể khiến lỗi bị ném ra. Ví dụ, người dùng có thể trực tiếp tương tác với vùng hiển thị được ghi để zoom vào hoặc ra.

Khi mức zoom thay đổi, sự kiện {{domxref("CaptureController.zoomlevelchange_event", "zoomlevelchange")}} của controller sẽ được kích hoạt, khiến đoạn mã chúng ta thấy trước đó trong hàm `startCapture()` chạy, ghi mức zoom đã cập nhật vào phần tử `<output>` và chạy hàm `updateZoomButtonState()` để ngăn người dùng zoom vào hoặc ra quá xa.

```js
controller.addEventListener("zoomlevelchange", () => {
  outputElem.textContent = `${controller.zoomLevel}%`;
  updateZoomButtonState();
});
```

## Chuyển tiếp sự kiện wheel tới vùng hiển thị được ghi

Trước đó, ở cuối hàm `startCapture()`, chúng ta đã gọi hàm `startForwarding()`, cho phép vùng hiển thị được ghi được cuộn từ ứng dụng đang ghi. Hàm này chạy phương thức {{domxref("CaptureController.forwardWheel()")}}, và chúng ta truyền vào tham chiếu tới phần tử `<video>`. Khi promise trả về được giải quyết, trình duyệt bắt đầu chuyển tiếp mọi sự kiện {{domxref("Element.wheel_event", "wheel")}} được phát trên `<video>` tới tab hoặc cửa sổ được ghi, để nó có thể cuộn.

```js live-sample___surface-control-demo
async function startForwarding() {
  try {
    await controller.forwardWheel(videoElem);
  } catch (e) {
    console.log(e);
  }
}
```

## Ngăn người dùng zoom quá xa

Cuối cùng, đã đến lúc định nghĩa hàm `updateZoomButtonState()`, hàm này được chạy bên trong trình xử lý sự kiện `zoomlevelchange` mà bạn thấy trước đó. Vấn đề mà hàm này giải quyết là nếu bạn cố zoom ra thấp hơn mức zoom tối thiểu được hỗ trợ, hoặc zoom vào cao hơn mức zoom tối đa được hỗ trợ, `decreaseZoomLevel()`/`increaseZoomLevel()` sẽ ném ra một {{domxref("DOMException")}} `InvalidStateError`.

Hàm `updateZoomButtonState()` tránh vấn đề này bằng cách đầu tiên bảo đảm cả hai nút "Zoom out" và "Zoom in" đều được bật. Sau đó nó thực hiện hai kiểm tra:

- Nếu mức zoom hiện tại (được trả về bởi thuộc tính {{domxref("CaptureController.zoomLevel", "zoomLevel")}}) bằng mức zoom tối thiểu được hỗ trợ (được lưu ở giá trị đầu tiên của mảng `zoomLevels`), chúng ta vô hiệu hóa nút "Zoom out" để người dùng không thể zoom ra thêm.
- Nếu mức zoom hiện tại bằng mức zoom tối đa được hỗ trợ (được lưu ở giá trị cuối cùng của mảng `zoomLevels`), chúng ta vô hiệu hóa nút "Zoom in" để người dùng không thể zoom vào thêm.

```js live-sample___surface-control-demo
function updateZoomButtonState() {
  decBtn.disabled = false;
  incBtn.disabled = false;
  if (controller.zoomLevel === zoomLevels[0]) {
    decBtn.disabled = true;
  } else if (controller.zoomLevel === zoomLevels[zoomLevels.length - 1]) {
    incBtn.disabled = true;
  }
}
```

## Bản demo hoàn chỉnh

Bản demo hoàn chỉnh hiển thị như sau:

{{EmbedLiveSample("surface-control-demo", , "500px", , , , "display-capture; captured-surface-control")}}
