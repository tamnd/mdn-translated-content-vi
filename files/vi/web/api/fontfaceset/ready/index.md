---
title: "FontFaceSet: thuộc tính ready"
short-title: ready
slug: Web/API/FontFaceSet/ready
page-type: web-api-instance-property
browser-compat: api.FontFaceSet.ready
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `ready` của giao diện {{domxref("FontFaceSet")}} trả về {{jsxref("Promise")}} resolve với {{domxref("FontFaceSet")}} đã cho.

Promise chỉ resolve sau khi tài liệu hoàn tất tải font, các thao tác bố cục trang hoàn thành, và không cần tải thêm font nào nữa.

## Giá trị

{{jsxref("Promise")}} resolve với {{domxref("FontFaceSet")}} đã cho.

## Ví dụ

Trong ví dụ sau, giá trị của `ready` được in ra console sau khi promise resolve.

```js
async function isReady() {
  let ready = await document.fonts.ready;
  console.log(ready);
}

isReady();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
