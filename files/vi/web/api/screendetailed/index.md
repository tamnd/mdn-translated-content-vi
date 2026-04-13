---
title: ScreenDetailed
slug: Web/API/ScreenDetailed
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ScreenDetailed
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`ScreenDetailed`** của [Window Management API](/en-US/docs/Web/API/Window_Management_API) đại diện cho thông tin chi tiết về một màn hình cụ thể có sẵn trên thiết bị của người dùng.

Các đối tượng `ScreenDetailed` có thể được truy cập thông qua thuộc tính {{domxref("ScreenDetails.screens")}} và {{domxref("ScreenDetails.currentScreen")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("Screen")}}._

- {{domxref("ScreenDetailed.availLeft", "availLeft")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho tọa độ x (cạnh trái) của vùng màn hình khả dụng.
- {{domxref("ScreenDetailed.availTop", "availTop")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho tọa độ y (cạnh trên) của vùng màn hình khả dụng.
- {{domxref("ScreenDetailed.devicePixelRatio", "devicePixelRatio")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho tỷ lệ pixel thiết bị của màn hình.
- {{domxref("ScreenDetailed.isInternal", "isInternal")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị boolean cho biết màn hình là nội bộ của thiết bị hay bên ngoài.
- {{domxref("ScreenDetailed.isPrimary", "isPrimary")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị boolean cho biết màn hình có được đặt làm màn hình chính của hệ điều hành (OS) hay không.
- {{domxref("ScreenDetailed.label", "label")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi cung cấp nhãn mô tả cho màn hình, ví dụ "Built-in Retina Display".
- {{domxref("ScreenDetailed.left", "left")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho tọa độ x (cạnh trái) của toàn bộ vùng màn hình.
- {{domxref("ScreenDetailed.top", "top")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho tọa độ y (cạnh trên) của toàn bộ vùng màn hình.

## Sự kiện

_Kế thừa các sự kiện từ lớp cha, {{DOMxRef("Screen")}}._

- `change` {{experimental_inline}}
  - : Được kích hoạt trên một màn hình cụ thể khi bất kỳ thuộc tính nào của màn hình thay đổi, bao gồm chiều rộng hoặc chiều cao, chiều rộng khả dụng hoặc chiều cao khả dụng, độ sâu màu, hướng, vị trí màn hình, tỷ lệ pixel thiết bị, nhãn hoặc chỉ định màn hình.

## Ví dụ

Khi {{domxref("Window.getScreenDetails()")}} được gọi, người dùng sẽ được yêu cầu cấp quyền quản lý cửa sổ trên tất cả các màn hình (trạng thái quyền này có thể kiểm tra bằng {{domxref("Permissions.query()")}} với `window-management`). Nếu được cấp quyền, đối tượng {{domxref("ScreenDetails")}} kết quả chứa các đối tượng `ScreenDetailed` đại diện cho tất cả các màn hình có sẵn trên hệ thống của người dùng.

Ví dụ sau mở một cửa sổ ở góc trên bên trái của màn hình chính của OS:

```js
// Return ScreenDetails
const allScreens = await window.getScreenDetails();

// Return the primary screen ScreenDetailed object
const primaryScreenDetailed = allScreens.screens.find(
  (screenDetailed) => screenDetailed.isPrimary,
);

// Open a window in the top-left corner of the OS primary screen
window.open(
  "https://example.com",
  "_blank",
  `left=${primaryScreenDetailed.availLeft},
   top=${primaryScreenDetailed.availTop},
   width=200,
   height=200`,
);
```

> [!NOTE]
> Xem [Multi-window learning environment](https://mdn.github.io/dom-examples/window-management-api/) để có ví dụ đầy đủ (xem thêm [mã nguồn](https://github.com/mdn/dom-examples/tree/main/window-management-api)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
