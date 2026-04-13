---
title: "FontFace: phương thức load()"
short-title: load()
slug: Web/API/FontFace/load
page-type: web-api-instance-method
browser-compat: api.FontFace.load
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Phương thức **`load()`** của giao diện {{domxref("FontFace")}} yêu cầu và tải font có `source` được chỉ định dưới dạng URL. Phương thức trả về {{jsxref('Promise')}} resolve với đối tượng `FontFace` hiện tại.

Nếu `source` của font face được chỉ định dưới dạng dữ liệu nhị phân, hoặc thuộc tính {{domxref("FontFace/status", "status")}} không phải là `unloaded`, phương thức này không làm gì.

## Cú pháp

```js-nolint
load()
```

### Tham số

Không có.

### Giá trị trả về

{{jsxref('Promise')}} resolve với tham chiếu đến đối tượng `FontFace` hiện tại khi font tải xong, hoặc reject với `NetworkError` {{domxref("DOMException")}} nếu quá trình tải thất bại.

### Ngoại lệ

- `NetworkError` {{domxref("DOMException")}}
  - : Cho biết việc tải font đã thất bại.

## Ví dụ

Ví dụ đơn giản này tải font và dùng nó để hiển thị văn bản trong canvas (với id là `js-canvas`).

```html hidden
<canvas id="js-canvas"></canvas>
```

```js
const canvas = document.getElementById("js-canvas");

// tải font "Bitter" từ Google Fonts
const fontFile = new FontFace(
  "FontFamily Style Bitter",
  'url("https://fonts.gstatic.com/s/bitter/v7/HEpP8tJXlWaYHimsnXgfCOvvDin1pK8aKteLpeZ5c0A.woff2")',
);
document.fonts.add(fontFile);

fontFile.load().then(
  () => {
    // font đã tải thành công!
    canvas.width = 650;
    canvas.height = 100;
    const ctx = canvas.getContext("2d");

    ctx.font = '36px "FontFamily Style Bitter"';
    ctx.fillText("Bitter font loaded", 20, 50);
  },
  (err) => {
    console.error(err);
  },
);
```

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
