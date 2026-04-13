---
title: Sử dụng Media Capabilities API
slug: Web/API/Media_Capabilities_API/Using_the_Media_Capabilities_API
page-type: guide
browser-compat: api.MediaCapabilities
---

{{DefaultAPISidebar("Media Capabilities API")}}

[Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API) cho phép bạn truy vấn trình duyệt để xác định khả năng mã hóa hoặc giải mã media với một tập hợp tham số mã hóa nhất định. Các tham số này có thể bao gồm codec, độ phân giải, tốc độ bit, tốc độ khung hình và các thông tin tương tự.

Với Media Capabilities API, bạn có thể xác định không chỉ liệu trình duyệt có thể hỗ trợ định dạng nhất định hay không, mà còn liệu nó có thể thực hiện điều đó một cách hiệu quả và mượt mà hay không. Tóm lại, API này thay thế và cải tiến phương thức {{domxref("MediaSource")}} {{domxref("MediaSource/isTypeSupported_static", "isTypeSupported()")}} hoặc phương thức {{domxref("HTMLMediaElement")}} {{domxref("HTMLMediaElement.canPlayType","canPlayType()")}}.

## Giao diện MediaCapabilities

{{domxref("MediaCapabilities")}} có sẵn thông qua thuộc tính {{domxref("Navigator.mediaCapabilities", "mediaCapabilities")}} được cung cấp bởi cả đối tượng `navigator` và đối tượng {{domxref("WorkerNavigator")}}. Nói cách khác, Media Capabilities API có sẵn trên cả luồng chính và trong worker.

Nếu đối tượng tồn tại, Media Capabilities API có sẵn. Do đó, bạn có thể kiểm tra sự hiện diện của API như sau:

```js
if ("mediaCapabilities" in navigator) {
  // mediaCapabilities is available
} else {
  // mediaCapabilities IS NOT available
}
```

Lấy video làm ví dụ, để lấy thông tin về khả năng giải mã video, bạn tạo cấu hình giải mã video rồi truyền nó làm tham số cho phương thức {{domxref("MediaCapabilities.decodingInfo()")}}. Phương thức này trả về một promise được thực hiện với thông tin về khả năng media, bao gồm video có thể được giải mã hay không, và liệu việc giải mã có mượt mà và tiết kiệm điện hay không. Bạn cũng có thể kiểm tra giải mã âm thanh cũng như mã hóa video và âm thanh.

### Tạo cấu hình giải mã video

Phương thức {{domxref("MediaCapabilities.decodingInfo()")}} nhận một cấu hình giải mã media làm tham số.

Trong ví dụ của chúng ta, chúng ta đang kiểm tra khả năng giải mã của một cấu hình video. Cấu hình yêu cầu loại media đang được kiểm tra, ví dụ `file` hoặc {{domxref("MediaSource")}}, và một đối tượng cấu hình video bao gồm các giá trị cho `contentType`, `width`, `height`, `bitrate` và `framerate`:

- `contentType` phải là một chuỗi chỉ định [loại MIME video hợp lệ](/en-US/docs/Web/Media/Guides/Formats/Video_codecs).
- `width` và `height` là kích thước ngang và dọc của video, cũng được dùng để xác định {{glossary("aspect ratio")}}.
- `bitrate` là số bit dùng để mã hóa một giây video.
- `framerate` là số khung hình được phát mỗi giây khi phát video.

```js
const videoConfiguration = {
  type: "file",
  video: {
    contentType: "video/webm;codecs=vp8",
    width: 800,
    height: 600,
    bitrate: 10000,
    framerate: 15,
  },
};
```

Nếu chúng ta đang truy vấn khả năng giải mã của tệp âm thanh, chúng ta sẽ tạo cấu hình âm thanh bao gồm số kênh và tốc độ lấy mẫu, bỏ qua các thuộc tính chỉ áp dụng cho video như kích thước và tốc độ khung hình:

```js
const audioConfiguration = {
  type: "file",
  audio: {
    contentType: "audio/ogg",
    channels: 2,
    bitrate: 132700,
    samplerate: 5200,
  },
};
```

Nếu chúng ta đang kiểm tra khả năng mã hóa, chúng ta sẽ tạo cấu hình hơi khác một chút. Trong trường hợp này, loại media được kiểm tra là `record` (để ghi media, tức là đối tượng {{domxref("MediaRecorder")}}) hoặc `transmission` (cho media được truyền qua các phương tiện điện tử như [`RTCPeerConnection`](/en-US/docs/Web/API/RTCPeerConnection)), cộng với cấu hình âm thanh hoặc video như đã mô tả ở trên.

### Truy vấn trình duyệt về khả năng giải mã

Bây giờ chúng ta đã tạo cấu hình giải mã video, có thể truyền nó làm tham số của phương thức {{domxref("MediaCapabilities.decodingInfo", "decodingInfo()")}} để xác định video khớp với cấu hình này có thể giải mã được không và liệu việc phát lại có mượt mà và tiết kiệm điện hay không.

```js
let promise = navigator.mediaCapabilities.decodingInfo(videoConfiguration);
```

Cả hai phương thức `decodingInfo()` và {{domxref("MediaCapabilities.encodingInfo", "encodingInfo()")}} đều trả về promise. Khi trạng thái promise được thực hiện, bạn có thể truy cập các thuộc tính `supported`, `smooth` và `powerEfficient` từ đối tượng trả về.

### Xử lý phản hồi

Thay vì gán promise cho một biến, chúng ta có thể xuất ra bảng điều khiển các giá trị được trả về:

```js
navigator.mediaCapabilities.decodingInfo(videoConfiguration).then((result) => {
  console.log(
    `This configuration is ${result.supported ? "" : "not "}supported,`,
  );
  console.log(`${result.smooth ? "" : "not "}smooth, and`);
  console.log(`${result.powerEfficient ? "" : "not "}power efficient.`);
});
```

## Xử lý lỗi

Trong ví dụ giải mã video của chúng ta, một {{jsxref("TypeError")}} sẽ được ném nếu cấu hình media được truyền cho phương thức {{domxref("MediaCapabilities.decodingInfo", "decodingInfo()")}} không hợp lệ. Có một số lý do có thể gây ra lỗi, bao gồm:

- `type` được chỉ định không phải là một trong hai giá trị được phép: `file` hoặc `media-source`
- `contentType` được cung cấp không phải là loại MIME codec hợp lệ, hoặc các định nghĩa không hợp lệ hay bị thiếu trong đối tượng cấu hình video.

```js
navigator.mediaCapabilities
  .decodingInfo(videoConfiguration)
  .then(() => console.log("It worked"))
  .catch((error) => console.error(`It failed: ${error}`));
```

## Ví dụ trực tiếp Media Capabilities

### CSS

```css
li {
  margin: 1em;
}
```

### HTML

```html
<form>
  <p>
    Select your video configuration and find out if this browser supports the
    codec, and whether decoding will be smooth and power efficient:
  </p>
  <ul>
    <li>
      <label for="codec">Select a codec</label>
      <select id="codec">
        <option>video/webm; codecs=vp8</option>
        <option>video/webm; codecs=vp9</option>
        <option>video/mp4; codecs=avc1</option>
        <option>video/mp4; codecs=avc1.420034</option>
        <option>invalid</option>
      </select>
    </li>
    <li>
      <label for="size">Select a size</label>
      <select id="size">
        <option>7680x4320</option>
        <option>3840x2160</option>
        <option>2560x1440</option>
        <option>1920x1080</option>
        <option>1280x720</option>
        <option selected>800x600</option>
        <option>640x480</option>
        <option>320x240</option>
        <option value=" x ">none</option>
      </select>
    </li>
    <li>
      <label for="framerate">Select a framerate</label>
      <select id="framerate">
        <option>60</option>
        <option>50</option>
        <option>30</option>
        <option>24</option>
        <option selected>15</option>
      </select>
    </li>
    <li>
      <label for="bitrate">Select a bitrate</label>
      <select id="bitrate">
        <option>4000</option>
        <option>2500</option>
        <option>800</option>
      </select>
    </li>
  </ul>
  <p>
    <input type="button" value="Test this Video Configuration" id="try-it" />
  </p>
</form>

<ul id="results"></ul>
```

### JavaScript

```js
let mc = {
  videoConfiguration: {},

  tryIt() {
    mc.createConfiguration();
    mc.testIt();
  },

  createConfiguration() {
    const size = document.getElementById("size").value.split("x");
    mc.videoConfiguration = {
      type: "file",
      video: {
        contentType: document.getElementById("codec").value,
        width: size[0],
        height: size[1],
        bitrate: document.getElementById("bitrate").value,
        framerate: document.getElementById("framerate").value,
      },
    };
  },

  testIt() {
    let content = "";
    navigator.mediaCapabilities
      .decodingInfo(mc.videoConfiguration)
      .then((result) => {
        const li = document.createElement("li"),
          mcv = mc.videoConfiguration.video;
        content = `A ${mcv.width}x${mcv.height}, ${mcv.contentType} at ${
          mcv.framerate
        }fps and ${mcv.bitrate} bps video ${
          result.supported ? " IS " : "IS NOT "
        } supported,`;
        content += `${result.smooth ? " IS " : " is NOT "} smooth, and`;
        content += `${
          result.powerEfficient ? " IS " : " IS NOT "
        }power efficient.`;
        const ul = document.getElementById("results");
        li.textContent = content;
        ul.appendChild(li);
      })
      .catch((error) => {
        const li = document.createElement("li"),
          ul = document.getElementById("results");
        li.textContent = `Codec ${mc.videoConfiguration.video.contentType} threw an error: ${error}`;
        ul.appendChild(li);
      });
  },
};

document.getElementById("try-it").addEventListener("click", mc.tryIt);
```

### Kết quả trực tiếp

{{EmbedLiveSample('Media_Capabilities_live_example', '100%', '400')}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("navigator.mediaCapabilities")}}
