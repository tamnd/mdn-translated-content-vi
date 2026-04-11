---
title: SourceBuffer
slug: Web/API/SourceBuffer
page-type: web-api-interface
browser-compat: api.SourceBuffer
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`SourceBuffer`** đại diện cho một đoạn phương tiện được truyền vào {{domxref("HTMLMediaElement")}} và được phát thông qua đối tượng {{domxref("MediaSource")}}. Điều này có thể được tạo thành từ một hoặc một số phân đoạn phương tiện truyền thông.

{{InheritanceDiagram}}


## Thuộc tính phiên bản

- {{domxref("SourceBuffer.appendWindowEnd")}}
  - : Kiểm soát dấu thời gian ở cuối cửa sổ chắp thêm.
- {{domxref("SourceBuffer.appendWindowStart")}}
  - : Kiểm soát dấu thời gian để bắt đầu [nối thêm cửa sổ](https://w3c.github.io/media-source/#append-window). Đây là phạm vi dấu thời gian có thể được sử dụng để lọc dữ liệu phương tiện nào được thêm vào `SourceBuffer`. Các khung phương tiện được mã hóa có dấu thời gian trong phạm vi này sẽ được thêm vào, trong khi những khung nằm ngoài phạm vi này sẽ bị lọc ra.
- {{domxref("SourceBuffer.audioTracks")}} {{ReadOnlyInline}}
  - : Danh sách các bản âm thanh hiện có trong `SourceBuffer`.
- {{domxref("SourceBuffer.buffered")}} {{ReadOnlyInline}}
  - : Trả về phạm vi thời gian hiện được lưu vào bộ đệm trong `SourceBuffer`.
- {{domxref("SourceBuffer.mode")}}
  - : Kiểm soát cách xử lý thứ tự của các phân đoạn phương tiện trong `SourceBuffer`, về việc chúng có thể được thêm vào theo bất kỳ thứ tự nào hay chúng phải được giữ theo một trình tự nghiêm ngặt.
- {{domxref("SourceBuffer.textTracks")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Danh sách các đoạn văn bản hiện có trong `SourceBuffer`.
- {{domxref("SourceBuffer.timestampOffset")}}
  - : Kiểm soát độ lệch được áp dụng cho dấu thời gian bên trong các phân đoạn phương tiện được thêm vào `SourceBuffer`.
- {{domxref("SourceBuffer.updating")}} {{ReadOnlyInline}}
  - : Một boolean cho biết liệu `SourceBuffer` hiện có đang được cập nhật hay không - tức là, một thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hay {{domxref("SourceBuffer.remove", "remove()")}} hiện đang được tiến hành.
- {{domxref("SourceBuffer.videoTracks")}} {{ReadOnlyInline}}
  - : Danh sách các bản nhạc video hiện có trong `SourceBuffer`.


## Các phương thức thực thể

_Kế thừa các phương thức từ giao diện chính của nó, {{domxref("EventTarget")}}._

- {{domxref("SourceBuffer.abort()")}}
  - : Hủy bỏ phân đoạn hiện tại và đặt lại trình phân tích cú pháp phân đoạn.
- {{domxref("SourceBuffer.appendBuffer()")}}
  - : Nối dữ liệu phân đoạn phương tiện từ đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} vào `SourceBuffer`.
- {{domxref("SourceBuffer.appendBufferAsync()")}} {{Non-standard_Inline}} {{Experimental_Inline}}
  - : Bắt đầu quá trình thêm không đồng bộ bộ đệm được chỉ định vào `SourceBuffer`. Trả về {{jsxref("Promise")}} được hoàn thành sau khi bộ đệm được thêm vào.
- {{domxref("SourceBuffer.changeType()")}}
  - : Thay đổi {{Glossary("MIME type")}} mà các lệnh gọi trong tương lai tới {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} sẽ yêu cầu dữ liệu mới tuân theo.
- {{domxref("SourceBuffer.remove()")}}
  - : Xóa các phân đoạn phương tiện trong một phạm vi thời gian cụ thể khỏi `SourceBuffer`.
- {{domxref("SourceBuffer.removeAsync()")}} {{Non-standard_Inline}} {{Experimental_Inline}}

  - : Bắt đầu quá trình loại bỏ không đồng bộ các phân đoạn phương tiện trong phạm vi được chỉ định khỏi `SourceBuffer`. Trả về {{jsxref("Promise")}} được thực hiện sau khi tất cả các phân đoạn phù hợp đã bị xóa.

## Sự kiện

- {{domxref("SourceBuffer.abort_event", "abort")}}
  - : Được kích hoạt khi việc thêm bộ đệm bị hủy bỏ, vì phương thức {{domxref("SourceBuffer.abort()")}} hoặc {{domxref("MediaSource.removeSourceBuffer()")}} được gọi trong khi thuật toán {{domxref("SourceBuffer.appendBuffer()")}} vẫn đang chạy. {{domxref("SourceBuffer.updating")}} thay đổi từ `true` thành `false`.
- {{domxref("SourceBuffer.error_event", "error")}}
  - : Được kích hoạt khi xảy ra lỗi trong quá trình xử lý thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}}. {{domxref("SourceBuffer.updating")}} thay đổi từ `true` thành `false`.
- {{domxref("SourceBuffer.update_event", "update")}}
  - : Được kích hoạt bất cứ khi nào {{domxref("SourceBuffer.appendBuffer()")}} hoặc {{domxref("SourceBuffer.remove()")}} hoàn thành. {{domxref("SourceBuffer.updating")}} thay đổi từ `true` thành `false`.
- {{domxref("SourceBuffer.updateend_event", "updateend")}}
  - : Được kích hoạt sau khi hoàn thành (không nhất thiết thành công) thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hoặc {{domxref("SourceBuffer.remove", "remove()")}}. Sự kiện này được kích hoạt sau các sự kiện `update`, `error` hoặc `abort`.

- {{domxref("SourceBuffer.updatestart_event", "updatestart")}}

  - : Được kích hoạt khi thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hoặc {{domxref("SourceBuffer.remove", "remove()")}} bắt đầu. {{domxref("SourceBuffer.updating", "updating")}} thay đổi từ `false` thành `true`.

## Ví dụ

### Đang tải từng đoạn video

Ví dụ sau đây tải từng đoạn video nhanh nhất có thể, phát video đó ngay khi có thể.

Bạn có thể xem mã hoàn chỉnh tại <https://github.com/mdn/dom-examples/tree/main/sourcebuffer> và dùng thử bản demo trực tiếp tại <https://mdn.github.io/dom-examples/sourcebuffer/>.

````js
const video = document.querySelector("video");

const assetURL = "frag_bunny.mp4";
// Need to be specific for Blink regarding codecs
const mimeCodec = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"';

function loadVideo() {
  if (MediaSource.isTypeSupported(mimeCodec)) {
    const mediaSource = new MediaSource();
    console.log(mediaSource.readyState); // closed
    video.src = URL.createObjectURL(mediaSource);
    mediaSource.addEventListener("sourceopen", sourceOpen);
  } else {
    console.error("Unsupported MIME type or codec: ", mimeCodec);
  }
}

async function sourceOpen() {
  console.log(this.readyState); // open
  const sourceBuffer = this.addSourceBuffer(mimeCodec);
  const response = await fetch(assetURL);
  const buffer = await response.arrayBuffer();
  sourceBuffer.addEventListener("updateend", () => {
    this.endOfStream();
    video.play();
    console.log(this.readyState); // ended
  });
  sourceBuffer.appendBuffer(buffer);
}

const load = document.querySelector("#load");
load.addEventListener("click", loadVideo);
```## Thông số kỹ thuật

{{Specifications}}


## Khả năng tương thích của trình duyệt
{{Compat}}

## Xem thêm
- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
````
