---
title: file_handlers
slug: Web/Progressive_web_apps/Manifest/Reference/file_handlers
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.file_handlers
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member `file_handlers` chỉ định một mảng các đối tượng đại diện cho các loại tệp mà một [progressive web app (PWA)](/en-US/docs/Web/Progressive_web_apps) đã cài đặt có thể xử lý.

Member `file_handlers` được trình duyệt đọc khi PWA được cài đặt và được dùng để liên kết ứng dụng với một tập hợp loại tệp nhất định ở cấp hệ điều hành.

Ví dụ, một PWA có thể được đăng ký để xử lý các tệp khớp với MIME type `text/plain`. Khi PWA này đã được cài đặt, hệ điều hành có thể dùng nó để xử lý các tệp văn bản, mở PWA khi người dùng mở một tệp thuộc loại này. Lưu ý rằng các ứng dụng khác cũng có thể được đăng ký làm trình xử lý tệp văn bản, và cách hệ điều hành quản lý sự liên kết giữa loại tệp và ứng dụng, cũng như cách nó cho phép người dùng chọn một ứng dụng để xử lý tệp, có thể khác nhau giữa các thiết bị.

> [!NOTE]
> Mặc dù member `file_handlers` được dùng để đăng ký một PWA với một tập hợp loại tệp nhất định, điều này chỉ khiến hệ điều hành khởi chạy PWA khi một tệp khớp được mở. Sau đó PWA vẫn cần thực sự xử lý tệp bằng mã JavaScript. Xem [Handling the files](#handling_the_files) để biết thêm thông tin.

## Giá trị

Một mảng các đối tượng. Mỗi đối tượng trong mảng phải chứa các giá trị sau (`action` và `accept` là bắt buộc):

- `action`
  - : Một chuỗi chứa URL sẽ được điều hướng tới khi một tệp được xử lý.
    URL này phải nằm trong navigation scope của PWA, là tập các URL mà PWA có thể điều hướng tới. Navigation scope của PWA mặc định là member [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url), nhưng cũng có thể được định nghĩa bằng member [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope).

- `accept`
  - : Một đối tượng. Đối với mỗi thuộc tính trong đối tượng:
    - Khóa thuộc tính là một MIME type.
    - Giá trị thuộc tính là một mảng các chuỗi đại diện cho phần mở rộng tệp liên kết với MIME type đó.

## Ví dụ

Trong ví dụ này, manifest ứng dụng web khai báo một file handler đăng ký ứng dụng để xử lý tệp âm thanh. Các member manifest khác như `name`, hoặc `icons` không được bao gồm trong ví dụ này để ngắn gọn:

```json
{
  "file_handlers": [
    {
      "action": "/handle-audio-file",
      "accept": {
        "audio/wav": [".wav"],
        "audio/x-wav": [".wav"],
        "audio/mpeg": [".mp3"],
        "audio/mp4": [".mp4"],
        "audio/aac": [".adts"],
        "audio/ogg": [".ogg"],
        "application/ogg": [".ogg"],
        "audio/webm": [".webm"],
        "audio/flac": [".flac"],
        "audio/mid": [".rmi", ".mid"]
      }
    }
  ]
}
```

### Xử lý tệp

Để thực sự triển khai xử lý tệp trong PWA, nhà phát triển web cũng cần dùng {{domxref("window.launchQueue")}} để xử lý các tệp đến trong mã JavaScript của ứng dụng.

Xử lý tệp được thực hiện trong mã ứng dụng chạy trên {{Glossary("main thread")}}, không phải trong [service worker](/en-US/docs/Web/API/Service_Worker_API) của ứng dụng.

Trong ví dụ sau, {{domxref("LaunchQueue.setConsumer", "window.launchQueue.setConsumer()")}} được dùng để chỉ định một hàm callback nhận các tệp âm thanh đến và phát tệp đầu tiên bằng phần tử {{domxref("HTMLAudioElement.Audio", "Audio")}}:

```js
async function playSong(handledFile) {
  const blob = await handledFile.getFile();
  const url = window.URL.createObjectURL(blob);
  const audio = new Audio(url);
  audio.play();
}

if ("launchQueue" in window) {
  window.launchQueue.setConsumer((launchParams) => {
    if (launchParams.files && launchParams.files.length) {
      playSong(launchParams.files[0]);
    }
  });
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Handle files in Progressive Web Apps on learn.microsoft.com](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/handle-files)
- [Let installed web applications be file handlers on developer.chrome.com](https://developer.chrome.com/docs/capabilities/web-apis/file-handling)
