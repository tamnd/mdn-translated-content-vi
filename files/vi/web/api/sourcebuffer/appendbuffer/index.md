---
title: "SourceBuffer: phương thứcappendBuffer()"
short-title: appendBuffer()
slug: Web/API/SourceBuffer/appendBuffer
page-type: web-api-instance-method
browser-compat: api.SourceBuffer.appendBuffer
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`appendBuffer()`** của
Giao diện {{domxref("SourceBuffer")}} nối thêm dữ liệu phân đoạn phương tiện từ một
Đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}
tới `SourceBuffer`.


## Cú pháp

```js-nolint
appendBuffer(source)
```


### Thông số

- `source`
  - : Đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}

    chứa dữ liệu phân đoạn phương tiện bạn muốn thêm vào `SourceBuffer`.

### Giá trị trả về


Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném vào một trong các trường hợp sau:
    - Thuộc tính `updating` của đối tượng `SourceBuffer` là `true`. Bạn phải đợi mọi thao tác thêm, cập nhật hoặc xóa trước đó hoàn tất (được biểu thị bằng sự kiện `updateend`) trước khi gọi lại `appendBuffer()`.
    - `SourceBuffer` đã bị xóa khỏi thuộc tính `sourceBuffers` của nguồn phương tiện gốc.
    - Thuộc tính `error` của `HTMLMediaElement` không phải là `null`.
- {{domxref("QuotaExceededError")}}

  - : Bộ đệm đã đầy, không thể thêm thêm dữ liệu nữa. Điều này có thể xảy ra nếu `SourceBuffer` đã đạt đến giới hạn do trình duyệt xác định về lượng dữ liệu được lưu vào bộ đệm.


Ngoài ra, lỗi có thể xảy ra sau khi sự kiện `updatestart` được kích hoạt và phương thức `appendBuffer()` đã trả về: ví dụ: do bộ đệm chứa các byte được định dạng không chính xác. Trong trường hợp này, sự kiện `error` sẽ được kích hoạt trên phiên bản `SourceBuffer` này.

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ này minh họa việc thêm dữ liệu video vào phần tử video để phát lại. `MediaSource` cung cấp dữ liệu video và `SourceBuffer` thêm dữ liệu đó. Ví dụ này tìm nạp dữ liệu phân đoạn video, thêm nó vào `SourceBuffer` và kết thúc luồng khi kết thúc.

```js
const mediaSource = new MediaSource();
const video = document.querySelector("video");
video.src = URL.createObjectURL(mediaSource);

mediaSource.addEventListener("sourceopen", async () => {
  const sourceBuffer = mediaSource.addSourceBuffer(
    'video/mp4; codecs="avc1.42E01E, mp4a.40.2"',
  );

  const buffer = await fetch("/my-video-segment.mp4").then((res) =>
    res.arrayBuffer(),
  );
  sourceBuffer.appendBuffer(buffer);
  sourceBuffer.addEventListener("updateend", () => {
    if (mediaSource.readyState === "open") {

      mediaSource.endOfStream();
    }
  });
});
```

### Xử lý lỗi

Ví dụ này trình bày cách xử lý các lỗi có thể xảy ra khi gọi `appendBuffer()`.

Nó gọi `appendBuffer()` bên trong khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để bắt và xử lý các ngoại lệ mà phương thức đưa ra một cách đồng bộ. Nó cũng lắng nghe sự kiện `error` để xử lý các lỗi xảy ra sau khi `appendBuffer()` trả về, trong khi bộ đệm đang được cập nhật không đồng bộ.

```js
sourceBuffer.addEventListener("error", (e) => {
  console.error("Error appending buffer:", e);
  // Handle the error appropriately, e.g., show a message to the user,
  // try a different source, or stop playback.
});

try {
  sourceBuffer.appendBuffer(data);
} catch (e) {
  if (e.name === "InvalidStateError") {
    console.error(
      "InvalidStateError: The SourceBuffer is in an invalid state.",
    );
  } else if (e.name === "QuotaExceededError") {

    console.error("QuotaExceededError: The buffer is full.");
  } else {
    console.error("An unexpected error occurred:", e);

  }
}
```


## Thông số kỹ thuật


{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
