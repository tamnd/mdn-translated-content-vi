---
title: "VideoFrame: VideoFrame() constructor"
short-title: VideoFrame()
slug: Web/API/VideoFrame/VideoFrame
page-type: web-api-constructor
browser-compat: api.VideoFrame.VideoFrame
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`VideoFrame()`** tạo một đối tượng {{domxref("VideoFrame")}} mới đại diện cho một khung hình của video.

## Cú pháp

```js-nolint
new VideoFrame(image)
new VideoFrame(image, options)
new VideoFrame(data, options)
```

### Tham số

Loại hàm khởi tạo đầu tiên (xem ở trên) tạo một {{domxref("VideoFrame")}} mới từ một ảnh. Các tham số của nó là:

- `image`
  - : Một ảnh chứa dữ liệu hình ảnh cho `VideoFrame` mới. Nó có thể là một trong các đối tượng sau:
    một {{domxref("SVGImageElement")}},
    một {{domxref("HTMLVideoElement")}},
    một {{domxref("HTMLCanvasElement")}},
    một {{domxref("ImageBitmap")}},
    một {{domxref("OffscreenCanvas")}},
    hoặc một {{domxref("VideoFrame")}} khác.
- `options` {{Optional_Inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `duration` {{Optional_Inline}}
      - : Một số nguyên đại diện cho thời lượng của khung hình tính bằng microsecond.
    - `timestamp`
      - : Một số nguyên đại diện cho dấu thời gian của khung hình tính bằng microsecond.
    - `alpha` {{Optional_Inline}}
      - : Một chuỗi mô tả cách tác nhân người dùng xử lý kênh alpha. Giá trị mặc định là "keep".
        - `"keep"`: Cho biết tác nhân người dùng nên giữ nguyên dữ liệu kênh alpha.
        - `"discard"`: Cho biết tác nhân người dùng nên bỏ qua hoặc xóa dữ liệu kênh alpha.
    - `visibleRect` {{Optional_Inline}}
      - : Một đối tượng đại diện cho hình chữ nhật hiển thị của `VideoFrame`, chứa các thuộc tính:
        - `x`
          - : Tọa độ x.
        - `y`
          - : Tọa độ y.
        - `width`
          - : Chiều rộng của khung hình.
        - `height`
          - : Chiều cao của khung hình.
    - `displayWidth` {{Optional_Inline}}
      - : Chiều rộng của `VideoFrame` khi được hiển thị sau khi áp dụng điều chỉnh tỷ lệ khung hình.
    - `displayHeight` {{Optional_Inline}}
      - : Chiều cao của `VideoFrame` khi được hiển thị sau khi áp dụng điều chỉnh tỷ lệ khung hình.
    - `flip` {{optional_inline}}
      - : Một boolean. Nếu là `true`, phản chiếu theo chiều ngang sẽ được áp dụng. Mặc định là `false`.
    - `rotation` {{optional_inline}}
      - : Một số nguyên đại diện cho góc xoay (0, 90, 180, hoặc 270) tính bằng độ theo chiều kim đồng hồ. Mặc định là `0`. Các số tùy ý (bao gồm số âm) được làm tròn đến góc phần tư tiếp theo.

Loại hàm khởi tạo thứ hai (xem ở trên) tạo một {{domxref("VideoFrame")}} mới từ một {{jsxref("ArrayBuffer")}}. Các tham số của nó là:

- `data`
  - : Một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, hoặc một {{jsxref("DataView")}} chứa dữ liệu cho `VideoFrame` mới.
- `options`
  - : Một đối tượng chứa các thuộc tính sau:
    - `format`
      - : Một chuỗi đại diện cho định dạng pixel video. Một trong các chuỗi sau, được mô tả đầy đủ trên trang thuộc tính {{domxref("VideoFrame.format","format")}}:
        - `"I420"`
        - `"I420A"`
        - `"I422"`
        - `"I444"`
        - `"NV12"`
        - `"RGBA"`
        - `"RGBX"`
        - `"BGRA"`
        - `"BGRX"`
    - `codedWidth`
      - : Chiều rộng của `VideoFrame` tính bằng pixel, có thể bao gồm phần đệm không hiển thị, và trước khi xem xét các điều chỉnh tỷ lệ tiềm năng.
    - `codedHeight`
      - : Chiều cao của `VideoFrame` tính bằng pixel, có thể bao gồm phần đệm không hiển thị, và trước khi xem xét các điều chỉnh tỷ lệ tiềm năng.
    - `timestamp`
      - : Một số nguyên đại diện cho dấu thời gian của khung hình tính bằng microsecond.
    - `duration` {{Optional_Inline}}
      - : Một số nguyên đại diện cho thời lượng của khung hình tính bằng microsecond.
    - `layout` {{Optional_Inline}}
      - : Danh sách chứa các giá trị sau cho mỗi mặt phẳng trong `VideoFrame`:
        - `offset`
          - : Một số nguyên đại diện cho độ lệch tính bằng byte nơi mặt phẳng đã cho bắt đầu.
        - `stride`
          - : Một số nguyên đại diện cho số byte, bao gồm phần đệm, được sử dụng bởi mỗi hàng của mặt phẳng.
            Các mặt phẳng không được chồng lên nhau. Nếu không có `layout` được chỉ định, các mặt phẳng sẽ được đóng gói chặt chẽ.
    - `visibleRect` {{Optional_Inline}}
      - : Một đối tượng đại diện cho hình chữ nhật hiển thị của `VideoFrame`, chứa các thuộc tính:
        - `x`
          - : Tọa độ x.
        - `y`
          - : Tọa độ y.
        - `width`
          - : Chiều rộng của khung hình.
        - `height`
          - : Chiều cao của khung hình.
    - `displayWidth` {{Optional_Inline}}
      - : Chiều rộng của `VideoFrame` khi được hiển thị sau khi áp dụng điều chỉnh tỷ lệ khung hình.
    - `displayHeight` {{Optional_Inline}}
      - : Chiều cao của `VideoFrame` khi được hiển thị sau khi áp dụng điều chỉnh tỷ lệ khung hình.
    - `colorSpace`
      - : Một đối tượng đại diện cho không gian màu của `VideoFrame`, chứa các thuộc tính:
        - `primaries`
          - : Một chuỗi đại diện cho các nguyên sắc màu video, được mô tả trên trang thuộc tính {{domxref("VideoColorSpace.primaries")}}.
        - `transfer`
          - : Một chuỗi đại diện cho hàm truyền màu video, được mô tả trên trang thuộc tính {{domxref("VideoColorSpace.transfer")}}.
        - `matrix`
          - : Một chuỗi đại diện cho ma trận màu video, được mô tả trên trang thuộc tính {{domxref("VideoColorSpace.matrix")}}.
        - `fullRange`
          - : Một boolean. Nếu là `true`, cho biết các giá trị màu toàn dải được sử dụng.
    - `transfer`
      - : Một mảng các {{jsxref("ArrayBuffer")}} mà `VideoFrame` sẽ tách ra và lấy quyền sở hữu. Nếu mảng chứa {{jsxref("ArrayBuffer")}} sao lưu `data`, `VideoFrame` sẽ sử dụng bộ đệm đó trực tiếp thay vì sao chép từ nó.
    - `flip` {{optional_inline}}
      - : Một boolean. Nếu là `true`, phản chiếu theo chiều ngang sẽ được áp dụng. Mặc định là `false`.
    - `rotation` {{optional_inline}}
      - : Một số nguyên đại diện cho góc xoay (0, 90, 180, hoặc 270) tính bằng độ theo chiều kim đồng hồ. Mặc định là `0`. Các số tùy ý (bao gồm số âm) được làm tròn đến góc phần tư tiếp theo.

## Ví dụ

Các ví dụ sau đây từ bài viết [Video processing with WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs). Trong ví dụ đầu tiên này, một `VideoFrame` được tạo từ canvas.

```js
const cnv = document.createElement("canvas");
// draw something on the canvas
// …
const frameFromCanvas = new VideoFrame(cnv, { timestamp: 0 });
```

Trong ví dụ sau, một `VideoFrame` được tạo từ một {{jsxref("TypedArray")}}.

```js
const pixelSize = 4;
const init = {
  timestamp: 0,
  codedWidth: 320,
  codedHeight: 200,
  format: "RGBA",
};
const data = new Uint8Array(init.codedWidth * init.codedHeight * pixelSize);
for (let x = 0; x < init.codedWidth; x++) {
  for (let y = 0; y < init.codedHeight; y++) {
    const offset = (y * init.codedWidth + x) * pixelSize;
    data[offset] = 0x7f; // Red
    data[offset + 1] = 0xff; // Green
    data[offset + 2] = 0xd4; // Blue
    data[offset + 3] = 0x0ff; // Alpha
  }
}
init.transfer = [data.buffer];
const frame = new VideoFrame(data, init);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
