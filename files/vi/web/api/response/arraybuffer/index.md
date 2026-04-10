---
title: "Response: phương thức arrayBuffer()"
short-title: arrayBuffer()
slug: Web/API/Response/arrayBuffer
page-type: web-api-instance-method
browser-compat: api.Response.arrayBuffer
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`arrayBuffer()`** của giao diện {{domxref("Response")}} nhận một luồng {{domxref("Response")}} và đọc nó cho đến khi hoàn tất. Phương thức này trả về một promise được giải quyết bằng một {{jsxref("ArrayBuffer")}}.

## Cú pháp

```js-nolint
arrayBuffer()
```

### Tham số

Không có.

### Giá trị trả về

Một promise được giải quyết bằng một {{jsxref("ArrayBuffer")}}.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị [hủy](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Được ném ra vì một trong các lý do sau:
    - Phần thân phản hồi đã bị [xáo trộn hoặc khóa](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Đã xảy ra lỗi khi giải mã nội dung phần thân, ví dụ vì header {{httpheader("Content-Encoding")}} không đúng.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu có vấn đề khi tạo `ArrayBuffer` liên kết, ví dụ nếu kích thước dữ liệu quá lớn.

## Ví dụ

### Phát nhạc

Trong [fetch array buffer live](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-array-buffer) của chúng tôi, có một nút Play. Khi nút được nhấn, hàm `getData()` sẽ chạy. Lưu ý rằng trước khi phát, toàn bộ tệp âm thanh sẽ được tải xuống. Nếu bạn cần phát ogg trong khi đang tải xuống (phát luồng) thì hãy cân nhắc dùng {{domxref("HTMLAudioElement")}}:

```js
new Audio("music.ogg").play();
```

Trong `getData()`, chúng ta tạo một yêu cầu mới bằng bộ khởi tạo {{domxref("Request.Request","Request()")}}, rồi dùng nó để tìm nạp một bản nhạc OGG. Chúng ta cũng dùng {{domxref("BaseAudioContext/createBufferSource", "AudioContext.createBufferSource")}} để tạo một nguồn bộ đệm âm thanh. Khi việc tìm nạp thành công, chúng ta đọc một {{jsxref("ArrayBuffer")}} từ phản hồi bằng `arrayBuffer()`, giải mã dữ liệu âm thanh bằng {{domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()")}}, đặt dữ liệu đã giải mã làm bộ đệm của nguồn âm thanh (`source.buffer`), rồi kết nối nguồn với {{domxref("BaseAudioContext/destination", "AudioContext.destination")}}.

Sau khi `getData()` chạy xong, chúng ta bắt đầu phát nguồn âm thanh bằng `start(0)`, rồi vô hiệu hóa nút play để nó không thể được bấm lại khi đang phát (việc đó sẽ gây lỗi.)

```js
function getData() {
  const audioCtx = new AudioContext();

  return fetch("viper.ogg")
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error, status = ${response.status}`);
      }
      return response.arrayBuffer();
    })
    .then((buffer) => audioCtx.decodeAudioData(buffer))
    .then((decodedData) => {
      const source = new AudioBufferSourceNode(audioCtx);
      source.buffer = decodedData;
      source.connect(audioCtx.destination);
      return source;
    });
}

// Gắn các nút để dừng và phát âm thanh

play.onclick = () => {
  getData().then((source) => {
    source.start(0);
    play.setAttribute("disabled", "disabled");
  });
};
```

### Đọc tệp

Bộ khởi tạo {{domxref("Response.Response","Response()")}} chấp nhận {{domxref("File")}} và {{domxref("Blob")}}, nên có thể dùng nó để đọc một {{domxref("File")}} sang các định dạng khác.

```html
<input type="file" />
```

```js
function readFile(file) {
  return new Response(file).arrayBuffer();
}

document
  .querySelector("input[type=file]")
  .addEventListener("change", (event) => {
    const file = event.target.files[0];
    const buffer = readFile(file);
  });
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [Kiểm soát truy cập HTTP (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
