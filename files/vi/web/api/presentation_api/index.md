---
title: Presentation API
slug: Web/API/Presentation_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Presentation
---

{{securecontext_header}}{{SeeCompatTable}}{{DefaultAPISidebar("Presentation API")}}

Presentation API cho phép một {{Glossary("user agent")}} (chẳng hạn như trình duyệt web) hiển thị nội dung web một cách hiệu quả thông qua các thiết bị trình chiếu lớn như máy chiếu và tivi kết nối mạng. Các loại thiết bị đa phương tiện được hỗ trợ bao gồm cả màn hình được kết nối bằng dây như HDMI, DVI, hoặc tương tự, hoặc không dây, sử dụng [DLNA](https://www.dlna.org/), [Chromecast](https://developers.google.com/cast/), [AirPlay](https://developer.apple.com/documentation/technologyoverviews/streaming), hoặc [Miracast](https://www.wi-fi.org/applications).

![Chế độ 1-UA tải các trang Điều khiển và Trình bày cùng nhau trước khi xuất ra màn hình. Chế độ 2-UA tải chúng riêng biệt bằng Giao thức Điều khiển Trình bày.](presentation_mode_illustration.png)

Nói chung, một trang web sử dụng Presentation Controller API để chỉ định nội dung web được hiển thị trên thiết bị trình chiếu và khởi tạo phiên trình chiếu. Với Presentation Receiver API, nội dung web đang trình chiếu có được trạng thái phiên. Bằng cách cung cấp cả trang controller và trang receiver với một kênh dựa trên tin nhắn, nhà phát triển web có thể triển khai sự tương tác giữa hai trang này.

Tùy thuộc vào cơ chế kết nối được cung cấp bởi thiết bị trình chiếu, bất kỳ trang controller và receiver nào đều có thể được hiển thị bởi cùng một user agent hoặc bởi các user agent riêng biệt.

- Đối với thiết bị chế độ 1-UA, cả hai trang được tải bởi cùng một user agent. Tuy nhiên, kết quả hiển thị của trang receiver sẽ được gửi đến thiết bị trình chiếu thông qua giao thức hiển thị từ xa được hỗ trợ.
- Đối với thiết bị chế độ 2-UA, trang receiver được tải trực tiếp trên thiết bị trình chiếu. User agent điều khiển giao tiếp với thiết bị trình chiếu thông qua giao thức điều khiển trình chiếu được hỗ trợ, để điều khiển phiên trình chiếu và truyền tin nhắn giữa hai trang.

## Các giao diện

- {{domxref("Presentation")}}
  - : Trong ngữ cảnh duyệt điều khiển, giao diện `Presentation` cung cấp cơ chế để ghi đè hành vi mặc định của trình duyệt khi khởi chạy trình chiếu đến màn hình ngoài. Trong ngữ cảnh duyệt nhận, giao diện `Presentation` cung cấp quyền truy cập vào các kết nối trình chiếu có sẵn.
- {{domxref("PresentationRequest")}}
  - : Khởi tạo hoặc kết nối lại với một trình chiếu được tạo bởi ngữ cảnh duyệt điều khiển.
- {{domxref("PresentationAvailability")}}
  - : Đối tượng [PresentationAvailability](/en-US/docs/Web/API/PresentationAvailability) được liên kết với các màn hình trình chiếu có sẵn và đại diện cho _tính khả dụng màn hình trình chiếu_ cho một yêu cầu trình chiếu.
- {{domxref("PresentationConnectionAvailableEvent")}}
  - : `PresentationConnectionAvailableEvent` được kích hoạt trên một [`PresentationRequest`](/en-US/docs/Web/API/PresentationRequest) khi một kết nối liên kết với đối tượng được tạo.
- {{domxref("PresentationConnection")}}
  - : Mỗi kết nối trình chiếu được đại diện bởi một đối tượng [PresentationConnection](/en-US/docs/Web/API/PresentationConnection).
- {{domxref("PresentationConnectionCloseEvent")}}
  - : `PresentationConnectionCloseEvent` được kích hoạt khi một kết nối trình chiếu vào trạng thái `closed`.
- {{domxref("PresentationReceiver")}}
  - : [PresentationReceiver](/en-US/docs/Web/API/PresentationReceiver) cho phép ngữ cảnh duyệt nhận truy cập các ngữ cảnh duyệt điều khiển và giao tiếp với chúng.
- {{domxref("PresentationConnectionList")}}
  - : `PresentationConnectionList` đại diện cho tập hợp các kết nối trình chiếu chưa bị kết thúc. Nó cũng là một monitor cho sự kiện kết nối trình chiếu mới có sẵn.

## Ví dụ

Các mã ví dụ bên dưới minh họa cách sử dụng các tính năng chính của Presentation API: `controller.html` triển khai controller và `presentation.html` triển khai trình chiếu. Cả hai trang được phục vụ từ tên miền `https://example.org`.

### Theo dõi tính khả dụng của màn hình trình chiếu

Trong `controller.html`:

```html
<button id="presentBtn" class="hidden">Present</button>
```

```css
.hidden {
  display: none;
}
```

```js
// The Present button is visible if at least one presentation display is available
const presentBtn = document.getElementById("presentBtn");

// It is also possible to use relative presentation URL e.g. "presentation.html"
const presUrls = [
  "https://example.com/presentation.html",
  "https://example.net/alternate.html",
];

// Show or hide present button depending on display availability
const handleAvailabilityChange = (available) => {
  if (available) {
    presentBtn.classList.remove("hidden");
  } else {
    presentBtn.classList.add("hidden");
  }
};

// Promise is resolved as soon as the presentation display availability is known.
const request = new PresentationRequest(presUrls);
request
  .getAvailability()
  .then((availability) => {
    handleAvailabilityChange(availability.value);
    availability.onchange = () => {
      handleAvailabilityChange(availability.value);
    };
  })
  .catch(() => {
    handleAvailabilityChange(true);
  });
```

### Bắt đầu trình chiếu mới

Trong `controller.html`:

```js
presentBtn.onclick = () => {
  // Start new presentation.
  request
    .start()
    // The connection to the presentation will be passed to setConnection on success.
    .then(setConnection);
  // Otherwise, the user canceled the selection dialog or no screens were found.
};
```

### Kết nối lại với trình chiếu

Trong tệp `controller.html`:

```html
<button id="reconnectBtn" class="hidden">Reconnect</button>
```

```js
const reconnect = () => {
  const presId = localStorage.getItem("presId");
  // presId is mandatory when reconnecting to a presentation.
  if (presId) {
    request.reconnect(presId).then(setConnection);
  }
};
// On navigation of the controller, reconnect automatically.
reconnect();
// Or allow manual reconnection.
reconnectBtn.onclick = reconnect;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Presentation API polyfill](https://mediascape.github.io/presentation-api-polyfill/) chứa một JavaScript polyfill của đặc tả [Presentation API](https://w3c.github.io/presentation-api/).
