---
title: ScreenDetails
slug: Web/API/ScreenDetails
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ScreenDetails
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`ScreenDetails`** của [Window Management API](/en-US/docs/Web/API/Window_Management_API) đại diện cho thông tin chi tiết về tất cả các màn hình có sẵn cho thiết bị của người dùng.

Thông tin này được truy cập qua phương thức {{domxref("Window.getScreenDetails()")}}.

> [!NOTE]
> `ScreenDetails` là một đối tượng trực tiếp, có nghĩa là nó cập nhật khi các màn hình có sẵn thay đổi. Do đó, bạn có thể tiếp tục truy vấn cùng một đối tượng để nhận các giá trị cập nhật, thay vì gọi `getScreenDetails()` nhiều lần.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ đối tượng cha, {{DOMxRef("EventTarget")}}._

- {{domxref("ScreenDetails.currentScreen", "currentScreen")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một đối tượng {{domxref("ScreenDetailed")}} đơn đại diện cho thông tin chi tiết về màn hình mà cửa sổ trình duyệt hiện tại đang hiển thị.

- {{domxref("ScreenDetails.screens", "screens")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một mảng các đối tượng {{domxref("ScreenDetailed")}}, mỗi đối tượng đại diện cho thông tin chi tiết về một màn hình cụ thể có sẵn cho thiết bị của người dùng.

    > [!NOTE]
    > `screens` chỉ bao gồm các màn hình "mở rộng", không bao gồm những màn hình phản chiếu màn hình khác.

## Sự kiện

- {{domxref("ScreenDetails.currentscreenchange_event", "currentscreenchange")}} {{experimental_inline}}
  - : Được kích hoạt khi màn hình hiện tại của cửa sổ thay đổi theo cách nào đó, ví dụ: chiều rộng hoặc chiều cao có sẵn, hoặc hướng.
- {{domxref("ScreenDetails.screenschange_event", "screenschange")}} {{experimental_inline}}
  - : Được kích hoạt khi màn hình được kết nối hoặc ngắt kết nối khỏi hệ thống.

## Ví dụ

> [!NOTE]
> Xem [Multi-window learning environment](https://mdn.github.io/dom-examples/window-management-api/) để có ví dụ đầy đủ (xem thêm [mã nguồn](https://github.com/mdn/dom-examples/tree/main/window-management-api)).

### Truy cập thông tin màn hình cơ bản

Khi {{domxref("Window.getScreenDetails()")}} được gọi, người dùng sẽ được yêu cầu cấp quyền quản lý cửa sổ trên tất cả các màn hình của họ (trạng thái quyền này có thể kiểm tra bằng {{domxref("Permissions.query()")}} để truy vấn `window-management`). Nếu người dùng cấp quyền, một đối tượng `ScreenDetails` sẽ được trả về. Đối tượng này chứa thông tin chi tiết về tất cả các màn hình có sẵn cho hệ thống của người dùng.

Ví dụ dưới đây mở một cửa sổ toàn màn hình trên mỗi màn hình có sẵn.

```js
const screenDetails = await window.getScreenDetails();

// Mở một cửa sổ trên mỗi màn hình của thiết bị
for (const screen of screenDetails.screens) {
  openWindow(
    screen.availLeft,
    screen.availTop,
    screen.availWidth,
    screen.availHeight,
    url,
  );
}
```

### Phản hồi với các thay đổi trong màn hình có sẵn

Bạn có thể dùng sự kiện `screenschange` để phát hiện khi màn hình có sẵn thay đổi (có thể khi màn hình được cắm vào hoặc rút ra), báo cáo sự thay đổi và cập nhật sắp xếp cửa sổ để phù hợp với cấu hình mới:

```js
const screenDetails = await window.getScreenDetails();

// Trả về số lượng màn hình
let noOfScreens = screenDetails.screens.length;

screenDetails.addEventListener("screenschange", () => {
  // Nếu số màn hình mới khác với số màn hình cũ, báo cáo sự khác biệt
  if (screenDetails.screens.length !== noOfScreens) {
    console.log(
      `The screen count changed from ${noOfScreens} to ${screenDetails.screens.length}`,
    );

    // Cập nhật giá trị noOfScreens
    noOfScreens = screenDetails.screens.length;
  }

  // Mở, đóng hoặc sắp xếp lại cửa sổ khi cần để phù hợp với cấu hình màn hình mới
  updateWindows();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
