---
title: Window Management API
slug: Web/API/Window_Management_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Window.getScreenDetails
spec-urls: https://w3c.github.io/window-management/
---

{{SeeCompatTable}}{{DefaultAPISidebar("Window Management API")}}

**Window Management API** cho phép bạn lấy thông tin chi tiết về các màn hình được kết nối với thiết bị của mình và dễ dàng đặt cửa sổ trên các màn hình cụ thể, mở đường cho các ứng dụng đa màn hình hiệu quả hơn.

## Khái niệm và cách sử dụng

Trước đây, chúng ta đã sử dụng {{domxref("Window.open()")}} để quản lý các cửa sổ trình duyệt liên quan đến ứng dụng hiện tại, bao gồm mở cửa sổ mới, thay đổi kích thước và đóng cửa sổ hiện có, v.v. Ví dụ, để mở cửa sổ 400×300 cách cạnh trái và trên của màn hình 50 pixel:

```js
const myWindow = window.open(
  "https://example.com/",
  "myWindow",
  "left=50,top=50,width=400,height=300",
);
```

Bạn có thể lấy thông tin về màn hình của mình từ thuộc tính {{domxref("Window.screen")}}, chẳng hạn như không gian màn hình có sẵn để đặt cửa sổ.

Tuy nhiên, các tính năng trên còn hạn chế. `Window.screen` chỉ trả về dữ liệu về màn hình chính, không bao gồm màn hình phụ có thể có trên thiết bị. Để di chuyển cửa sổ sang màn hình phụ, bạn có thể dùng {{domxref("Window.moveTo()")}}, nhưng bạn phải đoán tọa độ dựa trên vị trí của nó tương đối với màn hình chính trong thiết lập của bạn.

Window Management API cung cấp khả năng quản lý cửa sổ mạnh mẽ và linh hoạt hơn. Nó cho phép bạn truy vấn xem màn hình có được mở rộng với nhiều màn hình hay không và lấy thông tin về từng màn hình riêng biệt: các cửa sổ có thể được đặt trên từng màn hình theo ý muốn. Nó cũng cung cấp trình xử lý sự kiện để phản hồi các thay đổi trên màn hình có sẵn, chức năng toàn màn hình mới để chọn màn hình nào sẽ chuyển sang chế độ toàn màn hình (nếu có) và chức năng quyền để kiểm soát quyền truy cập API.

Để biết chi tiết cách sử dụng, xem [Sử dụng Window Management API](/en-US/docs/Web/API/Window_Management_API/Using).

> [!NOTE]
> Trong các trình duyệt hiện đại, mỗi lần gọi `Window.open()` đều yêu cầu một sự kiện cử chỉ người dùng riêng biệt vì mục đích bảo mật. Điều này ngăn các trang web spam người dùng với nhiều cửa sổ. Tuy nhiên, điều này gây ra vấn đề cho các ứng dụng đa cửa sổ. Để giải quyết vấn đề này, bạn có thể thiết kế ứng dụng để mở không quá một cửa sổ mới cùng lúc, tái sử dụng cửa sổ hiện có để hiển thị các trang khác nhau, hoặc hướng dẫn người dùng cách cập nhật cài đặt trình duyệt để cho phép nhiều cửa sổ.

### Trường hợp sử dụng

Window Management API hữu ích trong các trường hợp như:

- Trình chỉnh sửa đồ họa và bộ xử lý âm thanh đa cửa sổ, có thể muốn sắp xếp các công cụ chỉnh sửa và bảng điều khiển trên các màn hình khác nhau.
- Bàn giao dịch ảo muốn hiển thị xu hướng thị trường trong nhiều cửa sổ và đặt các cửa sổ cụ thể vào chế độ toàn màn hình.
- Ứng dụng trình chiếu muốn hiển thị ghi chú diễn giả trên màn hình chính bên trong và bài thuyết trình trên máy chiếu bên ngoài.

## Tích hợp Permissions Policy

{{httpheader("Permissions-Policy/window-management", "window-management")}} [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) có thể được sử dụng để kiểm soát quyền sử dụng Window Management API. Cụ thể:

- Việc sử dụng phương thức {{domxref("Window.getScreenDetails()")}}. Nếu bị chặn, {{jsxref("Promise")}} của nó sẽ từ chối với ngoại lệ `NotAllowedError`.
- Truy vấn thuộc tính {{domxref("Screen.isExtended", "Window.screen.isExtended")}}. Nếu bị chặn, nó sẽ luôn trả về `false`.

Các nhà phát triển có thể cấp quyền rõ ràng cho {{htmlelement("iframe")}} sử dụng Window Management thông qua thuộc tính `allow`:

```html
<iframe src="3rd-party.example" allow="window-management"></iframe>
```

## Giao diện

- {{domxref("ScreenDetails")}} {{securecontext_inline}}
  - : Đại diện cho thông tin chi tiết của tất cả màn hình có sẵn cho thiết bị của người dùng.
- {{domxref("ScreenDetailed")}} {{securecontext_inline}}
  - : Đại diện cho thông tin chi tiết về một màn hình cụ thể có sẵn cho thiết bị của người dùng.

### Mở rộng sang các giao diện khác

- Sự kiện `Screen` {{domxref("Screen.change_event", "change")}} {{securecontext_inline}}
  - : Kích hoạt trên một màn hình cụ thể khi màn hình đó thay đổi theo một cách nào đó, ví dụ như chiều rộng hoặc chiều cao khả dụng, hoặc hướng màn hình.
- {{domxref("Screen.isExtended")}} {{securecontext_inline}}
  - : Thuộc tính boolean trả về `true` nếu thiết bị của người dùng có nhiều màn hình, và `false` nếu không.
- {{domxref("Element.requestFullscreen()")}}, tùy chọn `screen`
  - : Chỉ định màn hình nào bạn muốn đặt phần tử vào chế độ toàn màn hình.
- {{domxref("Window.getScreenDetails()")}} {{securecontext_inline}}
  - : Trả về một {{jsxref("Promise")}} thực hiện với một phiên bản đối tượng {{domxref("ScreenDetails")}}.

## Ví dụ

Bạn có thể tìm thấy các ví dụ đầy đủ tại đây:

- [Môi trường học đa cửa sổ cơ bản](https://mdn.github.io/dom-examples/window-management-api/) (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/window-management-api)).
- [Trò chơi Platformer đa cửa sổ](https://googlechromelabs.github.io/multi-window-platformer-game/) (xem [mã nguồn](https://github.com/googlechromelabs/multi-window-platformer-game)).
- [Demo đặt cửa sổ](https://michaelwasserman.github.io/window-placement-demo/) (xem [mã nguồn](https://github.com/michaelwasserman/window-placement-demo)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
