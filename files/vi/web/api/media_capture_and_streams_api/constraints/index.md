---
title: Capabilities, constraints, and settings
slug: Web/API/Media_Capture_and_Streams_API/Constraints
page-type: guide
browser-compat: api.MediaDevices.getSupportedConstraints
---

{{DefaultAPISidebar("Media Capture and Streams")}}

Bài viết này thảo luận về hai khái niệm song song là **constraints** và **capabilities**, cũng như các media setting, và bao gồm một ví dụ mà chúng tôi gọi là [Constraint Exerciser](#example_constraint_exerciser). Constraint Exerciser cho phép bạn thử nghiệm kết quả của các bộ constraint khác nhau được áp dụng cho các track âm thanh và video đến từ các thiết bị đầu vào A/V của máy tính (chẳng hạn như webcam và micro).

Về mặt lịch sử, việc viết script cho Web hoạt động chặt chẽ với Web API luôn có một thách thức quen thuộc: thường thì code của bạn cần biết một API có tồn tại hay không và nếu có thì giới hạn của nó là gì trên {{Glossary("user agent")}} mà nó đang chạy. Việc xác định điều này từ lâu vẫn khó khăn, và thường liên quan đến việc xem xét kết hợp user agent (hoặc trình duyệt) nào bạn đang chạy, phiên bản của nó, kiểm tra xem một số đối tượng có tồn tại hay không, thử xem các thứ có hoạt động hay không và xác định lỗi nào xảy ra, v.v. Kết quả thường là code rất mong manh, hoặc sự phụ thuộc vào các thư viện tự xử lý việc này cho bạn rồi triển khai {{Glossary("polyfill", "polyfills")}} để vá các khoảng trống trong phần triển khai thay bạn.

Capabilities và constraints cho phép trình duyệt và website hoặc ứng dụng trao đổi thông tin về những **constrainable properties** nào mà phần triển khai của trình duyệt hỗ trợ và giá trị nào được hỗ trợ cho từng thuộc tính.

## Tổng quan

Quy trình diễn ra như sau (dùng {{domxref("MediaStreamTrack")}} làm ví dụ):

1. Nếu cần, gọi {{domxref("MediaDevices.getSupportedConstraints()")}} để lấy danh sách **supported constraints**, tức là biết trình duyệt nhận diện được những constrainable property nào. Việc này không phải lúc nào cũng cần thiết, vì mọi thuộc tính không được biết đến sẽ bị bỏ qua khi bạn chỉ định chúng, nhưng nếu có bất kỳ thuộc tính nào bạn không thể thiếu thì bạn có thể bắt đầu bằng cách kiểm tra xem chúng có nằm trong danh sách hay không.
2. Khi script biết được thuộc tính hoặc các thuộc tính mà nó muốn dùng có được hỗ trợ hay không, nó có thể kiểm tra **capabilities** của API và phần triển khai bằng cách xem đối tượng do phương thức `getCapabilities()` của track trả về; đối tượng này liệt kê từng constraint được hỗ trợ và các giá trị hoặc khoảng giá trị được hỗ trợ.
3. Cuối cùng, phương thức `applyConstraints()` của track được gọi để cấu hình API theo ý muốn bằng cách chỉ định các giá trị hoặc khoảng giá trị mà nó muốn dùng cho bất kỳ constrainable property nào mà nó có ưu tiên.
4. Phương thức `getConstraints()` của track trả về tập constraint đã được truyền vào lần gọi `applyConstraints()` gần nhất. Điều này có thể không đại diện cho trạng thái hiện tại thực sự của track, do những thuộc tính có giá trị yêu cầu đã phải điều chỉnh và vì các giá trị mặc định của nền tảng không được biểu diễn. Để có một biểu diễn đầy đủ về cấu hình hiện tại của track, hãy dùng `getSettings()`.

Trong Media Capture and Streams API, cả {{domxref("MediaStream")}} và {{domxref("MediaStreamTrack")}} đều có các constrainable property.

## Xác định một constraint có được hỗ trợ không

Nếu bạn cần biết một constraint cụ thể có được user agent hỗ trợ hay không, bạn có thể tìm ra bằng cách gọi {{domxref("MediaDevices.getSupportedConstraints", "navigator.mediaDevices.getSupportedConstraints()")}} để lấy danh sách các constrainable property mà trình duyệt biết đến, như sau:

```js
const supported = navigator.mediaDevices.getSupportedConstraints();

document.getElementById("frameRateSlider").disabled = !supported["frameRate"];
```

Trong ví dụ này, các supported constraints được lấy ra, và một điều khiển cho phép người dùng cấu hình frame rate sẽ bị vô hiệu hóa nếu constraint `frameRate` không được hỗ trợ.

## Cách constraints được định nghĩa

Một constraint đơn lẻ là một đối tượng có tên khớp với constrainable property mà giá trị mong muốn hoặc khoảng giá trị đang được chỉ định. Đối tượng này chứa không hoặc nhiều constraint riêng lẻ, cùng với một đối tượng con tùy chọn tên là `advanced`, chứa thêm một tập không hoặc nhiều constraint khác mà user agent phải thỏa mãn nếu có thể. User agent cố gắng thỏa mãn các constraint theo thứ tự được chỉ định trong tập constraint.

Điều quan trọng nhất cần hiểu là phần lớn constraint không phải là yêu cầu bắt buộc; thay vào đó, chúng là các yêu cầu mong muốn. Có ngoại lệ, và chúng ta sẽ đề cập đến ngay sau đây.

### Yêu cầu một giá trị cụ thể cho một cài đặt

Phần lớn, mỗi constraint có thể là một giá trị cụ thể biểu thị giá trị mong muốn cho cài đặt. Ví dụ:

```js
const constraints = {
  width: 1920,
  height: 1080,
  aspectRatio: 1.777777778,
};

myTrack.applyConstraints(constraints);
```

Trong trường hợp này, các constraint cho biết rằng bất kỳ giá trị nào cũng đều ổn cho hầu hết các thuộc tính, nhưng mong muốn một kích thước video độ phân giải cao tiêu chuẩn (HD), với {{glossary("aspect ratio")}} chuẩn 16:9. Không có gì đảm bảo track thu được sẽ khớp với bất kỳ giá trị nào trong số này, nhưng user agent nên cố gắng hết sức để khớp càng nhiều càng tốt.

Việc ưu tiên các thuộc tính rất đơn giản: nếu hai giá trị yêu cầu của hai thuộc tính loại trừ lẫn nhau, thì thuộc tính được liệt kê trước trong tập constraint sẽ được dùng. Ví dụ:

```js
const constraints = {
  width: 1920,
  aspectRatio: 1.777777778,
  height: 1080,
};
```

Trong trường hợp này, nếu một trong các yêu cầu đó phải bị loại bỏ để thỏa mãn phần còn lại, thì `width` sẽ được ưu tiên hơn `aspectRatio`, và `aspectRatio` được ưu tiên hơn `height`.

```js
  const constraints = {
    width: { min: 640, ideal: 1920, max: 1920 },
    height: { min: 400, ideal: 1080 },
    aspectRatio: 1.777777778,
    frameRate: { max: 30 },
    facingMode: { exact: "user" },
  };

  myTrack
    .applyConstraints(constraints)
    .then(() => {
      /* thực hiện việc gì đó nếu constraints được áp dụng thành công */
    })
    .catch((reason) => {
      /* không thể áp dụng constraints; reason là nguyên nhân */
    });
}
```

Ở đây, sau khi bảo đảm rằng các constrainable property mà chúng ta bắt buộc phải khớp đều được hỗ trợ (`width`, `height`, `frameRate`, và `facingMode`), chúng ta thiết lập các constraint yêu cầu chiều rộng không nhỏ hơn 640 và không lớn hơn 1920 (nhưng tốt nhất là 1920), chiều cao không nhỏ hơn 400 (nhưng lý tưởng là 1080), tỷ lệ khung hình 16:9 (1.777777778), và tần suất khung hình không quá 30 khung hình mỗi giây. Ngoài ra, thiết bị đầu vào duy nhất được chấp nhận là camera hướng về phía người dùng (một "selfie cam"). Nếu các constraint `width`, `height`, `frameRate`, hoặc `facingMode` không thể đáp ứng, promise do `applyConstraints()` trả về sẽ bị từ chối.

> [!NOTE]
> Các constraint được chỉ định bằng bất kỳ hoặc toàn bộ `max`, `min`, hay `exact` luôn luôn được xem là bắt buộc. Nếu bất kỳ constraint nào dùng một hoặc nhiều thuộc tính đó không thể thỏa mãn khi gọi `applyConstraints()`, promise sẽ bị từ chối.

### Constraints nâng cao

Các constraint nâng cao, hay còn gọi là advanced constraints, được tạo bằng cách thêm thuộc tính `advanced` vào tập constraint; giá trị của thuộc tính này là một mảng các tập constraint bổ sung được xem là tùy chọn. Có rất ít trường hợp sử dụng tính năng này, và hiện cũng có một số quan tâm đến việc loại bỏ nó khỏi đặc tả, nên phần này sẽ không được bàn thêm ở đây. Nếu bạn muốn tìm hiểu thêm, hãy xem [mục 11 của đặc tả Media Capture and Streams](https://w3c.github.io/mediacapture-main/#constrainable-interface), ví dụ trước đó số 2.

## Kiểm tra capabilities

Bạn có thể gọi {{domxref("MediaStreamTrack.getCapabilities()")}} để lấy danh sách tất cả các capabilities được hỗ trợ cùng các giá trị hoặc khoảng giá trị mà mỗi capability chấp nhận trên nền tảng và user agent hiện tại. Hàm này trả về một đối tượng liệt kê từng constrainable property được trình duyệt hỗ trợ và một giá trị hoặc khoảng giá trị được hỗ trợ cho mỗi thuộc tính đó.

Ví dụ, đoạn code sau sẽ yêu cầu người dùng cấp quyền truy cập camera và micro cục bộ của họ. Khi quyền được cấp, các đối tượng `MediaTrackCapabilities` sẽ được ghi ra console để mô tả capabilities của từng {{domxref("MediaStreamTrack")}}:

```js
navigator.mediaDevices
  .getUserMedia({ video: true, audio: true })
  .then((stream) => {
    const tracks = stream.getTracks();
    tracks.map((t) => console.log(t.getCapabilities()));
  });
```

Một đối tượng capabilities mẫu trông như sau:

```json
{
  "autoGainControl": [true, false],
  "channelCount": {
    "max": 1,
    "min": 1
  },
  "deviceId": "jjxEMqxIhGdryqbTjDrXPWrkjy55Vte70kWpMe3Lge8=",
  "echoCancellation": [true, false],
  "groupId": "o2tZiEj4MwOdG/LW3HwkjpLm1D8URat4C5kt742xrVQ=",
  "noiseSuppression": [true, false]
}
```

Nội dung chính xác của đối tượng sẽ phụ thuộc vào trình duyệt và phần cứng media.

## Áp dụng constraints

Cách đầu tiên và phổ biến nhất để dùng constraints là chỉ định chúng khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}:

```js
navigator.mediaDevices
  .getUserMedia({
    video: {
      width: { min: 640, ideal: 1920 },
      height: { min: 400, ideal: 1080 },
      aspectRatio: { ideal: 1.7777777778 },
    },
    audio: {
      sampleSize: 16,
      channelCount: 2,
    },
  })
  .then((stream) => {
    videoElement.srcObject = stream;
  })
  .catch(handleError);
```

Trong ví dụ này, constraints được áp dụng ngay lúc gọi `getUserMedia()`, yêu cầu một bộ tùy chọn lý tưởng với các giá trị dự phòng cho video.

> [!NOTE]
> Bạn có thể chỉ định một hoặc nhiều mã định danh thiết bị đầu vào media để thiết lập giới hạn về những nguồn đầu vào nào được phép. Để thu thập danh sách các thiết bị có sẵn, bạn có thể gọi {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}}, rồi với mỗi thiết bị đáp ứng tiêu chí mong muốn, thêm `deviceId` của nó vào đối tượng `MediaConstraints` cuối cùng sẽ được truyền vào `getUserMedia()`.

Bạn cũng có thể thay đổi constraints của một {{domxref("MediaStreamTrack")}} hiện có ngay lập tức bằng cách gọi phương thức {{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}} của track đó, và truyền vào một đối tượng biểu thị các constraints bạn muốn áp dụng cho track:

```js
videoTrack.applyConstraints({
  width: 1920,
  height: 1080,
});
```

Trong đoạn này, video track được tham chiếu bởi `videoTrack` được cập nhật để độ phân giải của nó khớp càng sát càng tốt với 1920x1080 pixel (HD 1080p).

## Lấy constraints và settings hiện tại

Điều quan trọng là phải nhớ sự khác biệt giữa **constraints** và **settings**. Constraints là cách chỉ định các giá trị bạn cần, muốn, và sẵn sàng chấp nhận cho các constrainable property khác nhau (như mô tả trong tài liệu của {{domxref("MediaTrackConstraints")}}), còn settings là các giá trị thực tế của từng constrainable property tại thời điểm hiện tại.

### Lấy các constraints đang có hiệu lực

Nếu tại bất kỳ thời điểm nào bạn cần lấy tập constraints hiện đang được áp dụng cho media, bạn có thể nhận thông tin đó bằng cách gọi {{domxref("MediaStreamTrack.getConstraints()")}}, như trong ví dụ bên dưới.

```js
function switchCameras(track, camera) {
  const constraints = track.getConstraints();
  constraints.facingMode = camera;
  track.applyConstraints(constraints);
}
```

Hàm này nhận một {{domxref("MediaStreamTrack")}} và một chuỗi chỉ định chế độ camera hướng nào sẽ được dùng, lấy các constraints hiện tại, đặt giá trị của {{domxref("MediaTrackConstraints.facingMode")}} thành giá trị được chỉ định, rồi áp dụng bộ constraint đã cập nhật.

### Lấy các settings hiện tại của một track

Trừ khi bạn chỉ dùng exact constraints (điều này khá hạn chế, nên hãy chắc chắn là bạn thật sự muốn vậy!), không có gì đảm bảo chính xác những gì bạn sẽ thực sự nhận được sau khi áp dụng constraints. Các giá trị thực tế của các constrainable property trong media thu được được gọi là settings. Nếu bạn cần biết định dạng thật và các thuộc tính khác của media, bạn có thể lấy các settings đó bằng cách gọi {{domxref("MediaStreamTrack.getSettings()")}}. Hàm này trả về một đối tượng dựa trên từ điển {{domxref("MediaTrackSettings")}}. Ví dụ:

```js
function whichCamera(track) {
  return track.getSettings().facingMode;
}
```

Hàm này dùng `getSettings()` để lấy các giá trị hiện đang được track sử dụng cho những constrainable property và trả về giá trị của {{domxref("MediaTrackSettings.facingMode", "facingMode")}}.

## Ví dụ: Constraint exerciser

Trong ví dụ này, chúng ta tạo một exerciser cho phép bạn thử nghiệm media constraints bằng cách chỉnh sửa code nguồn mô tả các tập constraint cho track âm thanh và video. Sau đó bạn có thể áp dụng các thay đổi đó và xem kết quả, bao gồm cả hình ảnh stream và các media settings thực tế sau khi áp dụng các constraints mới.

HTML và CSS cho ví dụ này khá đơn giản và không được hiển thị ở đây. Bạn có thể xem code đầy đủ bằng cách nhấn "Play" để mở trong playground.

```html hidden
<p>
  Thử nghiệm media constraints! Chỉnh sửa các tập constraint cho track video và
  audio trong các ô chỉnh sửa bên trái, rồi nhấp nút "Apply Constraints" để thử
  chúng. Các settings thực tế mà trình duyệt chọn và đang dùng được hiển thị
  trong các ô bên phải. Bên dưới, bạn sẽ thấy chính video.
</p>
<p>Nhấp nút "Start" để bắt đầu.</p>

<h3>Constrainable properties có sẵn:</h3>
<ul id="supportedConstraints"></ul>
<div id="startButton" class="button">Start</div>
<div class="wrapper">
  <div class="track-row">
    <div class="left-side">
      <h3>Requested video constraints:</h3>
      <textarea id="videoConstraintEditor" cols="32" rows="8"></textarea>
    </div>
    <div class="right-side">
      <h3>Actual video settings:</h3>
      <textarea id="videoSettingsText" cols="32" rows="8" disabled></textarea>
    </div>
  </div>
  <div class="track-row">
    <div class="left-side">
      <h3>Requested audio constraints:</h3>
      <textarea id="audioConstraintEditor" cols="32" rows="8"></textarea>
    </div>
    <div class="right-side">
      <h3>Actual audio settings:</h3>
      <textarea id="audioSettingsText" cols="32" rows="8" disabled></textarea>
    </div>
  </div>

  <div class="button" id="applyButton">Apply Constraints</div>
</div>
<video id="video" autoplay></video>

<div class="button" id="stopButton">Stop Video</div>

<div id="log"></div>
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
  width: 150px;
  border: 1px solid black;
  font-size: 16px;
  text-align: center;
  padding-top: 2px;
  padding-bottom: 4px;
  color: white;
  background-color: darkgreen;
}

.wrapper {
  margin-bottom: 10px;
  width: 600px;
}

.track-row {
  height: 200px;
}

.left-side {
  float: left;
  width: calc(calc(100% / 2) - 10px);
}

.right-side {
  float: right;
  width: calc(calc(100% / 2) - 10px);
}

textarea {
  padding: 8px;
}

h3 {
  margin-bottom: 3px;
}

#supportedConstraints {
  column-count: 2;
}

#log {
  padding-top: 10px;
}
```

### Mặc định và biến

Đầu tiên là các tập constraint mặc định, dưới dạng chuỗi. Những chuỗi này được hiển thị trong các `textarea` có thể chỉnh sửa, nhưng đây là cấu hình ban đầu của stream.

```js
const videoDefaultConstraintString =
  '{\n  "width": 320,\n  "height": 240,\n  "frameRate": 30\n}';
const audioDefaultConstraintString =
  '{\n  "sampleSize": 16,\n  "channelCount": 2,\n  "echoCancellation": false\n}';
```

Các giá trị mặc định này yêu cầu một cấu hình camera khá phổ biến, nhưng không ép thuộc tính nào phải có tầm quan trọng đặc biệt. Trình duyệt nên cố gắng khớp các thiết lập này nhưng sẽ chấp nhận bất kỳ thứ gì mà nó xem là gần đúng.

Sau đó chúng ta khởi tạo các biến sẽ giữ các đối tượng {{domxref("MediaTrackConstraints")}} cho track video và audio, cũng như các biến sẽ giữ tham chiếu tới chính các track video và audio đó, bằng `null`.

```js
let videoConstraints = null;
let audioConstraints = null;

let audioTrack = null;
let videoTrack = null;
```

Và chúng ta lấy tham chiếu tới tất cả các phần tử cần dùng.

```js
const videoElement = document.getElementById("video");
const logElement = document.getElementById("log");
const supportedConstraintList = document.getElementById("supportedConstraints");
const videoConstraintEditor = document.getElementById("videoConstraintEditor");
const audioConstraintEditor = document.getElementById("audioConstraintEditor");
const videoSettingsText = document.getElementById("videoSettingsText");
const audioSettingsText = document.getElementById("audioSettingsText");
```

Các phần tử này là:

- `videoElement`
  - : Phần tử {{HTMLElement("video")}} sẽ hiển thị stream.
- `logElement`
  - : Một {{HTMLElement("div")}} để ghi các thông báo lỗi hoặc đầu ra kiểu log khác.
- `supportedConstraintList`
  - : Một {{HTMLElement("ul")}} (danh sách không thứ tự) mà chúng ta sẽ thêm tên của từng constrainable property được trình duyệt của người dùng hỗ trợ.
- `videoConstraintEditor`
  - : Phần tử {{HTMLElement("textarea")}} cho phép người dùng chỉnh sửa code của tập constraint cho track video.
- `audioConstraintEditor`
  - : Phần tử {{HTMLElement("textarea")}} cho phép người dùng chỉnh sửa code của tập constraint cho track audio.
- `videoSettingsText`
  - : Một {{HTMLElement("textarea")}} (luôn bị vô hiệu hóa) hiển thị các settings hiện tại cho các constrainable property của track video.
- `audioSettingsText`
  - : Một {{HTMLElement("textarea")}} (luôn bị vô hiệu hóa) hiển thị các settings hiện tại cho các constrainable property của track audio.

Cuối cùng, chúng ta đặt nội dung hiện tại của hai phần tử chỉnh sửa tập constraint thành các giá trị mặc định.

```js
videoConstraintEditor.value = videoDefaultConstraintString;
audioConstraintEditor.value = audioDefaultConstraintString;
```

### Cập nhật phần hiển thị settings

Ở bên phải mỗi trình chỉnh sửa tập constraint là một ô văn bản thứ hai, được dùng để hiển thị cấu hình hiện tại của các thuộc tính có thể cấu hình của track. Phần hiển thị này được cập nhật bởi hàm `getCurrentSettings()`, hàm này lấy settings hiện tại cho các track audio và video rồi chèn code tương ứng vào các ô hiển thị settings của track bằng cách đặt [`value`](/en-US/docs/Web/API/HTMLTextAreaElement/value) của chúng.

```js
function getCurrentSettings() {
  if (videoTrack) {
    videoSettingsText.value = JSON.stringify(videoTrack.getSettings(), null, 2);
  }

  if (audioTrack) {
    audioSettingsText.value = JSON.stringify(audioTrack.getSettings(), null, 2);
  }
}
```

Hàm này được gọi sau khi stream bắt đầu lần đầu tiên, cũng như bất cứ khi nào chúng ta áp dụng constraint cập nhật, như bạn sẽ thấy bên dưới.

### Xây dựng các đối tượng tập constraint của track

Hàm `buildConstraints()` xây dựng các đối tượng {{domxref("MediaTrackConstraints")}} cho track audio và video bằng code trong hai ô chỉnh sửa tập constraint của chúng.

```js
function buildConstraints() {
  try {
    videoConstraints = JSON.parse(videoConstraintEditor.value);
    audioConstraints = JSON.parse(audioConstraintEditor.value);
  } catch (error) {
    handleError(error);
  }
}
```

Hàm này dùng {{jsxref("JSON.parse()")}} để phân tích code trong mỗi trình chỉnh sửa thành một đối tượng. Nếu bất kỳ lần gọi JSON.parse() nào ném ngoại lệ, `handleError()` sẽ được gọi để xuất thông báo lỗi vào log.

### Cấu hình và khởi động stream

Phương thức `startVideo()` xử lý việc thiết lập và khởi động video stream.

```js
function startVideo() {
  buildConstraints();

  navigator.mediaDevices
    .getUserMedia({
      video: videoConstraints,
      audio: audioConstraints,
    })
    .then((stream) => {
      const audioTracks = stream.getAudioTracks();
      const videoTracks = stream.getVideoTracks();

      videoElement.srcObject = stream;

      if (audioTracks.length > 0) {
        audioTrack = audioTracks[0];
      }

      if (videoTracks.length > 0) {
        videoTrack = videoTracks[0];
      }
    })
    .then(
      () =>
        new Promise((resolve) => {
          videoElement.onloadedmetadata = resolve;
        }),
    )
    .then(() => {
      getCurrentSettings();
    })
    .catch(handleError);
}
```

Có nhiều bước ở đây:

1. Gọi `buildConstraints()` để tạo các đối tượng {{domxref("MediaTrackConstraints")}} cho hai track từ code trong các ô chỉnh sửa.
2. Gọi {{domxref("MediaDevices.getUserMedia", "navigator.mediaDevices.getUserMedia()")}}, truyền vào các đối tượng constraints cho track video và audio. Điều này trả về một {{domxref("MediaStream")}} với âm thanh và video từ một nguồn khớp với đầu vào (thường là webcam, mặc dù nếu bạn cung cấp đúng constraints thì có thể lấy media từ nguồn khác).
3. Khi stream được lấy, nó được gắn vào phần tử {{HTMLElement("video")}} để hiển thị trên màn hình, và chúng ta lấy track audio và video vào các biến `audioTrack` và `videoTrack`.
4. Sau đó chúng ta thiết lập một promise sẽ resolve khi sự kiện {{domxref("HTMLMediaElement/loadedmetadata_event", "loadedmetadata")}} xảy ra trên phần tử video.
5. Khi điều đó xảy ra, chúng ta biết video đã bắt đầu phát, nên gọi hàm `getCurrentSettings()` của mình (đã mô tả ở trên) để hiển thị các settings thực tế mà trình duyệt quyết định sau khi xét các constraints của chúng ta và capabilities của phần cứng.
6. Nếu xảy ra lỗi, chúng ta ghi nó bằng phương thức `handleError()` mà sẽ xem ở phần sau của bài viết.

Chúng ta cũng cần thiết lập một event listener để theo dõi khi nút "Start Video" được nhấp:

```js
document.getElementById("startButton").addEventListener("click", () => {
  startVideo();
});
```

### Áp dụng các cập nhật bộ constraint

Tiếp theo, chúng ta thiết lập một event listener cho nút "Apply Constraints". Nếu nó được nhấp và hiện chưa có media nào đang dùng, chúng ta gọi `startVideo()`, và để hàm đó xử lý việc khởi động stream với các settings đã chỉ định. Nếu không, chúng ta làm theo các bước sau để áp dụng các constraint cập nhật cho stream đang hoạt động:

1. `buildConstraints()` được gọi để xây dựng các đối tượng {{domxref("MediaTrackConstraints")}} cập nhật cho track audio (`audioConstraints`) và track video (`videoConstraints`).
2. {{domxref("MediaStreamTrack.applyConstraints()")}} được gọi trên track video (nếu có) để áp dụng `videoConstraints` mới. Nếu thành công, nội dung ô settings hiện tại của track video sẽ được cập nhật dựa trên kết quả gọi phương thức {{domxref("MediaStreamTrack.getSettings", "getSettings()")}} của nó.
3. Khi việc đó xong, `applyConstraints()` được gọi trên track audio (nếu có) để áp dụng các constraint audio mới. Nếu thành công, nội dung ô settings hiện tại của track audio sẽ được cập nhật dựa trên kết quả gọi phương thức {{domxref("MediaStreamTrack.getSettings", "getSettings()")}} của nó.
4. Nếu có lỗi khi áp dụng bất kỳ bộ constraint nào, `handleError()` được dùng để xuất một thông báo vào log.

```js
document.getElementById("applyButton").addEventListener("click", () => {
  if (!videoTrack && !audioTrack) {
    startVideo();
  } else {
    buildConstraints();

    const prettyJson = (obj) => JSON.stringify(obj, null, 2);

    if (videoTrack) {
      videoTrack
        .applyConstraints(videoConstraints)
        .then(() => {
          videoSettingsText.value = prettyJson(videoTrack.getSettings());
        })
        .catch(handleError);
    }

    if (audioTrack) {
      audioTrack
        .applyConstraints(audioConstraints)
        .then(() => {
          audioSettingsText.value = prettyJson(audioTrack.getSettings());
        })
        .catch(handleError);
    }
  }
});
```

### Xử lý nút dừng

Sau đó chúng ta thiết lập trình xử lý cho nút dừng.

```js
document.getElementById("stopButton").addEventListener("click", () => {
  if (videoTrack) {
    videoTrack.stop();
  }

  if (audioTrack) {
    audioTrack.stop();
  }

  videoTrack = audioTrack = null;
  videoElement.srcObject = null;
});
```

Điều này dừng các track đang hoạt động, đặt các biến `videoTrack` và `audioTrack` về `null` để biết rằng chúng không còn nữa, và gỡ stream khỏi phần tử {{HTMLElement("video")}} bằng cách đặt {{domxref("HTMLMediaElement.srcObject")}} thành `null`.

### Hỗ trợ tab đơn giản trong trình soạn thảo

Đoạn code này thêm hỗ trợ tab đơn giản cho các phần tử {{HTMLElement("textarea")}} bằng cách làm cho phím tab chèn hai ký tự cách khi bất kỳ ô chỉnh sửa constraint nào đang được focus.

```js
function keyDownHandler(event) {
  if (event.key === "Tab") {
    const elem = event.target;
    const str = elem.value;

    const position = elem.selectionStart;
    const beforeTab = str.substring(0, position);
    const afterTab = str.substring(position, str.length);
    const newStr = `${beforeTab}  ${afterTab}`;
    elem.value = newStr;
    elem.selectionStart = elem.selectionEnd = position + 2;
    event.preventDefault();
  }
}

videoConstraintEditor.addEventListener("keydown", keyDownHandler);
audioConstraintEditor.addEventListener("keydown", keyDownHandler);
```

### Hiển thị các constrainable property mà trình duyệt hỗ trợ

Phần quan trọng cuối cùng của bài toán: code hiển thị, để người dùng tham khảo, danh sách các constrainable property mà trình duyệt của họ hỗ trợ. Mỗi property là một liên kết đến tài liệu của nó trên MDN để tiện cho người dùng. Xem [`MediaDevices.getSupportedConstraints()` examples](/en-US/docs/Web/API/MediaDevices/getSupportedConstraints#examples) để biết chi tiết về cách code này hoạt động.

> [!NOTE]
> Tất nhiên, danh sách này có thể chứa các thuộc tính không chuẩn, trong trường hợp đó bạn có lẽ sẽ thấy liên kết tài liệu không giúp được nhiều.

```js
const supportedConstraints = navigator.mediaDevices.getSupportedConstraints();
for (const constraint in supportedConstraints) {
  if (Object.hasOwn(supportedConstraints, constraint)) {
    const elem = document.createElement("li");

    elem.innerHTML = `<code><a href='https://developer.mozilla.org/docs/Web/API/MediaTrackSupportedConstraints/${constraint}' target='_blank'>${constraint}</a></code>`;
    supportedConstraintList.appendChild(elem);
  }
}
```

### Xử lý lỗi

Chúng ta cũng có một đoạn code xử lý lỗi đơn giản; `handleError()` được gọi để xử lý các promise thất bại, và hàm `log()` sẽ nối thông báo lỗi vào một ô {{HTMLElement("div")}} ghi log đặc biệt bên dưới video.

```js
function log(msg) {
  logElement.innerHTML += `${msg}<br>`;
}

function handleError(reason) {
  log(
    `Error <code>${reason.name}</code> in constraint <code>${reason.constraint}</code>: ${reason.message}`,
  );
}
```

### Kết quả

Ở đây bạn có thể xem ví dụ hoàn chỉnh đang hoạt động.

{{EmbedLiveSample("Example_Constraint_exerciser", 650, 1200, , , , "camera;microphone")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaTrackSettings")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaStreamTrack.applyConstraints()")}}
- {{domxref("MediaStreamTrack.getSettings()")}}
