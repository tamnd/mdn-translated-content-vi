---
title: "FontFace: thuộc tính loaded"
short-title: loaded
slug: Web/API/FontFace/loaded
page-type: web-api-instance-property
browser-compat: api.FontFace.loaded
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`loaded`** của giao diện {{domxref("FontFace")}} trả về {{jsxref('Promise')}} resolve với đối tượng `FontFace` hiện tại khi font được chỉ định trong constructor xong tải, hoặc reject với `SyntaxError`.

## Giá trị

{{jsxref('Promise')}} resolve với đối tượng `FontFace` hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
