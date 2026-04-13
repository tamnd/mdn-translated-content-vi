---
title: "ScreenDetails: screenschange event"
short-title: screenschange
slug: Web/API/ScreenDetails/screenschange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ScreenDetails.screenschange_event
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`screenschange`** của giao diện {{domxref("ScreenDetails")}} được kích hoạt khi tập hợp các màn hình có sẵn cho hệ thống thay đổi: tức là một màn hình mới trở nên khả dụng hoặc một màn hình hiện có trở nên không khả dụng. Điều này sẽ được phản ánh trong sự thay đổi của mảng {{domxref("ScreenDetails.screens", "screens")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("screenschange", (event) => { })

onscreenschange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Bạn có thể sử dụng sự kiện `screenschange` để phát hiện khi màn hình có sẵn thay đổi, báo cáo sự thay đổi, đóng tất cả các cửa sổ, rồi mở lại chúng để phù hợp với cấu hình mới:

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
