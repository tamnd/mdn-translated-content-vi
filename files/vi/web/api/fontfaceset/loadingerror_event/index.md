---
title: "FontFaceSet: sự kiện loadingerror"
short-title: loadingerror
slug: Web/API/FontFaceSet/loadingerror_event
page-type: web-api-event
browser-compat: api.FontFaceSet.loadingerror_event
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Sự kiện `loadingerror` kích hoạt khi font đã tải xong nhưng một số hoặc tất cả font tải thất bại.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính event handler.

```js-nolint
addEventListener("loadingerror", (event) => { })

onloadingerror = (event) => { }
```

## Ví dụ

Trong ví dụ sau, nếu font `Ephesis` tải thất bại, "Font loading error" được in ra console.

```js
document.fonts.onloadingerror = () => {
  console.log("Font loading error");
};

(async () => {
  await document.fonts.load("16px Ephesis");
})();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
