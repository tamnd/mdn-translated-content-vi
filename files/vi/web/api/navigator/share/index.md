---
title: "Navigator: phương thức share()"
short-title: share()
slug: Web/API/Navigator/share
page-type: web-api-instance-method
browser-compat: api.Navigator.share
---

{{APIRef("Web Share API")}}{{securecontext_header}}

Phương thức **`share()`** của giao diện {{domxref("Navigator")}} gọi cơ chế chia sẻ gốc của thiết bị để chia sẻ dữ liệu như văn bản, URL hoặc tệp. Các mục tiêu _share có sẵn_ tùy thuộc vào thiết bị, nhưng có thể bao gồm bảng nhớ tạm, danh bạ và ứng dụng email, trang web, Bluetooth, v.v.

Phương thức này giải quyết {{jsxref("Promise")}} bằng `undefined`.
Trên Windows, điều này xảy ra khi cửa sổ bật lên chia sẻ được khởi chạy, trong khi trên Android, lời hứa sẽ được giải quyết sau khi dữ liệu được chuyển thành công đến _share target_.

[Web Share API](/en-US/docs/Web/API/Web_Share_API) được kiểm soát bởi chính sách cấp phép [web-share](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/web-share).
Phương thức `share()` sẽ đưa ra các ngoại lệ nếu quyền được hỗ trợ nhưng chưa được cấp.

## Cú pháp

```js-nolint
share(data)
```

### Thông số

- `data` {{optional_inline}}
  - : Một đối tượng chứa dữ liệu cần chia sẻ.

Các thuộc tính mà tác nhân người dùng không xác định sẽ bị bỏ qua; dữ liệu chia sẻ chỉ được đánh giá dựa trên các thuộc tính được tác nhân người dùng hiểu.
Tất cả các thuộc tính đều là tùy chọn nhưng phải chỉ định ít nhất một thuộc tính dữ liệu đã biết.

Các giá trị có thể là: - `url` {{optional_inline}} - : Một chuỗi đại diện cho một URL được chia sẻ. - `text` {{optional_inline}} - : Một chuỗi đại diện cho văn bản được chia sẻ. - `title` {{optional_inline}} - : Một chuỗi đại diện cho tiêu đề được chia sẻ. Có thể bị mục tiêu bỏ qua. - `files` {{optional_inline}} - : Một mảng các đối tượng {{domxref("File")}} đại diện cho các file sẽ được chia sẻ. Xem [below](#shareable_file_types) để biết các loại tệp có thể chia sẻ.

### Giá trị trả về

{{jsxref("Promise")}} phân giải bằng `undefined` hoặc bị từ chối bằng một trong các [Exceptions](#exceptions) được cung cấp bên dưới.

### Ngoại lệ

{{jsxref("Promise")}} có thể bị từ chối với một trong các giá trị `DOMException` sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Tài liệu chưa hoạt động đầy đủ hoặc các hoạt động chia sẻ khác đang được tiến hành.
- `NotAllowedError` {{domxref("DOMException")}}
  - : `web-share` [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) đã được sử dụng để chặn việc sử dụng tính năng này, cửa sổ không có {{Glossary("transient activation")}} hoặc việc chia sẻ tệp đang bị chặn do các lý do bảo mật.
- {{jsxref("TypeError")}}
  - : Dữ liệu chia sẻ được chỉ định không thể được xác thực. Những lý do có thể bao gồm:
    - Tham số `data` bị bỏ qua hoàn toàn hoặc chỉ chứa các thuộc tính có giá trị không xác định. Lưu ý rằng mọi thuộc tính không được tác nhân người dùng nhận ra sẽ bị bỏ qua.
    - URL có định dạng sai.
    - File được chỉ định nhưng việc triển khai không hỗ trợ chia sẻ file.
    - Việc chia sẻ dữ liệu được chỉ định sẽ bị tác nhân người dùng coi là "chia sẻ thù địch".

- `AbortError` {{domxref("DOMException")}}
  - : Người dùng đã hủy thao tác chia sẻ hoặc không có mục tiêu chia sẻ nào.
- `DataError` {{domxref("DOMException")}}
  - : Đã xảy ra sự cố khi bắt đầu mục tiêu chia sẻ hoặc truyền dữ liệu.

## Các loại tệp có thể chia sẻ

Sau đây là danh sách các loại tệp thường có thể chia sẻ. Tuy nhiên, bạn phải luôn kiểm tra bằng {{domxref("navigator.canShare()")}} xem việc chia sẻ có thành công hay không.

- Ứng dụng
  - `.pdf` - `application/pdf`
- Âm thanh
  - `.flac` - `audio/flac`
  - `.m4a` - `audio/x-m4a`
  - `.mp3` - `audio/mpeg` (cũng chấp nhận `audio/mp3`)
  - `.oga` - `audio/ogg`
  - `.ogg` - `audio/ogg`
  - `.opus` - `audio/ogg`
  - `.wav` - `audio/wav`
  - `.weba` - `audio/webm`
- Hình ảnh
  - `.avif` - `image/avif`
  - `.bmp` - `image/bmp`
  - `.gif` - `image/gif`
  - `.ico` - `image/x-icon`
  - `.jfif` - `image/jpeg`
  - `.jpeg` - `image/jpeg`
  - `.jpg` - `image/jpeg`
  - `.pjp` - `image/jpeg`
  - `.pjpeg` - `image/jpeg`
  - `.png` - `image/png`
  - `.svg` - `image/svg+xml`
  - `.svgz` - `image/svg+xml`
  - `.tif` - `image/tiff`
  - `.tiff` - `image/tiff`
  - `.webp` - `image/webp`
  - `.xbm` - `image/x-xbitmap`
- Văn bản
  - `.css` - `text/css`
  - `.csv` - `text/csv`
  - `.ehtml` - `text/html`
  - `.htm` - `text/html`
  - `.html` - `text/html`
  - `.shtm` - `text/html`
  - `.shtml` - `text/html`
  - `.text` - `text/plain`
  - `.txt` - `text/plain`
- Video
  - `.m4v` - `video/mp4`
  - `.mp4` - `video/mp4`
  - `.mpeg` - `video/mpeg`
  - `.mpg` - `video/mpeg`
  - `.ogm` - `video/ogg`
  - `.ogv` - `video/ogg`
  - `.webm` - `video/webm`

## Bảo vệ

Phương pháp này yêu cầu tài liệu hiện tại phải có Chính sách cấp phép [web-share](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/web-share) và {{Glossary("transient activation")}}. (Nó phải được kích hoạt từ một sự kiện giao diện người dùng như một lần bấm nút và không thể được khởi chạy tại các điểm tùy ý bằng tập lệnh.) Hơn nữa, phương thức phải chỉ định dữ liệu hợp lệ được hỗ trợ để chia sẻ bởi quá trình triển khai gốc.

## Ví dụ

### Chia sẻ URL

Ví dụ bên dưới hiển thị một lần nhấp vào nút gọi API chia sẻ web để chia sẻ URL của MDN.
Điều này được lấy từ [Web share test](https://mdn.github.io/dom-examples/web-share/) ([see the source code](https://github.com/mdn/dom-examples/blob/main/web-share/index.html)) của chúng tôi.

#### HTML

HTML chỉ tạo một nút để kích hoạt chia sẻ và một đoạn để hiển thị kết quả kiểm tra.

```html
<p><button>Share MDN!</button></p>
<p class="result"></p>
```

#### JavaScript

```js
const shareData = {
  title: "MDN",
  text: "Learn web development on MDN!",
  url: "https://developer.mozilla.org",
};

const btn = document.querySelector("button");
const resultPara = document.querySelector(".result");

// Share must be triggered by "user activation"
btn.addEventListener("click", async () => {
  try {
    await navigator.share(shareData);
    resultPara.textContent = "MDN shared successfully";
  } catch (err) {
    resultPara.textContent = `Error: ${err}`;
  }
});
```

#### Kết quả

Nhấp vào nút để khởi chạy hộp thoại chia sẻ trên nền tảng của bạn. Văn bản sẽ xuất hiện bên dưới nút để cho biết chia sẻ có thành công hay cung cấp mã lỗi hay không.

{{EmbedLiveSample('Sharing a URL','','','','','','web-share')}}

### Chia sẻ tập tin

Để chia sẻ tệp, trước tiên hãy kiểm tra và gọi {{domxref("navigator.canShare()")}}. Sau đó đưa danh sách tệp vào lệnh gọi tới `navigator.share()`.

#### HTML

```html
<div>
  <label for="files">Select images to share:</label>
  <input id="files" type="file" accept="image/*" multiple />
</div>
<button id="share" type="button">Share your images!</button>
<output id="output"></output>
```

#### JavaScript

Lưu ý rằng đối tượng dữ liệu được truyền tới `navigator.canShare()` chỉ bao gồm thuộc tính `files`, vì `title` và `text` không quan trọng.

```js
const input = document.getElementById("files");
const output = document.getElementById("output");

document.getElementById("share").addEventListener("click", async () => {
  const files = input.files;

  if (files.length === 0) {
    output.textContent = "No files selected.";
    return;
  }

  // feature detecting navigator.canShare() also implies
  // the same for the navigator.share()
  if (!navigator.canShare) {
    output.textContent = `Your browser doesn't support the Web Share API.`;
    return;
  }

  if (navigator.canShare({ files })) {
    try {
      await navigator.share({
        files,
        title: "Images",
        text: "Beautiful images",
      });
      output.textContent = "Shared!";
    } catch (error) {
      output.textContent = `Error: ${error.message}`;
    }
  } else {
    output.textContent = `Your system doesn't support sharing these files.`;
  }
});
```

#### Kết quả

{{EmbedLiveSample('Sharing files')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("navigator.canShare()")}}
- <https://wpt.live/web-share/> (kiểm tra nền tảng web)
