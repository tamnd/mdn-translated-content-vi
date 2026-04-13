---
title: "FontFaceSet: sự kiện loading"
short-title: loading
slug: Web/API/FontFaceSet/loading_event
page-type: web-api-event
browser-compat: api.FontFaceSet.loading_event
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Sự kiện `loading` kích hoạt khi tài liệu bắt đầu tải font.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính event handler.

```js-nolint
addEventListener("loading", (event) => { })

onloading = (event) => { }
```

## Ví dụ

Trong ví dụ sau, khi font `Ephesis` bắt đầu tải, "Font is loading…" được in ra console.

```js
document.fonts.onloading = () => {
  console.log("Font is loading");
};

(async () => {
  await document.fonts.load("16px Ephesis");
})();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
