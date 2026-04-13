---
title: Picture-in-Picture API
slug: Web/API/Picture-in-Picture_API
page-type: web-api-overview
browser-compat: api.PictureInPictureWindow
---

{{DefaultAPISidebar("Picture-in-Picture API")}}

**Picture-in-Picture API** cho phép các website tạo một cửa sổ video nổi, luôn nằm trên cùng. Điều này giúp người dùng tiếp tục xem nội dung đa phương tiện trong khi tương tác với các site hoặc ứng dụng khác trên thiết bị của họ.

> [!NOTE]
> [Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API) mở rộng Picture-in-Picture API để cửa sổ luôn nằm trên cùng có thể chứa _bất kỳ_ nội dung HTML tùy ý nào, không chỉ video.

## Giao diện

- {{DOMxRef("PictureInPictureWindow")}}
  - : Đại diện cho cửa sổ video nổi; chứa các thuộc tính {{domxref("PictureInPictureWindow/width", "width")}} và {{domxref("PictureInPictureWindow/height", "height")}}, cùng thuộc tính trình xử lý sự kiện {{domxref("PictureInPictureWindow/resize_event", "onresize")}}.
- {{DOMxRef("PictureInPictureEvent")}}
  - : Đại diện cho các sự kiện liên quan đến picture-in-picture, bao gồm {{domxref("HTMLVideoElement/enterpictureinpicture_event", "enterpictureinpicture")}}, {{domxref("HTMLVideoElement/leavepictureinpicture_event", "leavepictureinpicture")}} và {{domxref("PictureInPictureWindow/resize_event", "resize")}}.

## Phương thức thể hiện

Picture-in-Picture API thêm các phương thức vào các giao diện {{DOMxRef("HTMLVideoElement")}} và {{DOMxRef("Document")}} để cho phép bật/tắt cửa sổ video nổi.

### Phương thức thể hiện trên giao diện HTMLVideoElement

- {{DOMxRef("HTMLVideoElement.requestPictureInPicture()")}}
  - : Yêu cầu user agent đưa video vào chế độ picture-in-picture.

### Phương thức thể hiện trên giao diện Document

- {{DOMxRef("Document.exitPictureInPicture()")}}
  - : Yêu cầu user agent đưa phần tử đang ở chế độ picture-in-picture trở lại khung ban đầu của nó.

## Thuộc tính thể hiện

Picture-in-Picture API mở rộng các giao diện {{DOMxRef("HTMLVideoElement")}}, {{DOMxRef("Document")}} và {{DOMxRef("ShadowRoot")}} bằng các thuộc tính có thể dùng để xác định liệu chế độ video nổi có được hỗ trợ hay đang khả dụng hay không, liệu picture-in-picture có đang hoạt động hay không, và video nào đang nổi.

### Thuộc tính thể hiện trên giao diện HTMLVideoElement

- {{DOMxRef("HTMLVideoElement.disablePictureInPicture")}}
  - : Thuộc tính `disablePictureInPicture` cung cấp gợi ý cho user agent để không đề xuất picture-in-picture cho người dùng hoặc để không tự động yêu cầu nó.

### Thuộc tính thể hiện trên giao diện Document

- {{DOMxRef("Document.pictureInPictureEnabled")}}
  - : Thuộc tính `pictureInPictureEnabled` cho biết liệu có thể bật chế độ picture-in-picture hay không. Giá trị là `false` nếu chế độ này không khả dụng vì bất kỳ lý do nào, ví dụ [tính năng `"picture-in-picture"`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/picture-in-picture) bị từ chối hoặc chế độ này không được hỗ trợ.

### Thuộc tính thể hiện trên giao diện Document hoặc ShadowRoot

- {{DOMxRef("Document.pictureInPictureElement")}} / {{DOMxRef("ShadowRoot.pictureInPictureElement")}}
  - : Thuộc tính `pictureInPictureElement` cho biết {{DOMxRef("Element")}} nào hiện đang được hiển thị trong cửa sổ nổi (hoặc trong shadow DOM). Nếu giá trị là `null`, tài liệu (hoặc shadow DOM) không có nút nào hiện đang ở chế độ picture-in-picture.

## Sự kiện

_Picture-in-Picture API định nghĩa ba sự kiện, có thể dùng để phát hiện khi chế độ picture-in-picture được bật/tắt và khi cửa sổ video nổi được thay đổi kích thước._

- {{domxref("HTMLVideoElement.enterpictureinpicture_event", "enterpictureinpicture")}}
  - : Được gửi tới một {{DOMxRef("HTMLVideoElement")}} khi nó vào chế độ picture-in-picture.
- {{domxref("HTMLVideoElement.leavepictureinpicture_event", "leavepictureinpicture")}}
  - : Được gửi tới một {{DOMxRef("HTMLVideoElement")}} khi nó thoát khỏi chế độ picture-in-picture.
- {{domxref("PictureInPictureWindow.resize_event", "resize")}}
  - : Được gửi tới một {{DOMxRef("PictureInPictureWindow")}} khi nó thay đổi kích thước.

## Thêm điều khiển

Nếu các trình xử lý hành động media đã được thiết lập thông qua [Media Session API](/en-US/docs/Web/API/Media_Session_API), trình duyệt sẽ thêm các điều khiển phù hợp cho những hành động đó vào lớp phủ picture-in-picture. Ví dụ, nếu đã đặt hành động `"nexttrack"`, một nút bỏ qua có thể được hiển thị trong khung picture-in-picture. Hiện không hỗ trợ thêm nút hoặc điều khiển HTML tùy chỉnh.

## Điều khiển kiểu trình bày

{{cssxref(":picture-in-picture")}} pseudo-class CSS khớp với phần tử video hiện đang ở chế độ picture-in-picture, cho phép bạn cấu hình stylesheet để tự động điều chỉnh kích thước, kiểu hoặc bố cục nội dung khi video chuyển qua lại giữa chế độ picture-in-picture và chế độ trình bày truyền thống.

## Kiểm soát quyền truy cập

Khả năng dùng chế độ picture-in-picture có thể được kiểm soát bằng [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy). Tính năng picture-in-picture được nhận diện bằng chuỗi `"picture-in-picture"`, với giá trị danh sách cho phép mặc định là `*`, nghĩa là chế độ này được phép trong các ngữ cảnh tài liệu cấp cao nhất, cũng như trong các ngữ cảnh duyệt web lồng nhau được tải từ cùng origin với tài liệu ở mức cao nhất.

## Ví dụ

### Bật/tắt chế độ picture-in-picture

Trong ví dụ này, chúng ta có một phần tử {{HTMLElement("video")}} trong trang web, một phần tử {{HTMLElement("button")}} để bật/tắt picture-in-picture, và một phần tử để ghi lại thông tin liên quan đến ví dụ.
Phần tử {{HTMLElement("button")}} ban đầu ở trạng thái `disabled` cho đến khi xác định được trình duyệt có hỗ trợ hay không.

```html
<video
  src="/shared-assets/videos/friday.mp4"
  id="video"
  muted
  controls
  loop
  width="300"></video>

<button id="pip-button" disabled>Toggle PiP</button>
<pre id="log"></pre>
```

```css hidden
body {
  font:
    14px "Open Sans",
    sans-serif;
  padding: 0.5em;
}

button {
  display: block;
  margin-block: 1rem;
}
```

Trước tiên, chúng ta kiểm tra xem trình duyệt có hỗ trợ PiP với `document.pictureInPictureEnabled` hay không, và nếu không hỗ trợ, chúng ta ghi thông tin đó vào phần tử `<pre>`.
Nếu tính năng này có sẵn trong trình duyệt, chúng ta có thể bật công tắc để vào và thoát PiP.

Với phần điều khiển, một trình nghe sự kiện trên phần tử {{HTMLElement("button")}} sẽ gọi hàm `togglePictureInPicture()` mà chúng ta đã định nghĩa.
Trong `togglePictureInPicture()`, một câu lệnh `if` kiểm tra giá trị của thuộc tính `pictureInPictureElement` trên {{DOMxRef("Document", "document")}}.

- Nếu giá trị là `null`, không có video nào ở trong cửa sổ nổi, vì vậy chúng ta có thể yêu cầu video vào chế độ picture-in-picture.
  Ta làm điều đó bằng cách gọi {{DOMxRef("HTMLVideoElement.requestPictureInPicture()")}} trên phần tử {{HTMLElement("video")}}.
- Nếu giá trị không phải `null`, một phần tử hiện đang ở chế độ picture-in-picture.
  Khi đó chúng ta có thể gọi {{DOMxRef("Document.exitPictureInPicture", "document.exitPictureInPicture()")}} để đưa video trở lại khung ban đầu và thoát khỏi chế độ picture-in-picture.

```js
const video = document.getElementById("video");
const pipButton = document.getElementById("pip-button");
const log = document.getElementById("log");

if (document.pictureInPictureEnabled) {
  pipButton.removeAttribute("disabled");
} else {
  log.innerText = "PiP not supported. Check browser compatibility for details.";
}

function togglePictureInPicture() {
  if (document.pictureInPictureElement) {
    document.exitPictureInPicture();
  } else {
    video.requestPictureInPicture();
  }
}

pipButton.addEventListener("click", togglePictureInPicture);
```

```css
:picture-in-picture {
  outline: 5px dashed green;
}
```

Nhấn nút "Toggle PiP" sẽ cho phép người dùng chuyển đổi giữa việc phát video trong trang và trong một cửa sổ nổi:

{{embedlivesample("toggling_picture-in-picture", , "350")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLVideoElement.requestPictureInPicture()")}}
- {{DOMxRef("HTMLVideoElement.disablePictureInPicture")}}
- {{DOMxRef("Document.pictureInPictureEnabled")}}
- {{DOMxRef("Document.exitPictureInPicture()")}}
- {{DOMxRef("Document.pictureInPictureElement")}}
- {{CSSxRef(":picture-in-picture")}}
- [Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API)
