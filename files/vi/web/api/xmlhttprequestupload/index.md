---
title: XMLHttpRequestUpload
slug: Web/API/XMLHttpRequestUpload
page-type: web-api-interface
browser-compat: api.XMLHttpRequestUpload
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Giao diện **`XMLHttpRequestUpload`** đại diện cho quá trình tải lên của một {{domxref("XMLHttpRequest")}} cụ thể. Đây là một đối tượng _mờ đục_ đại diện cho quá trình tải lên phụ thuộc vào trình duyệt, ẩn bên dưới. Nó là một {{domxref("XMLHttpRequestEventTarget")}} và có thể được lấy bằng cách gọi {{domxref("XMLHttpRequest.upload")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này không có thuộc tính riêng, nhưng kế thừa các thuộc tính của {{domxref("XMLHttpRequestEventTarget")}} và {{domxref("EventTarget")}}._

## Phương thức phiên bản

_Giao diện này không có phương thức riêng, nhưng kế thừa các phương thức của {{domxref("XMLHttpRequestEventTarget")}} và {{domxref("EventTarget")}}._

## Sự kiện

_Giao diện này không có sự kiện riêng, nhưng kế thừa các sự kiện của {{domxref("XMLHttpRequestEventTarget")}}._

## Ví dụ

### Tải lên tệp với thời gian chờ

Điều này cho phép bạn tải tệp lên máy chủ; nó hiển thị thanh tiến trình trong khi tải lên đang diễn ra cũng như thông báo với tiến trình và kết quả, thành công hay thất bại. Nút hủy cho phép dừng tải lên.

#### HTML

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>XMLHttpRequestUpload test</title>
    <link rel="stylesheet" href="xhrupload_test.css" />
    <script src="xhrupload_test.js"></script>
  </head>
  <body>
    <main>
      <h1>Upload a file</h1>
      <p>
        <label for="file">File to upload</label><input type="file" id="file" />
      </p>
      <p>
        <progress></progress>
      </p>
      <p>
        <output></output>
      </p>
      <p>
        <button disabled id="abort">Abort</button>
      </p>
    </main>
  </body>
</html>
```

#### CSS

```css
body {
  background-color: lightblue;
}

main {
  margin: 50px auto;
  text-align: center;
}

#file {
  display: none;
}

label[for="file"] {
  background-color: lightgrey;
  padding: 10px;
}

progress {
  display: none;
}

progress.visible {
  display: inline;
}
```

#### JavaScript

```js
const fileInput = document.getElementById("file");
const progressBar = document.querySelector("progress");
const log = document.querySelector("output");
const abortButton = document.getElementById("abort");

fileInput.addEventListener("change", () => {
  const xhr = new XMLHttpRequest();
  xhr.timeout = 2000; // 2 seconds

  // Link abort button
  abortButton.addEventListener(
    "click",
    () => {
      xhr.abort();
    },
    { once: true },
  );

  // When the upload starts, we display the progress bar
  xhr.upload.addEventListener("loadstart", (event) => {
    progressBar.classList.add("visible");
    progressBar.value = 0;
    progressBar.max = event.total;
    log.textContent = "Uploading (0%)…";
    abortButton.disabled = false;
  });

  // Each time a progress event is received, we update the bar
  xhr.upload.addEventListener("progress", (event) => {
    progressBar.value = event.loaded;
    log.textContent = `Uploading (${(
      (event.loaded / event.total) *
      100
    ).toFixed(2)}%)…`;
  });

  // When the upload is finished, we hide the progress bar.
  xhr.upload.addEventListener("loadend", (event) => {
    progressBar.classList.remove("visible");
    if (event.loaded !== 0) {
      log.textContent = "Upload finished.";
    }
    abortButton.disabled = true;
  });

  // In case of an error, an abort, or a timeout, we hide the progress bar
  // Note that these events can be listened to on the xhr object too
  function errorAction(event) {
    progressBar.classList.remove("visible");
    log.textContent = `Upload failed: ${event.type}`;
  }
  xhr.upload.addEventListener("error", errorAction);
  xhr.upload.addEventListener("abort", errorAction);
  xhr.upload.addEventListener("timeout", errorAction);

  // Build the payload
  const fileData = new FormData();
  fileData.append("file", fileInput.files[0]);

  // Theoretically, event listeners could be set after the open() call
  // but browsers are buggy here
  xhr.open("POST", "upload_test.php", true);

  // Note that the event listener must be set before sending (as it is a preflighted request)
  xhr.send(fileData);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLHttpRequest")}}
