---
title: "MediaQueryList: phương thức addListener()"
short-title: addListener()
slug: Web/API/MediaQueryList/addListener
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.MediaQueryList.addListener
---

{{APIRef("CSSOM view API")}}{{Deprecated_Header}}

Phương thức đã lỗi thời **`addListener()`** của giao diện {{DOMxRef("MediaQueryList")}} thêm trình lắng nghe vào `MediaQueryListener` sẽ chạy hàm callback tùy chỉnh để phản hồi khi trạng thái media query thay đổi.

Trong các trình duyệt cũ, `MediaQueryList` chưa kế thừa từ {{DOMxRef("EventTarget")}}, vì vậy phương thức này được cung cấp như một bí danh của {{DOMxRef("EventTarget.addEventListener()")}}. Dùng `addEventListener()` thay vì `addListener()` nếu nó có sẵn trong các trình duyệt bạn cần hỗ trợ.

## Cú pháp

```js-nolint
addListener(func)
```

### Tham số

- `func`
  - : Một hàm hoặc tham chiếu hàm đại diện cho hàm callback bạn muốn chạy khi trạng thái media query thay đổi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const paragraph = document.querySelector("p");
const mediaQueryList = window.matchMedia("(width <= 600px)");

function screenTest(e) {
  if (e.matches) {
    /* the viewport is 600 pixels wide or less */
    paragraph.textContent = "This is a narrow screen — 600px wide or less.";
    document.body.style.backgroundColor = "pink";
  } else {
    /* the viewport is more than 600 pixels wide */
    paragraph.textContent = "This is a wide screen — more than 600px wide.";
    document.body.style.backgroundColor = "aquamarine";
  }
}

mediaQueryList.addListener(screenTest);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Sử dụng media query từ code](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
- {{DOMxRef("window.matchMedia()")}}
- {{DOMxRef("MediaQueryList")}}
- {{DOMxRef("MediaQueryListEvent")}}
