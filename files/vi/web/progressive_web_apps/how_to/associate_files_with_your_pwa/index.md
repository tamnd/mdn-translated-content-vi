---
title: Liên kết tệp với PWA của bạn
slug: Web/Progressive_web_apps/How_to/Associate_files_with_your_PWA
page-type: how-to
sidebar: pwasidebar
---

Trên một thiết bị, tệp thường được liên kết với các ứng dụng, nên khi người dùng mở tệp, hệ điều hành sẽ khởi chạy ứng dụng phù hợp và chuyển tệp cho nó. Ví dụ, tệp HTML thường được mở trong trình duyệt web, tệp văn bản trong trình soạn thảo văn bản, và video trong trình phát video.

PWA có thể tham gia vào tính năng này, nên khi người dùng bấm vào các tệp thuộc loại cụ thể, PWA có thể được khởi chạy để xử lý chúng.

Có hai phần để thêm hỗ trợ xử lý tệp:

- Khai báo hỗ trợ cho một số loại tệp nhất định bằng thành phần web app manifest [`file_handlers`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/file_handlers).
- Xử lý tệp bằng giao diện {{domxref("LaunchQueue")}}.

> [!NOTE]
> Hiện tại tính năng này chỉ khả dụng trên các trình duyệt dựa trên Chromium, và chỉ trên hệ điều hành máy tính.

## Khai báo hỗ trợ cho loại tệp

Để khai báo hỗ trợ cho các loại tệp cụ thể, hãy đưa thành phần [`file_handlers`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/file_handlers) vào [tệp manifest](/en-US/docs/Web/Progressive_web_apps/Manifest) của bạn.

Thành phần `file_handlers` là một mảng các đối tượng file handler. Mỗi đối tượng file handler có hai thuộc tính bắt buộc là `action` và `accept`.

- Thuộc tính `accept` chứa {{Glossary("MIME_Type", "các MIME type")}} và các phần mở rộng tệp đi kèm cho những tệp mà handler biết cách xử lý.
- Thuộc tính `action` là một URL mà PWA sẽ điều hướng tới khi người dùng mở tệp. Trang này phải nằm trong phạm vi của PWA.

Tệp manifest bên dưới bao gồm một thành phần `file_handlers` với một handler duy nhất, có thể xử lý các tệp {{Glossary("JPEG")}} và {{Glossary("PNG")}}, và sẽ điều hướng đến trang gốc của PWA khi người dùng bấm vào một trong các tệp này.

```json
{
  "name": "File handling demo",
  "icons": [
    {
      "src": "icons/lightbulb.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "start_url": "/",
  "display": "standalone",
  "file_handlers": [
    {
      "action": "/",
      "accept": {
        "image/jpeg": [".jpg", ".jpeg"],
        "image/png": [".png"]
      }
    }
  ]
}
```

Với manifest này, sau khi PWA được cài đặt, nó có thể được mở khi người dùng mở các tệp thuộc những loại này.

Thông thường có thể có hơn một ứng dụng mở được cùng một loại tệp, nên hệ điều hành thường cung cấp tính năng để người dùng chọn ứng dụng nào sẽ dùng để mở tệp, và để đặt trình xử lý mặc định. Ví dụ, trên macOS, người dùng có thể bấm chuột phải vào một tệp, chọn "Get Info", rồi cấu hình trình xử lý mặc định trong hộp thoại xuất hiện:

![Chọn trình xử lý mặc định trên macOS](macos-get-info-dialog.png)

## Xin quyền

Lần đầu tiên trình duyệt sắp khởi chạy PWA của bạn để xử lý một hoặc nhiều tệp mà người dùng đã mở, nó sẽ hỏi người dùng xác nhận rằng họ muốn dùng PWA của bạn để mở chúng. Ví dụ, hộp thoại của Chrome trông như sau:

![Hộp thoại cảnh báo của Chrome khi khởi chạy PWA để xử lý tệp](macos-chrome-launch-warning.png)

## Xử lý các tệp

Khi trình duyệt khởi chạy PWA của bạn và điều hướng đến trang bạn đã chỉ định trong thuộc tính `action` của thành phần manifest `file_handlers`, bạn sẽ cần chạy một số mã để xử lý tệp. Mã này sẽ chạy trong trang đã được chỉ định trong thuộc tính `action`.

Giao diện then chốt ở đây là {{domxref("LaunchQueue")}}, được cung cấp như một thuộc tính của đối tượng toàn cục {{domxref("Window")}}.

Giao diện `LaunchQueue` có một phương thức duy nhất là {{domxref("LaunchQueue/setConsumer", "setConsumer()")}}, nhận làm đối số một hàm callback sẽ được gọi khi trình duyệt đã khởi chạy PWA với một hoặc nhiều tệp cần xử lý.

Callback nhận một đối tượng {{domxref("LaunchParams")}}, trong đó có thuộc tính {{domxref("LaunchParams/files", "files")}} chứa một mảng các đối tượng {{domxref("FileSystemHandle")}}, mỗi đối tượng đại diện cho một trong các tệp mà người dùng đã mở.

Ví dụ, đoạn mã dưới đây đọc các tệp và gán nội dung của chúng cho các phần tử {{HTMLElement("img")}}, rồi thêm chúng vào trang:

```js
const imageContainer = document.querySelector("#container");

if ("launchQueue" in window) {
  launchQueue.setConsumer(async (launchParams) => {
    for (const file of launchParams.files) {
      const img = document.createElement("img");
      img.src = URL.createObjectURL(await file.getFile());
      imageContainer.appendChild(img);
    }
  });
}
```

Lưu ý rằng đoạn mã kiểm tra `launchQueue` có tồn tại trước khi dùng, để bảo đảm ứng dụng hoạt động trơn tru trên các trình duyệt không hỗ trợ API này.

## Xem thêm

- Thành phần manifest [`file_handlers`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/file_handlers)
- Giao diện {{domxref("LaunchQueue")}}
- [File System API](/en-US/docs/Web/API/File_System_API)
- [File API](/en-US/docs/Web/API/File_API)
- [Let installed web applications be file handlers](https://developer.chrome.com/docs/capabilities/web-apis/file-handling) trên developer.chrome.com (2022)
- [Xử lý tệp trong Progressive Web Apps](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/handle-files) trên learn.microsoft.com (2023)
