---
title: "HTMLMediaElement: thuộc tính srcObject"
short-title: srcObject
slug: Web/API/HTMLMediaElement/srcObject
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.srcObject
---

{{APIRef("HTML DOM")}}

Thuộc tính **`srcObject`** của
Giao diện {{domxref("HTMLMediaElement")}} đặt hoặc trả về đối tượng đóng vai trò là
nguồn của phương tiện được liên kết với {{domxref("HTMLMediaElement")}} hoặc `null` nếu không được chỉ định.

Đối tượng có thể là {{domxref("MediaStream")}}, {{domxref("MediaSource")}}, a
{{domxref("Blob")}} hoặc {{domxref("File")}} (kế thừa từ `Blob`).

> [!NOTE]
> Kể từ tháng 3 năm 2020, chỉ Safari mới hỗ trợ đầy đủ cho `srcObject`, tức là sử dụng các đối tượng `MediaSource`, `MediaStream`, `Blob` và `File` làm giá trị. Các trình duyệt khác hỗ trợ đối tượng `MediaStream`; cho đến khi họ bắt kịp, hãy cân nhắc quay lại việc tạo URL bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}} và gán nó cho {{domxref("HTMLMediaElement.src")}} (xem ví dụ bên dưới). Ngoài ra, kể từ phiên bản 108, Chrome hỗ trợ gắn đối tượng `MediaSource` chuyên dụng bằng cách gán phiên bản {{domxref("MediaSourceHandle")}} của đối tượng đó (được chuyển từ nhân viên) sang `srcObject`.

## Giá trị

A {{domxref('MediaStream')}}, {{domxref('MediaSource')}}, {{domxref('Blob')}}, hoặc
Đối tượng {{domxref('File')}} (mặc dù hãy xem bảng tương thích để biết nội dung thực tế
được hỗ trợ) hoặc `null` nếu không được chỉ định.

## Ghi chú sử dụng

Cần có các phiên bản cũ hơn của đặc tả Nguồn phương tiện bằng cách sử dụng
{{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}} để tạo URL đối tượng thì
đặt {{domxref("HTMLMediaElement.src", "src")}} cho URL đó. Bây giờ bạn có thể chỉ cần thiết lập
`srcObject` tới {{domxref("MediaStream")}} một cách trực tiếp.

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ này, {{domxref("MediaStream")}} từ máy ảnh được gán cho
phần tử {{HTMLElement("video")}} mới được tạo.

```js
const mediaStream = await navigator.mediaDevices.getUserMedia({ video: true });
const video = document.createElement("video");
video.srcObject = mediaStream;
```

Trong ví dụ này, {{domxref('MediaSource')}} mới được gán cho một địa chỉ mới được tạo
Phần tử {{HTMLElement("video")}}.

```js
const mediaSource = new MediaSource();
const video = document.createElement("video");
video.srcObject = mediaSource;
```

### Hỗ trợ dự phòng cho thuộc tính src

Các ví dụ bên dưới hỗ trợ các phiên bản trình duyệt cũ hơn yêu cầu bạn tạo một đối tượng
URL và gán nó cho `src` nếu `srcObject` không được hỗ trợ.

Đầu tiên, {{domxref("MediaStream")}} từ máy ảnh được gán cho một địa chỉ mới được tạo
Phần tử {{HTMLElement("video")}}, với tính năng dự phòng cho các trình duyệt cũ hơn.

```js
const mediaStream = await navigator.mediaDevices.getUserMedia({ video: true });
const video = document.createElement("video");
if ("srcObject" in video) {
  video.srcObject = mediaStream;
} else {
  // Avoid using this in new browsers, as it is going away.
  video.src = URL.createObjectURL(mediaStream);
}
```

Thứ hai, {{domxref('MediaSource')}} mới được gán cho một địa chỉ mới được tạo
Phần tử {{HTMLElement("video")}}, với tính năng dự phòng cho các trình duyệt cũ hơn và các trình duyệt
chưa hỗ trợ trực tiếp việc gán {{domxref('MediaSource')}}.

```js
const mediaSource = new MediaSource();
const video = document.createElement("video");
// Older browsers may not have srcObject
if ("srcObject" in video) {
  try {
    video.srcObject = mediaSource;
  } catch (err) {
    if (err.name !== "TypeError") {
      throw err;
    }
    // Even if they do, they may only support MediaStream
    video.src = URL.createObjectURL(mediaSource);
  }
} else {
  video.src = URL.createObjectURL(mediaSource);
}
```

### Xây dựng `MediaSource` trong một công nhân và chuyển nó vào luồng chính để chơi

Thuộc tính {{domxref("MediaSource.handle")}} có thể được truy cập bên trong một trình chạy chuyên dụng và đối tượng {{domxref("MediaSourceHandle")}} sau đó được chuyển sang luồng đã tạo trình chạy (trong trường hợp này là luồng chính) thông qua lệnh gọi {{domxref("DedicatedWorkerGlobalScope.postMessage()", "postMessage()")}}:

```js
// Inside dedicated worker
let mediaSource = new MediaSource();
let handle = mediaSource.handle;
// Transfer the handle to the context that created the worker
postMessage({ arg: handle }, [handle]);

mediaSource.addEventListener("sourceopen", () => {
  // Await sourceopen on MediaSource before creating SourceBuffers
  // and populating them with fetched media — MediaSource won't
  // accept creation of SourceBuffers until it is attached to the
  // HTMLMediaElement and its readyState is "open"
});
```

Trong luồng chính, chúng ta nhận được phần điều khiển thông qua trình xử lý sự kiện {{domxref("Worker.message_event", "message")}}, gắn nó vào {{htmlelement("video")}} thông qua thuộc tính `HTMLMediaElement.srcObject` của nó và {{domxref("HTMLMediaElement.play()", "play")}} video:

```js
worker.addEventListener("message", (msg) => {
  let mediaSourceHandle = msg.data.arg;
  video.srcObject = mediaSourceHandle;
  video.play();
});
```

> [!NOTE]
> {{domxref("MediaSourceHandle")}}s không thể được chuyển thành công vào hoặc thông qua một nhân viên dùng chung hoặc nhân viên dịch vụ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
