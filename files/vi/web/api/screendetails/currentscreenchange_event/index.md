---
title: "ScreenDetails: currentscreenchange event"
short-title: currentscreenchange
slug: Web/API/ScreenDetails/currentscreenchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ScreenDetails.currentscreenchange_event
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`currentscreenchange`** của giao diện {{domxref("ScreenDetails")}} được kích hoạt khi {{domxref("ScreenDetails.currentScreen")}} thay đổi theo một trong các cách sau:

- Màn hình hiện tại thay đổi thành một màn hình khác, tức là cửa sổ trình duyệt hiện tại được di chuyển sang màn hình khác.
- Một hoặc nhiều thuộc tính sau thay đổi trên màn hình hiện tại:
  - {{domxref("Screen.width", "width")}}
  - {{domxref("Screen.height", "height")}}
  - {{domxref("Screen.availWidth", "availWidth")}}
  - {{domxref("Screen.availHeight", "availHeight")}}
  - {{domxref("Screen.colorDepth", "colorDepth")}}
  - {{domxref("Screen.orientation", "orientation")}}
- Một hoặc nhiều giá trị sau thay đổi:
  - **Vị trí** của màn hình (tọa độ (x,y) của góc trên bên trái) trong sắp xếp màn hình ảo của hệ điều hành, tương đối với [multi-screen origin](/en-US/docs/Web/API/Window_Management_API/Multi-screen_origin)
  - **Vị trí có sẵn** của màn hình (tọa độ (x,y) của góc trên bên trái) trong sắp xếp màn hình ảo của hệ điều hành, tương đối với [multi-screen origin](/en-US/docs/Web/API/Window_Management_API/Multi-screen_origin). Điều này bằng vị trí màn hình, cộng thêm chiều rộng/chiều cao của các phần tử giao diện hệ điều hành được vẽ ở góc trên bên trái của màn hình, cửa sổ không thể đặt trong những khu vực đó.
  - {{domxref("ScreenDetailed.devicePixelRatio", "devicePixelRatio")}}
  - {{domxref("ScreenDetailed.label", "label")}}
  - Màn hình được chỉ định là primary hay secondary (xem {{domxref("ScreenDetailed.isPrimary", "isPrimary")}})
  - Màn hình được chỉ định là internal hay external (xem {{domxref("ScreenDetailed.isInternal", "isInternal")}})

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("currentscreenchange", (event) => { })

oncurrentscreenchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
const screenDetails = await window.getScreenDetails();
screenDetails.addEventListener("currentscreenchange", (event) => {
  const details = screenDetails.currentScreen;
  console.log("The current screen has changed.", event, details);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
