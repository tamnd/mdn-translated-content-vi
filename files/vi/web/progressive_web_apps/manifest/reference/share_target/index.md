---
title: share_target
slug: Web/Progressive_web_apps/Manifest/Reference/share_target
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.share_target
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member manifest `share_target` cho phép các {{Glossary("Progressive Web Apps")}} (PWA) đã cài đặt được đăng ký làm điểm đến chia sẻ trong hộp thoại chia sẻ của hệ thống.

Khi đã được đăng ký và cài đặt, một PWA dùng Web Share Target API sẽ hoạt động như một điểm đến nhận nội dung được chia sẻ, cùng với các điểm đến chia sẻ hệ thống thông thường như email, ứng dụng nhắn tin, và các ứng dụng gốc khác có thể nhận nội dung được chia sẻ.

> [!NOTE]
> Nếu bạn muốn chia sẻ dữ liệu bằng Web Share API, hãy xem [Web Share API](/en-US/docs/Web/API/Web_Share_API) và [`navigator.share()`](/en-US/docs/Web/API/Navigator/share).

## Giá trị

Giá trị của member `share_target` là một đối tượng định nghĩa cách một ứng dụng có thể nhận dữ liệu được chia sẻ. Đối tượng này có thể chứa các thuộc tính sau (`action` và `params` là bắt buộc):

- `action`
  - : URL cho web share target.
- `enctype` {{Optional_Inline}}
  - : Kiểu mã hóa của dữ liệu chia sẻ khi dùng yêu cầu [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST). Bị bỏ qua với yêu cầu [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET).
- `method` {{Optional_Inline}}
  - : [Phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) để dùng. Hoặc [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) hoặc [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST). Dùng `POST` nếu dữ liệu được chia sẻ gồm dữ liệu nhị phân như hình ảnh, hoặc nếu nó làm thay đổi ứng dụng đích, ví dụ tạo một điểm dữ liệu như bookmark.
- `params`
  - : Một đối tượng để cấu hình các tham số chia sẻ. Các khóa của đối tượng tương ứng với [`data` object in `navigator.share()`](/en-US/docs/Web/API/Navigator/share#parameters). Các giá trị đối tượng có thể được chỉ định và sẽ được dùng làm query parameter:
    - `title` {{Optional_Inline}}: Tên của query parameter dùng cho tiêu đề của tài liệu được chia sẻ.
    - `text` {{Optional_Inline}}: Tên của query parameter cho văn bản (hoặc phần thân) của thông điệp được chia sẻ.
    - `url` {{Optional_Inline}}: Tên của query parameter cho URL tới tài nguyên được chia sẻ.
    - `files` {{Optional_Inline}}: Một đối tượng (hoặc một mảng đối tượng) xác định những tệp nào được chấp nhận bởi share target. Đối tượng yêu cầu các thuộc tính sau:
      - `name`: Tên của trường biểu mẫu dùng để chia sẻ tệp.
      - `accept`: Một chuỗi (hoặc một mảng chuỗi) các MIME type hoặc phần mở rộng tệp được chấp nhận.

## Ví dụ

### Nhận dữ liệu chia sẻ bằng GET

Một share target có thể được đăng ký bằng member `share_target` sau:

```json
{
  "share_target": {
    "action": "/shared-content-receiver/",
    "method": "GET",
    "params": {
      "title": "name",
      "text": "description",
      "url": "link"
    }
  }
}
```

Khi người dùng chọn ứng dụng của bạn trong hộp thoại chia sẻ của hệ thống, PWA của bạn sẽ được khởi chạy, và một yêu cầu HTTP `GET` sẽ được gửi tới URL đã cung cấp cùng với các query parameter được chỉ định. Nó sẽ trông như sau: `/shared-content-receiver/?name=a+shared+name&description=a+shared+description&link=https%3A%2F%2Fexample.com%2F`.

Giao diện [URLSearchParams](/en-US/docs/Web/API/URLSearchParams) có thể hữu ích để xử lý dữ liệu được chia sẻ trong ứng dụng của bạn và làm điều gì đó với nó.

```js
const sharedName = url.searchParams.get("name");
const sharedDescription = url.searchParams.get("description");
const sharedLink = url.searchParams.get("link");
```

### Nhận dữ liệu chia sẻ bằng POST

Nếu yêu cầu chia sẻ bao gồm một hoặc nhiều tệp hoặc gây ra tác dụng phụ trong ứng dụng của bạn, nên dùng phương thức HTTP [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST). Ví dụ, nếu ứng dụng của bạn nhận hình ảnh để xử lý tiếp hoặc muốn lưu một liên kết được chia sẻ thành bookmark trong cơ sở dữ liệu.

```json
{
  "share_target": {
    "action": "/save-bookmark/",
    "method": "POST",
    "enctype": "multipart/form-data",
    "params": {
      "url": "link"
    }
  }
}
```

Bạn có thể xử lý dữ liệu chia sẻ `POST` bằng mã phía máy chủ, hoặc, để mang lại trải nghiệm tốt hơn cho người dùng ngoại tuyến, có thể dùng trình nghe sự kiện `fetch` để chặn yêu cầu HTTP, cho phép truy cập dữ liệu trong ngữ cảnh service worker.

```js
self.addEventListener("fetch", (event) => {
  // Các yêu cầu thông thường không liên quan đến Web Share Target.
  if (event.request.method !== "POST") {
    event.respondWith(fetch(event.request));
    return;
  }

  // Các yêu cầu liên quan đến Web Share Target.
  event.respondWith(
    (async () => {
      const formData = await event.request.formData();
      const link = formData.get("link") || "";
      // Thay vì URL gốc `/save-bookmark/`, chuyển hướng
      // người dùng tới một URL được trả về bởi hàm `saveBookmark()`
      // chẳng hạn `/`.
      const responseUrl = await saveBookmark(link);
      return Response.redirect(responseUrl, 303);
    })(),
  );
});
```

Yêu cầu `POST` sau đó lý tưởng sẽ được đáp lại bằng một chuyển hướng HTTP [303 See Other](/en-US/docs/Web/HTTP/Reference/Status/303) để tránh việc nhiều yêu cầu `POST` được gửi nếu người dùng làm mới trang, chẳng hạn.

### Nhận tệp được chia sẻ

Để chấp nhận các tệp được chia sẻ, phương thức HTTP phải là `POST`, `enctype` phải là `multipart/form-data`, và phải cung cấp một mục `files` xác định các loại tệp được chấp nhận.

Các tệp phải có thuộc tính `name`, và thuộc tính `accept` phải chỉ định các MIME type hoặc phần mở rộng tệp được chấp nhận. Có lẽ nên định nghĩa cả hai, vì các hệ điều hành có thể khác nhau về cái nào chúng ưu tiên.

```json
{
  "share_target": {
    "action": "/file-collector",
    "method": "POST",
    "enctype": "multipart/form-data",
    "params": {
      "title": "name",
      "text": "description",
      "url": "link",
      "files": [
        {
          "name": "lists",
          "accept": ["text/csv", ".csv"]
        },
        {
          "name": "photos",
          "accept": ["image/svg+xml", ".svg"]
        }
      ]
    }
  }
}
```

Để xử lý dữ liệu tệp được chia sẻ, xem ví dụ `POST` ở trên và API [`FileReader`](/en-US/docs/Web/API/FileReader) để đọc các tệp. Để chuyển tệp từ ngữ cảnh service worker sang các ngữ cảnh client, một giải pháp là tạm thời ghi tệp vào [`Cache`](/en-US/docs/Web/API/Cache) hoặc [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) rồi thông báo cho client của nó bằng [`Client.postMessage()`](/en-US/docs/Web/API/Client/postMessage).

## Bảo mật và quyền riêng tư

PWA của bạn chỉ có thể hoạt động như một web share target nếu nó đã được cài đặt. Xem thêm [How to make PWAs installable](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs).

Tương tự như các lần gửi biểu mẫu HTML, bạn nên thận trọng với dữ liệu được gửi tới ứng dụng của bạn qua share target. Hãy bảo đảm xác thực dữ liệu đến trước khi sử dụng nó.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
