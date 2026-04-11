---
title: Kết cấu hoạt hình trong WebGL
slug: Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL
page-type: guide
---

{{Previous("Web/API/WebGL_API/Tutorial/Lighting_in_WebGL")}} {{Previous("Web/API/WebGL_API/Tutorial/Lighting_in_WebGL")}}
Trong phần trình diễn này, chúng tôi xây dựng dựa trên ví dụ trước bằng cách thay thế kết cấu tĩnh bằng các khung của tệp video mp4 đang phát. Điều này thực sự khá dễ làm và thú vị để xem, vì vậy hãy bắt đầu. Bạn có thể sử dụng mã tương tự để sử dụng bất kỳ loại dữ liệu nào (chẳng hạn như {{ HTMLElement("canvas") }}) làm nguồn cho họa tiết của mình.

## Truy cập vào video

Bước đầu tiên là tạo phần tử {{ HTMLElement("video") }} mà chúng ta sẽ sử dụng để truy xuất các khung hình video.

> [!NOTE]
> Thêm phần khai báo này vào phần đầu tập lệnh "webgl-demo.js" của bạn:

```js
// will set to true when video can be copied to texture
let copyVideo = false;
```

> [!NOTE]
> Thêm chức năng này vào tập lệnh "webgl-demo.js" của bạn:

```js
function setupVideo(url) {
  const video = document.createElement("video");

  let playing = false;
  let timeupdate = false;

  video.playsInline = true;
  video.muted = true;
  video.loop = true;

  // Waiting for these 2 events ensures
  // there is data in the video

  video.addEventListener("playing", () => {
    playing = true;
    checkReady();
  });

  video.addEventListener("timeupdate", () => {
    timeupdate = true;
    checkReady();
  });

  video.src = url;
  video.play();

  function checkReady() {
    if (playing && timeupdate) {
      copyVideo = true;
    }
  }

  return video;
}
```

Đầu tiên chúng ta tạo một phần tử video. Chúng tôi đặt nó ở chế độ tự động phát, tắt âm thanh và lặp lại video. Sau đó, chúng tôi thiết lập hai sự kiện để đảm bảo video đang phát và thời gian đã được cập nhật. Chúng tôi cần cả hai bước kiểm tra này vì nó sẽ gây ra lỗi nếu bạn tải video lên WebGL chưa có dữ liệu. Việc kiểm tra cả hai sự kiện này sẽ đảm bảo có sẵn dữ liệu và việc bắt đầu tải video lên kết cấu WebGL là an toàn. Trong đoạn mã trên, chúng tôi xác nhận xem liệu chúng tôi có nhận được cả hai sự kiện đó hay không; nếu vậy, chúng tôi đặt biến toàn cục, `copyVideo`, thành true để cho biết rằng việc bắt đầu sao chép video sang họa tiết là an toàn.

Và cuối cùng, chúng ta đặt thuộc tính `src` để bắt đầu và gọi `play` để bắt đầu tải và phát video.

Video phải được tải từ một nguồn an toàn để được sử dụng nhằm cung cấp dữ liệu kết cấu cho WebGL. Điều đó có nghĩa là bạn không chỉ cần triển khai mã như sử dụng máy chủ web bảo mật mà còn cần một máy chủ bảo mật để kiểm tra. Xem [Làm cách nào để thiết lập máy chủ thử nghiệm cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server) để được trợ giúp.

## Sử dụng khung hình video làm họa tiết

Thay đổi tiếp theo là khởi tạo kết cấu, việc này trở nên đơn giản hơn nhiều vì chúng ta không cần tải tệp hình ảnh nữa. Thay vào đó, chúng tôi tạo một đối tượng kết cấu trống, đặt một pixel vào đó và đặt bộ lọc của nó để sử dụng sau.

> [!NOTE]
> Thay thế hàm `loadTexture()` trong "webgl-demo.js" bằng đoạn mã sau:

```js
function initTexture(gl) {
  const texture = gl.createTexture();
  gl.bindTexture(gl.TEXTURE_2D, texture);

  // Because video has to be download over the internet
  // they might take a moment until it's ready so
  // put a single pixel in the texture so we can
  // use it immediately.
  const level = 0;
  const internalFormat = gl.RGBA;
  const width = 1;
  const height = 1;
  const border = 0;
  const srcFormat = gl.RGBA;
  const srcType = gl.UNSIGNED_BYTE;
  const pixel = new Uint8Array([0, 0, 255, 255]); // opaque blue
  gl.texImage2D(
    gl.TEXTURE_2D,
    level,
    internalFormat,
    width,
    height,
    border,
    srcFormat,
    srcType,
    pixel,
  );

  // Turn off mips and set wrapping to clamp to edge so it
  // will work regardless of the dimensions of the video.
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
  gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);

  return texture;
}
```

> [!NOTE]
> Thêm chức năng sau vào "webgl-demo.js":

```js
function updateTexture(gl, texture, video) {
  const level = 0;
  const internalFormat = gl.RGBA;
  const srcFormat = gl.RGBA;
  const srcType = gl.UNSIGNED_BYTE;
  gl.bindTexture(gl.TEXTURE_2D, texture);
  gl.texImage2D(
    gl.TEXTURE_2D,
    level,
    internalFormat,
    srcFormat,
    srcType,
    video,
  );
}
```

Bạn đã từng thấy mã này trước đây. Nó gần giống với hàm tải hình ảnh trong ví dụ trước — ngoại trừ khi chúng ta gọi `texImage2D()`, thay vì truyền một đối tượng `Image`, chúng ta truyền vào phần tử {{ HTMLElement("video") }}. WebGL biết cách kéo khung hình hiện tại ra và sử dụng nó làm kết cấu.

Tiếp theo, chúng ta cần gọi các hàm mới này từ hàm `main()`.

> [!NOTE]
> Trong hàm `main()` của bạn, hãy thay thế lệnh gọi `loadTexture()` bằng mã này:

```js
const texture = initTexture(gl);
const video = setupVideo("Firefox.mp4");
```

> [!NOTE]
> Bạn cũng cần tải tệp [Firefox.mp4](https://github.com/mdn/dom-examples/blob/main/webgl-examples/tutorial/sample8/Firefox.mp4) xuống cùng thư mục cục bộ với các tệp JavaScript của bạn.

> [!NOTE]
> Trong hàm `main()` của bạn, hãy thay thế hàm `render()` bằng hàm này:

```js
// Draw the scene repeatedly
function render(now) {
  now *= 0.001; // convert to seconds
  deltaTime = now - then;
  then = now;

  if (copyVideo) {
    updateTexture(gl, texture, video);
  }

  drawScene(gl, programInfo, buffers, texture, cubeRotation);
  cubeRotation += deltaTime;

  requestAnimationFrame(render);
}
```

Nếu `copyVideo` là đúng, chúng ta gọi `updateTexture()` ngay trước khi gọi hàm `drawScene()`.

Đó là tất cả những gì cần làm!

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample8/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample8) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample8/)

## Xem thêm

- [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)

{{Previous("Web/API/WebGL_API/Tutorial/Lighting_in_WebGL")}}
