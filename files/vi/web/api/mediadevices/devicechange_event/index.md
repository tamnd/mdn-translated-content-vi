---
title: "MediaDevices: devicechange event"
short-title: devicechange
slug: Web/API/MediaDevices/devicechange_event
page-type: web-api-event
browser-compat: api.MediaDevices.devicechange_event
---

{{APIRef("Media Capture and Streams")}}{{SecureContext_Header}}

Sự kiện **`devicechange`** được gửi tới một thể hiện {{domxref("MediaDevices")}} bất cứ khi nào một thiết bị phương tiện như camera, microphone hoặc loa được kết nối vào hoặc tháo ra khỏi hệ thống.

Sự kiện này không thể bị hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("devicechange", (event) => { })

ondevicechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Trong ví dụ này, chúng ta tạo một hàm tên `updateDeviceList()`, được gọi một lần khi {{domxref("MediaDevices.getUserMedia()")}} lấy thành công một stream, và sau đó được gọi bất cứ khi nào danh sách thiết bị thay đổi. Nó hiển thị trong cửa sổ trình duyệt hai danh sách: một cho thiết bị âm thanh và một cho thiết bị video, với cả nhãn (tên) của thiết bị và việc nó là thiết bị đầu vào hay đầu ra. Vì ví dụ cung cấp một trình xử lý cho sự kiện `devicechange`, danh sách sẽ được làm mới bất cứ khi nào một thiết bị phương tiện được gắn vào hoặc tháo ra khỏi thiết bị đang chạy mẫu này.

```html hidden
<p>Nhấn nút bắt đầu bên dưới để khởi chạy phần trình diễn.</p>
<div id="startButton" class="button">Start</div>
<video id="video" width="160" height="120" autoplay></video><br />

<div class="left">
  <h2>Audio devices:</h2>
  <ul class="deviceList" id="audioList"></ul>
</div>
<div class="right">
  <h2>Video devices:</h2>
  <ul class="deviceList" id="videoList"></ul>
</div>

<output></output>
```

```css hidden
body {
  font:
    14px "Open Sans",
    "Arial",
    sans-serif;
}

video {
  margin-top: 20px;
  border: 1px solid black;
}

.button {
  cursor: pointer;
  width: 160px;
  border: 1px solid black;
  font-size: 16px;
  text-align: center;
  padding-top: 2px;
  padding-bottom: 4px;
  color: white;
  background-color: darkgreen;
}

h2 {
  margin-bottom: 4px;
}

.left {
  float: left;
  width: 48%;
  margin-right: 2%;
}

.right {
  float: right;
  width: 48%;
  margin-left: 2%;
}

.deviceList {
  border: 1px solid black;
  list-style-type: none;
  margin-top: 2px;
  padding: 6px;
}
```

```js hidden
// UI elements
const videoElement = document.querySelector("#video");
const logElement = document.querySelector("output");
const startButton = document.querySelector("#startButton");

function log(msg) {
  logElement.innerText += `${msg}\n`;
}

startButton.addEventListener("click", () => {
  const constraints = {
    video: {
      width: 160,
      height: 120,
      frameRate: 30,
    },
    audio: {
      sampleRate: 44100,
      sampleSize: 16,
      volume: 0.25,
    },
  };

  navigator.mediaDevices
    .getUserMedia(constraints)
    .then((stream) => {
      videoElement.srcObject = stream;
      updateDeviceList();
    })
    .catch((err) => {
      log(`${err.name}: ${err.message}`);
    });
});
```

Chúng ta thiết lập các biến toàn cục chứa tham chiếu tới các phần tử {{HTMLElement("ul")}}
dùng để liệt kê các thiết bị âm thanh và video:

```js
const audioList = document.getElementById("audioList");
const videoList = document.getElementById("videoList");
```

### Lấy và vẽ danh sách thiết bị

Bây giờ hãy xem `updateDeviceList()` hoạt động như thế nào. Phương thức này được gọi bất cứ khi nào chúng ta muốn lấy danh sách thiết bị phương tiện hiện tại rồi cập nhật các danh sách âm thanh và video đang hiển thị bằng thông tin đó.

```js
function updateDeviceList() {
  navigator.mediaDevices.enumerateDevices().then((devices) => {
    audioList.textContent = "";
    videoList.textContent = "";

    devices.forEach((device) => {
      const elem = document.createElement("li");
      const [kind, type, direction] = device.kind.match(/(\w+)(input|output)/i);

      elem.innerHTML = `<strong>${device.label}</strong> (${direction})`;
      if (type === "audio") {
        audioList.appendChild(elem);
      } else if (type === "video") {
        videoList.appendChild(elem);
      }
    });
  });
}
```

`updateDeviceList()` chỉ gồm một lời gọi tới hàm
{{domxref("MediaDevices.enumerateDevices", "enumerateDevices()")}} trên đối tượng
{{domxref("MediaDevices")}} được tham chiếu trong thuộc tính
{{domxref("navigator.mediaDevices")}}, cùng với mã được chạy khi {{jsxref("promise")}}
trả về bởi `enumerateDevices()` được fulfilled. Trình xử lý fulfillment được gọi khi danh sách thiết bị sẵn sàng. Danh sách được truyền vào trình xử lý dưới dạng một mảng các đối tượng {{domxref("MediaDeviceInfo")}}, mỗi đối tượng mô tả một thiết bị đầu vào hoặc đầu ra phương tiện.

Vòng lặp {{jsxref("Array.forEach", "forEach()")}} được dùng để duyệt qua toàn bộ thiết bị. Với mỗi thiết bị, chúng ta tạo một đối tượng {{HTMLElement("li")}} mới để hiển thị nó cho người dùng.

Dòng
`let [kind, type, direction] = device.kind.match(/(\w+)(input|output)/i);`
xứng đáng được chú ý đặc biệt. Nó dùng [destructuring assignment](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) để gán các giá trị của ba phần tử đầu tiên trong mảng trả về bởi
{{jsxref("String.match()")}} cho các biến `kind`, `type`, và
`direction`. Chúng ta làm vậy vì giá trị của
{{domxref("MediaDeviceInfo.kind")}} là một chuỗi đơn chứa cả kiểu phương tiện
và hướng dữ liệu di chuyển, chẳng hạn `"audioinput"` hoặc `"videooutput"`. Vì vậy dòng này tách ra kiểu ("audio" hoặc "video") và hướng ("input" hoặc "output") để có thể dùng chúng để xây dựng chuỗi hiển thị trong danh sách.

Sau khi chuỗi được ghép xong, gồm tên thiết bị in đậm và hướng trong ngoặc,
nó được thêm vào danh sách thích hợp bằng cách gọi
{{domxref("Node.appendChild", "appendChild()")}} trên `audioList` hoặc
`videoList`, tùy theo kiểu thiết bị.

### Xử lý thay đổi danh sách thiết bị

Chúng ta gọi `updateDeviceList()` ở hai nơi. Thứ nhất là trong trình xử lý fulfillment của promise từ
{{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}, để điền danh sách ban đầu khi stream được mở. Thứ hai là trong trình xử lý sự kiện cho sự kiện `devicechange` này:

```js
navigator.mediaDevices.ondevicechange = (event) => {
  updateDeviceList();
};
```

Với đoạn mã này, mỗi khi người dùng cắm camera, microphone hoặc một thiết bị phương tiện khác, hoặc bật/tắt một thiết bị như vậy, chúng ta gọi `updateDeviceList()` để vẽ lại danh sách thiết bị đã kết nối.

### Kết quả

{{ EmbedLiveSample('Example', 600, 460, "", "", "", "camera;microphone") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
