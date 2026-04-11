---
title: "FontFaceSet: sự kiện loadingdone"
short-title: loadingdone
slug: Web/API/FontFaceSet/loadingdone_event
page-type: web-api-event
browser-compat: api.FontFaceSet.loadingdone_event
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Sự kiện `loadingdone` kích hoạt khi tài liệu đã tải xong tất cả font.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính event handler.

```js-nolint
addEventListener("loadingdone", (event) => { })

onloadingdone = (event) => { }
```

## Ví dụ

Trong ví dụ sau, khi font `Ephesis` tải xong, "Font loading complete" được in ra console.

```js
document.fonts.onloadingdone = () => {
  console.log("Font loading complete");
};

(async () => {
  await document.fonts.load("16px Ephesis");
})();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
