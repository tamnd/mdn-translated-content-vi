---
title: Chia sẻ dữ liệu giữa các ứng dụng
slug: Web/Progressive_web_apps/How_to/Share_data_between_apps
page-type: how-to
sidebar: pwasidebar
---

Chia sẻ ứng dụng là khả năng của một ứng dụng truyền thông tin hoặc dữ liệu sang một ứng dụng khác trên cùng một thiết bị. Tính năng này hữu ích cho người dùng vì nó cho phép họ chia sẻ thông tin giữa hai ứng dụng mà không cần các ứng dụng này phải biết nhau từ trước.

Ví dụ, trên thiết bị di động, bạn có thể chia sẻ ảnh hoặc video từ ứng dụng ảnh của mình với một ứng dụng khác chấp nhận hình ảnh, chẳng hạn ứng dụng email. Mẫu chia sẻ này được hệ điều hành (OS) điều phối, nơi cả hai ứng dụng được cài:

1. Khi việc chia sẻ ảnh được người dùng khởi xướng, ứng dụng ảnh chuẩn bị dữ liệu cho hình ảnh đã chọn, và chuyển nó cho hệ điều hành.
2. Hệ điều hành chọn danh sách các ứng dụng có thể xử lý dữ liệu hình ảnh được chia sẻ và hiển thị chúng cho người dùng.
3. Khi người dùng chọn một trong các ứng dụng đích, hệ điều hành sẽ khởi chạy nó cùng với hình ảnh được chia sẻ.

[Progressive Web Apps](/en-US/docs/Web/Progressive_web_apps) (PWA) cũng có khả năng chia sẻ thông tin bằng cùng mẫu do OS điều phối này. PWA có thể vừa chia sẻ dữ liệu vừa chấp nhận dữ liệu được chia sẻ.

Khi xây dựng PWA, khả năng chấp nhận dữ liệu được chia sẻ có thể giúp PWA của bạn trở nên quen thuộc hơn và được tích hợp tự nhiên hơn vào thiết bị của người dùng.

## Chia sẻ dữ liệu với các ứng dụng khác

Để người dùng có thể chia sẻ dữ liệu từ PWA của bạn sang các ứng dụng khác, hãy dùng [Web Share API](/en-US/docs/Web/API/Web_Share_API). Web Share API cho phép ứng dụng của bạn chia sẻ văn bản, liên kết, hoặc tệp với các ứng dụng khác thông qua cơ chế chia sẻ của hệ điều hành bên dưới.

Để chia sẻ dữ liệu, hãy dùng phương thức {{domxref("navigator.share()")}} để phản hồi một hành động của người dùng, chẳng hạn bấm nút.

### Kiểm tra hỗ trợ

Trước khi hiển thị giao diện chia sẻ nội dung trong ứng dụng, hãy kiểm tra để bảo đảm Web Share API được hỗ trợ. Ngay cả các trình duyệt hỗ trợ Web Share API cũng không phải tất cả đều hỗ trợ chia sẻ mọi kiểu dữ liệu. Vì vậy, thực hành tốt là dùng phương thức {{domxref("navigator.canShare()")}} trước để xác thực liệu dữ liệu bạn định chia sẻ có thực sự có thể được chia sẻ từ trình duyệt đang chạy ứng dụng của bạn hay không.

Ví dụ này cho thấy cách kiểm tra xem Web Share API có được hỗ trợ hay không và dữ liệu có thể được chia sẻ hay không:

```js
function canBrowserShareData(data) {
  if (!navigator.share || !navigator.canShare) {
    return false;
  }

  return navigator.canShare(data);
}

const sharedDataSample = {
  title: "Some text title",
  text: "More text",
  url: "A url we want to share",
};

if (canBrowserShareData(sharedDataSample)) {
  // Enable the share button in the UI.
  renderAppSharingUI();
} else {
  // We can't share on this browser/operating system.
}
```

### Xử lý ngoại lệ

Phương thức {{domxref("navigator.share()")}} trả về một {{jsxref("Promise")}} có thể bị từ chối trong các trường hợp như dữ liệu được chia sẻ không đúng, người dùng hủy thao tác chia sẻ, hoặc việc truyền dữ liệu thất bại.

Vì vậy, điều quan trọng là phải bắt lỗi từ chối promise để tránh lỗi trong mã JavaScript của ứng dụng.

```js
async function shareData(data) {
  try {
    await navigator.share(data);
    // The data was shared successfully.
  } catch (e) {
    // The data could not be shared.
    console.error(`Error: ${e}`);
  }
}
```

### Chia sẻ dữ liệu văn bản

Ví dụ sau minh họa cách chia sẻ một liên kết và một số văn bản khi người dùng bấm nút trong ứng dụng. Hàm `canBrowserShareData` dùng trong ví dụ được mô tả trong [Checking for support](#checking_for_support) và không được lặp lại ở đây.

```js
// Retrieve the button from the DOM. The button is hidden for now.
const button = document.querySelector("#share");

if (canBrowserShareData({ text: "text", url: "https://example.com" })) {
  // Show the button.
  button.style.display = "inline";

  // Listen for click events on the button to share data.
  button.addEventListener("click", async () => {
    try {
      await navigator.share({
        text: "An MDN article to learn how to share data between apps",
        url: "https://developer.mozilla.org/docs/Web/Progressive_web_apps/How_to/Share_data_between_apps",
      });

      console.log("The URL was successfully shared");
    } catch (err) {
      console.error(`The URL could not be shared: ${err}`);
    }
  });
}
```

### Chia sẻ tệp

Ví dụ mã sau minh họa cách chia sẻ một tệp khi người dùng bấm nút trong ứng dụng. Hàm `canBrowserShareFiles` được dùng để chỉ hiển thị nút chia sẻ nếu trình duyệt hỗ trợ chia sẻ tệp.

```js
function canBrowserShareFiles() {
  if (!navigator.share || !navigator.canShare) {
    return false;
  }

  // Create some test data with a file, to check if the browser supports
  // sharing it.
  const testFile = new File(["foo"], "foo.txt", { type: "text/plain" });
  const data = { files: [testFile] };

  return navigator.canShare(data);
}

// Retrieve the button from the DOM. The button is hidden for now.
const button = document.querySelector("#share");

if (canBrowserShareFiles()) {
  // The browser supports sharing files. Show the button.
  button.style.display = "inline";

  // Listen for clicks on the button and share a file.
  button.addEventListener("click", async () => {
    try {
      // Get the file to be shared. This function should return a File
      // object, perhaps by creating it dynamically, or retrieving it
      // from IndexedDB.
      const file = await getTheFileToShare();

      await navigator.share({
        title: "My shared file",
        files: [file],
      });

      console.log("The file was successfully shared");
    } catch (err) {
      console.error(`The file could not be shared: ${err}`);
    }
  });
}
```

Để biết thêm thông tin, xem ví dụ [sharing files example](/en-US/docs/Web/API/Navigator/share#sharing_files) trên trang phương thức `navigator.share()`.

## Xử lý dữ liệu được chia sẻ từ các ứng dụng khác

Để đăng ký PWA của bạn làm đích nhận dữ liệu được chia sẻ từ các ứng dụng khác, hãy dùng [Web Share Target API](https://developer.chrome.com/docs/capabilities/web-apis/web-share-target) và, cụ thể hơn, thành phần web app manifest [`share_target`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/share_target).

Thành phần manifest `share_target` cho phép một PWA đã cài được đăng ký, ở cấp hệ điều hành, như một đích tiềm năng cho nội dung được chia sẻ bởi các ứng dụng khác. Điều này có nghĩa là khi người dùng chia sẻ một số dữ liệu tương thích với PWA của bạn từ một ứng dụng khác, hệ điều hành sẽ liệt kê PWA của bạn cùng với các đích chia sẻ thông thường khác như ứng dụng email hoặc nhắn tin. Lưu ý rằng PWA phải được cài thì mới được hiển thị như một đích tiềm năng để nhận dữ liệu được chia sẻ.

Thông tin bạn cung cấp với thành phần `share_target` trong tệp manifest sẽ định nghĩa dữ liệu nào ứng dụng của bạn có thể làm đích, và hệ điều hành nên khởi chạy ứng dụng của bạn như thế nào khi người dùng chọn nó làm đích.

### Xử lý dữ liệu văn bản

Sau đây là ví dụ web app manifest dùng thành phần `share_target`:

```json
{
  "name": "ChattyBox",
  "start_url": "/",
  "display": "standalone",
  "icons": [
    {
      "src": "images/icon-256.png",
      "sizes": "256x256",
      "type": "image/png"
    }
  ],
  "share_target": {
    "action": "/share-handler",
    "method": "GET",
    "params": {
      "text": "description",
      "url": "link"
    }
  }
}
```

Khi người dùng chọn ứng dụng của bạn để xử lý nội dung được chia sẻ từ ứng dụng khác, ứng dụng của bạn sẽ được khởi chạy và nội dung được chia sẻ sẽ được chuyển tới nó tương tự như cách các phần tử {{htmlelement("form")}} được gửi đi.

Trong ví dụ mã web app manifest trước đó, khi ứng dụng ChattyBox được chọn làm đích, nó được khởi chạy bằng cách gửi một yêu cầu HTTP [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) đến URL `/share-handler`, với dữ liệu được chia sẻ được chuyển dưới dạng các tham số yêu cầu có tên `description` và `link`.

Yêu cầu `GET` sẽ có dạng như sau: `/shared-handler?description=...&link=...`.

Sau đó mã JavaScript chính của ứng dụng có thể truy xuất dữ liệu được chia sẻ bằng giao diện [URLSearchParams](/en-US/docs/Web/API/URLSearchParams):

```js
const url = new URL(document.location);
const sharedDescription = url.searchParams.get("description");
const sharedLink = url.searchParams.get("link");
```

Để biết thêm thông tin, xem ví dụ [Nhận dữ liệu chia sẻ bằng GET](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/share_target#receiving_share_data_using_get) trên trang thành phần web app manifest `share_target`.

### Xử lý tệp được chia sẻ

Trong ví dụ trước, dữ liệu văn bản được xử lý như một yêu cầu `GET`. Tuy nhiên, việc xử lý tệp yêu cầu dùng yêu cầu [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) với kiểu mã hóa [encoding type](/en-US/docs/Web/API/HTMLFormElement/enctype) `multipart/form-data`.

Đoạn mã sau cho thấy cách một PWA có thể được cấu hình để chấp nhận các kiểu tệp được chia sẻ khác nhau:

```json
{
  "name": "ChattyBox",
  "start_url": "/",
  "display": "standalone",
  "icons": [
    {
      "src": "images/icon-256.png",
      "sizes": "256x256",
      "type": "image/png"
    }
  ],
  "share_target": {
    "action": "/share-file-handler",
    "method": "POST",
    "enctype": "multipart/form-data",
    "params": {
      "files": [
        {
          "name": "textFiles",
          "accept": ["text/plain", ".txt"]
        },
        {
          "name": "htmlFiles",
          "accept": ["text/html", ".html"]
        },
        {
          "name": "images",
          "accept": ["image/jpeg", "image/png", "image/webp", "image/gif"]
        }
      ]
    }
  }
}
```

Như ví dụ này cho thấy, mỗi đối tượng tệp trong thuộc tính `files` phải có thuộc tính `name` và thuộc tính `accept`. Thuộc tính `accept` phải chỉ định các [MIME type](/en-US/docs/Web/HTTP/Guides/MIME_types) hoặc phần mở rộng tệp được chấp nhận.

Khi ứng dụng được người dùng chọn để xử lý một tệp được chia sẻ (hoặc nhiều tệp), ứng dụng sẽ được khởi chạy với một yêu cầu `POST` tới URL `/share-file-handler`, cùng dữ liệu biểu mẫu đã được mã hóa.

Vì đây là yêu cầu `POST`, mã JavaScript chính của ứng dụng không thể truy cập trực tiếp dữ liệu biểu mẫu. Bạn có thể xử lý các tệp đã gửi trong mã phía máy chủ của mình bằng cách nhận chúng tại điểm cuối URL `/share-file-handler`. Tuy nhiên, để có trải nghiệm người dùng tốt hơn và hoạt động ngoại tuyến, bạn có thể xử lý các tệp trong mã service worker của mình bằng một trình xử lý sự kiện [`fetch` event handler](/en-US/docs/Web/API/ServiceWorkerGlobalScope/fetch_event), như sau:

```js
// service-worker.js

self.addEventListener("fetch", (event) => {
  // Only use this event listener for POST requests sent to /share-file-handler.
  const url = new URL(event.request.url);
  if (
    event.request.method !== "POST" ||
    url.pathname !== "/share-file-handler"
  ) {
    return;
  }

  // Handle the submitted files here.
});
```

## Xem thêm

- [Web Share API](/en-US/docs/Web/API/Web_Share_API)
- [Web Share Target API](https://developer.chrome.com/docs/capabilities/web-apis/web-share-target)
- [Ví dụ chia sẻ tệp](/en-US/docs/Web/API/Navigator/share#sharing_files)
- [Nhận dữ liệu chia sẻ bằng GET](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/share_target#receiving_share_data_using_get)
- [Xử lý tệp trong Progressive Web Apps](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/handle-files) trên learn.microsoft.com (2023)
