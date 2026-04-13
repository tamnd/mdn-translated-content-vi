---
title: "HTMLElement: sự kiện load"
short-title: load
slug: Web/API/HTMLElement/load_event
page-type: web-api-event
browser-compat: api.HTMLElement.load_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`load`** kích hoạt với các phần tử chứa tài nguyên khi tài nguyên đã tải thành công. Hiện tại, danh sách các phần tử HTML được hỗ trợ bao gồm: {{HTMLElement("body")}}, {{HTMLElement("embed")}}, {{HTMLElement("iframe")}}, {{HTMLElement("img")}}, {{HTMLElement("link")}}, {{HTMLElement("object")}}, {{HTMLElement("script")}}, {{HTMLElement("style")}} và {{HTMLElement("track")}}.

> [!NOTE]
> Sự kiện `load` trên {{domxref("HTMLBodyElement#event_handlers", "HTMLBodyElement")}} thực chất là bí danh của sự kiện {{domxref("Window/load_event", "window.onload")}}. Do đó, sự kiện `load` chỉ kích hoạt trên phần tử `<body>` sau khi tất cả tài nguyên của tài liệu đã tải hoặc gặp lỗi. Tuy nhiên, để rõ ràng hơn, nên gắn trình xử lý sự kiện trực tiếp vào đối tượng `window` thay vì trên `HTMLBodyElement`.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("load", (event) => { })

onload = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này in ra màn hình mỗi khi phần tử {{HtmlElement("img")}} tải thành công tài nguyên của nó.

### HTML

```html
<img
  id="image"
  src="/shared-assets/images/examples/favicon144.png"
  alt="MDN logo"
  width="72" />
<div><button>Reload</button></div>
```

### JavaScript

```js
const image = document.getElementById("image");
image.onload = () => {
  document.body.appendChild(document.createElement("div")).textContent =
    "loaded!";
};

document.querySelector("button").addEventListener("click", reload);

function reload() {
  image.src = "/shared-assets/images/examples/favicon144.png";
}
```

### Kết quả

{{EmbedLiveSample("Example", "100%", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan
  - Window: sự kiện {{domxref("Window/load_event", "load")}}
  - Window: sự kiện {{domxref("Window/error_event", "error")}}
