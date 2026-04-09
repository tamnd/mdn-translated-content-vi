---
title: Thao tác video bằng canvas
slug: Web/API/Canvas_API/Manipulating_video_using_canvas
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}}

Bằng cách kết hợp các khả năng của phần tử [`video`](/en-US/docs/Web/HTML/Reference/Elements/video) với [`canvas`](/en-US/docs/Web/HTML/Reference/Elements/canvas), bạn có thể thao tác dữ liệu video trong thời gian thực để kết hợp nhiều hiệu ứng hình ảnh khác nhau vào video đang được hiển thị. Hướng dẫn này trình bày cách thực hiện khóa sắc độ (còn được gọi là "hiệu ứng màn hình xanh") bằng mã JavaScript.

{{EmbedGHLiveSample('dom-examples/canvas/chroma-keying/index.html', 700, 400) }}

## Nội dung tài liệu

Tài liệu HTML được sử dụng để hiển thị nội dung này được hiển thị bên dưới.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>Video test page</title>
    <style>
      body {
        background: black;
        color: #cccccc;
      }
      #c2 {
        background-image: url("media/foo.png");
        background-repeat: no-repeat;
      }
      div {
        float: left;
        border: 1px solid #444444;
        padding: 10px;
        margin: 10px;
        background: #3b3b3b;
      }
    </style>
  </head>

  <body>
    <div>
      <video
        id="video"
        src="media/video.mp4"
        controls
        crossorigin="anonymous"></video>
    </div>
    <div>
      <canvas id="c1" width="160" height="96"></canvas>
      <canvas id="c2" width="160" height="96"></canvas>
    </div>
    <script src="processor.js"></script>
  </body>
</html>
```

Các điểm quan trọng cần rút ra từ vấn đề này là:

1. Tài liệu này thiết lập hai phần tử [`canvas`](/en-US/docs/Web/HTML/Reference/Elements/canvas), với ID `c1` và `c2`. Canvas `c1` được sử dụng để hiển thị khung hình hiện tại của video gốc, trong khi `c2` được sử dụng để hiển thị video sau khi thực hiện hiệu ứng khóa sắc độ; `c2` được tải sẵn hình ảnh tĩnh sẽ được sử dụng để thay thế nền xanh trong video.
2. Mã JavaScript được nhập từ tập lệnh có tên `processor.js`.

## Mã JavaScript

Mã JavaScript trong `processor.js` bao gồm ba phương thức.

### Đang khởi tạo trình phát phím sắc độ

Phương thức `doLoad()` được gọi khi tài liệu HTML được tải lần đầu. Nhiệm vụ của phương thức này là chuẩn bị các biến cần thiết cho mã xử lý sắc độ và thiết lập trình xử lý sự kiện để chúng ta có thể phát hiện thời điểm người dùng bắt đầu phát video.

```js
const processor = {};

processor.doLoad = function doLoad() {
  const video = document.getElementById("video");
  this.video = video;

  this.c1 = document.getElementById("c1");
  this.ctx1 = this.c1.getContext("2d");

  this.c2 = document.getElementById("c2");
  this.ctx2 = this.c2.getContext("2d");

  video.addEventListener("play", () => {
    this.width = video.videoWidth / 2;
    this.height = video.videoHeight / 2;
    this.timerCallback();
  });
};
```

Mã này lấy tham chiếu đến các phần tử trong tài liệu HTML được quan tâm đặc biệt, cụ thể là phần tử `video` và hai phần tử `canvas`. Nó cũng tìm nạp các tham chiếu đến bối cảnh đồ họa cho từng khung vẽ trong số hai khung vẽ. Chúng sẽ được sử dụng khi chúng ta thực sự thực hiện hiệu ứng sắc độ.

Sau đó, `addEventListener()` được gọi để bắt đầu xem phần tử `video` để chúng tôi nhận được thông báo khi người dùng nhấn nút phát trên video. Để phản hồi khi người dùng bắt đầu phát lại, mã này sẽ tìm nạp chiều rộng và chiều cao của video, giảm một nửa kích thước của video (chúng tôi sẽ giảm một nửa kích thước của video khi thực hiện hiệu ứng khóa sắc độ), sau đó gọi phương thức `timerCallback()` để bắt đầu xem video và tính toán hiệu ứng hình ảnh.

### Hẹn giờ gọi lại

Lệnh gọi lại hẹn giờ ban đầu được gọi khi video bắt đầu phát (khi sự kiện "phát" xảy ra), sau đó chịu trách nhiệm thiết lập chính nó để được gọi định kỳ nhằm khởi chạy hiệu ứng khóa cho từng khung hình.

```js
processor.timerCallback = function timerCallback() {
  if (this.video.paused || this.video.ended) {
    return;
  }
  this.computeFrame();
  setTimeout(() => {
    this.timerCallback();
  }, 0);
};
```

Điều đầu tiên mà lệnh gọi lại thực hiện là kiểm tra xem video có đang phát hay không; nếu không, cuộc gọi lại sẽ quay lại ngay lập tức mà không cần làm gì cả.

Sau đó, nó gọi phương thức `computeFrame()`, thực hiện hiệu ứng khóa sắc độ trên khung hình video hiện tại.

Điều cuối cùng mà cuộc gọi lại thực hiện là gọi `setTimeout()` để tự lên lịch gọi lại càng sớm càng tốt. Trong thế giới thực, bạn có thể lên lịch thực hiện việc này dựa trên kiến ​​thức về tốc độ khung hình của video.

### Thao tác với dữ liệu khung hình video

Phương thức `computeFrame()`, được hiển thị bên dưới, chịu trách nhiệm thực sự tìm nạp một khung dữ liệu và thực hiện hiệu ứng khóa sắc độ.

```js
processor.computeFrame = function () {
  this.ctx1.drawImage(this.video, 0, 0, this.width, this.height);
  const frame = this.ctx1.getImageData(0, 0, this.width, this.height);
  const data = frame.data;

  for (let i = 0; i < data.length; i += 4) {
    const red = data[i + 0];
    const green = data[i + 1];
    const blue = data[i + 2];
    if (green > 100 && red > 100 && blue < 43) {
      data[i + 3] = 0;
    }
  }
  this.ctx2.putImageData(frame, 0, 0);
};
```

Khi quy trình này được gọi, phần tử video sẽ hiển thị khung dữ liệu video gần đây nhất, trông giống như sau:

![Một khung hình duy nhất của phần tử video. Có một người mặc áo phông đen. Màu nền là màu vàng.](video.png)

Khung hình video đó được sao chép vào ngữ cảnh đồ họa `ctx1` của khung vẽ đầu tiên, chỉ định chiều cao và chiều rộng bằng các giá trị mà chúng tôi đã lưu trước đó để vẽ khung ở kích thước một nửa. Lưu ý rằng bạn có thể chuyển phần tử video vào phương thức `drawImage()` của ngữ cảnh để vẽ khung hình video hiện tại vào ngữ cảnh. Kết quả là:

![Một khung hình duy nhất của phần tử video. Có một người mặc áo phông đen. Màu nền là màu vàng. Đây là phiên bản nhỏ hơn của hình trên.](sourcectx.png)

Gọi phương thức `getImageData()` trong ngữ cảnh đầu tiên sẽ tìm nạp bản sao dữ liệu đồ họa thô cho khung hình video hiện tại. Điều này cung cấp dữ liệu hình ảnh pixel 32 bit thô mà chúng ta có thể thao tác. Sau đó, chúng tôi tính toán số pixel trong hình ảnh bằng cách chia tổng kích thước dữ liệu hình ảnh của khung cho 4.

Vòng lặp `for` quét qua các pixel của khung, lấy ra các giá trị màu đỏ, xanh lục và xanh lam cho từng pixel và so sánh các giá trị với các số được xác định trước được sử dụng để phát hiện màn hình xanh lục sẽ được thay thế bằng hình nền tĩnh được nhập từ `foo.png`.

Mỗi pixel trong dữ liệu hình ảnh của khung được tìm thấy nằm trong các tham số được coi là một phần của màn hình xanh có giá trị alpha được thay thế bằng 0, cho biết pixel đó hoàn toàn trong suốt. Kết quả là hình ảnh cuối cùng có toàn bộ khu vực màn hình xanh trong suốt 100%, do đó khi nó được vẽ vào bối cảnh đích bằng `ctx2.putImageData`, kết quả là một lớp phủ lên phông nền tĩnh.

Hình ảnh kết quả trông như thế này:

![Một khung hình duy nhất của phần tử video hiển thị cùng một người mặc áo phông đen như trong các ảnh trên. Hình nền khác: đó là logo Firefox.](output.png)

Việc này được thực hiện lặp đi lặp lại khi video phát, sao cho hết khung hình này đến khung hình khác được xử lý và hiển thị bằng hiệu ứng phím sắc độ.

[Xem nguồn đầy đủ cho ví dụ này](https://github.com/mdn/dom-examples/tree/main/canvas/chroma-keying).

## Xem thêm

- [Công nghệ truyền thông web](/en-US/docs/Web/Media)
- [Hướng dẫn về các loại và định dạng phương tiện trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Khu vực học tập: Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
