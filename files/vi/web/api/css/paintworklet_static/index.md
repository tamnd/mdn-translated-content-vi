---
title: "CSS: thuộc tính tĩnh paintWorklet"
short-title: paintWorklet
slug: Web/API/CSS/paintWorklet_static
page-type: web-api-static-property
status:
  - experimental
browser-compat: api.CSS.paintWorklet_static
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc tĩnh **`paintWorklet`** của giao diện {{DOMxRef("CSS")}} cung cấp quyền truy cập vào [worklet](/en-US/docs/Web/API/Worklet) vẽ, nơi tạo ảnh theo cách lập trình ở những nơi một thuộc tính CSS mong đợi một tệp.

## Giá trị

Đối tượng {{DOMxRef('Worklet')}} liên kết.

## Ví dụ

Ví dụ sau minh họa cách tải một [worklet](/en-US/docs/Web/API/Worklet) vẽ từ tệp js của nó và thực hiện việc này bằng cách phát hiện tính năng.

```js
if ("paintWorklet" in CSS) {
  CSS.paintWorklet.addModule("checkerboard.js");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
